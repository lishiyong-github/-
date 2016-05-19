//
//  ProductsViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/26.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ProductsViewController.h"
#import "ProductsDetailsViewController.h"   //详细信息

#import "HomeCell.h"
#import "UIImage+Color.h"
#import "UIButton+Addition.h"
#import "AllProView.h"

@interface ProductsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIButton *proTitleView;
@property (nonatomic,strong) AllProView *proTitleAllView;

@property (nonatomic,strong) UIView *chooseView;
@property (nonatomic,strong) UITableView *productsTableView;

@end

@implementation ProductsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:kBlackColor,NSFontAttributeName:kNavFont}];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:kNavColor] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.proTitleView;

    [self.view addSubview:self.chooseView];
    [self.view addSubview:self.productsTableView];
    
    [self.view setNeedsUpdateConstraints];
}

- (UIButton *)proTitleView
{
    if (!_proTitleView) {
        _proTitleView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        [_proTitleView swapImage];
        [_proTitleView setTitle:@"所有产品 " forState:0];
        [_proTitleView setTitleColor:kBlackColor forState:0];
        _proTitleView.titleLabel.font = kNavFont;
        [_proTitleView setImage:[UIImage imageNamed:@"nav_more"] forState:0];
        QDFWeakSelf;
        [_proTitleView addAction:^(UIButton *btn) {

            
        }];
    }
    return _proTitleView;
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.chooseView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.chooseView autoSetDimension:ALDimensionHeight toSize:40];
        
        [self.productsTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.chooseView];
        [self.productsTableView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.productsTableView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.productsTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTabBarHeight];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UIView *)chooseView
{
    if (!_chooseView) {
        _chooseView = [UIView newAutoLayoutView];
        _chooseView.backgroundColor = kRedColor;
    }
    return _chooseView;
}

- (UITableView *)productsTableView
{
    if (!_productsTableView) {
        _productsTableView = [UITableView newAutoLayoutView];
        _productsTableView.translatesAutoresizingMaskIntoConstraints = YES;
        _productsTableView = [[UITableView alloc ]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _productsTableView.delegate = self;
        _productsTableView.dataSource = self;
        _productsTableView.backgroundColor = kBackColor;
        _productsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    }
    return _productsTableView;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 156;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"pros";
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell.recommendimageView setHidden:YES];

    UIView *cellBackView = [[UIView alloc] initWithFrame:CGRectMake(0, kBigPadding, kScreenWidth, 156)];
    cellBackView.backgroundColor = kSeparateColor;
    cell.selectedBackgroundView = cellBackView;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ProductsDetailsViewController *productsDetailsVC = [[ProductsDetailsViewController alloc] init];
    productsDetailsVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:productsDetailsVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kBigPadding;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
