//
//  ProductsDetailsViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/16.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ProductsDetailsViewController.h"
#import "ProductsDetailsProViewController.h"   //产品信息
#import "ProductsDetailsPerViewController.h"   //发布人信息

#import "UIImage+Color.h"
#import "MineUserCell.h"
#import "UIButton+Addition.h"
#import "BaseCommitButton.h"
#import "ProDetailHeadView.h"

@interface ProductsDetailsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIButton *leftItemButton;
@property (nonatomic,strong) UIButton *rightItemButton;
@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *productsDetailsTableView;
@property (nonatomic,strong) ProDetailHeadView *proDetailHeaderView;
@property (nonatomic,strong) BaseCommitButton *proDetailsCommitButton;

@end

@implementation ProductsDetailsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:kNavColor,NSFontAttributeName:kNavFont}];

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x42566d)] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置导航条的字体颜色
    self.navigationItem.title = @"RZ201605160001";
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftItemButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightItemButton];
    
    self.view.backgroundColor = kBackColor;
    
    [self.view addSubview:self.productsDetailsTableView];
    [self.view addSubview:self.proDetailsCommitButton];
    [self.view setNeedsUpdateConstraints];
}

- (UIButton *)leftItemButton
{
    if (!_leftItemButton) {
        _leftItemButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [_leftItemButton setImage:[UIImage imageNamed:@"nav_back"] forState:0];
        QDFWeakSelf;
        [_leftItemButton addAction:^(UIButton *btn) {
            [weakself.navigationController popViewControllerAnimated:YES];
        }];
    }
    return _leftItemButton;
}

- (UIButton *)rightItemButton
{
    if (!_rightItemButton) {
        _rightItemButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [_rightItemButton setImage:[UIImage imageNamed:@"nav_collection"] forState:0];
        [_rightItemButton setImage:[UIImage imageNamed:@"nav_collection_s"] forState:UIControlStateSelected];
        [_rightItemButton addAction:^(UIButton *btn) {
            btn.selected = !btn.selected;
        }];
    }
    return _rightItemButton;
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.productsDetailsTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.productsDetailsTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTabBarHeight];
        
        [self.proDetailsCommitButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.proDetailsCommitButton autoSetDimension:ALDimensionHeight toSize:kTabBarHeight];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)productsDetailsTableView
{
    if (!_productsDetailsTableView) {
        _productsDetailsTableView = [UITableView newAutoLayoutView];
        _productsDetailsTableView.delegate = self;
        _productsDetailsTableView.dataSource = self;
        _productsDetailsTableView.tableFooterView = [[UIView alloc] init];
        _productsDetailsTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 160)];
        [_productsDetailsTableView.tableHeaderView addSubview:self.proDetailHeaderView];
        _productsDetailsTableView.backgroundColor = kBackColor;
    }
    return _productsDetailsTableView;
}

- (ProDetailHeadView *)proDetailHeaderView
{
    if (!_proDetailHeaderView) {
        _proDetailHeaderView = [[ProDetailHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 160)];
        _proDetailHeaderView.backgroundColor = kGrayColor;
    }
    return _proDetailHeaderView;
}

- (BaseCommitButton *)proDetailsCommitButton
{
    if (!_proDetailsCommitButton) {
        _proDetailsCommitButton = [BaseCommitButton newAutoLayoutView];
        [_proDetailsCommitButton setTitle:@"立即申请" forState:0
         ];
    }
    return _proDetailsCommitButton;
}

#pragma mark - tableView deleagate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"proDetais";
    MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSMutableDictionary *dataDic = [[NSMutableDictionary alloc] initWithObjects:@[@"  产品信息",@"  发布人信息"] forKeys:@[@"list_icon_product",@"list_icon_user"]];

    [cell.userNameButton setImage:[UIImage imageNamed:dataDic.allKeys[indexPath.row]] forState:0];
    [cell.userNameButton setTitle:dataDic.allValues[indexPath.row] forState:0];
    [cell.userActionButton setImage:[UIImage imageNamed:@"list_more"] forState:0];
    
    if (indexPath.row == 1) {
        [cell.userActionButton setTitleColor:kYellowColor forState:0];
        [cell.userActionButton setTitle:@"已认证" forState:0];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kBigPadding;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    headView.backgroundColor = kBackColor;
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        ProductsDetailsProViewController *productsDetailsProVC = [[ProductsDetailsProViewController alloc] init];
        [self.navigationController pushViewController:productsDetailsProVC animated:YES];
    }else{
        ProductsDetailsPerViewController *productsDetailsPerVC = [[ProductsDetailsPerViewController alloc] init];
        [self.navigationController pushViewController:productsDetailsPerVC animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
