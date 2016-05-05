//
//  ProductsViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/26.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ProductsViewController.h"

#import "HomeCell.h"

@interface ProductsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UIView *chooseView;
@property (nonatomic,strong) UITableView *productsTableView;

@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"所有产品";
 
    [self.view addSubview:self.chooseView];
    [self.view addSubview:self.productsTableView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        [self.chooseView autoPinEdgeToSuperviewMargin:ALEdgeTop];
        [self.chooseView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.chooseView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.chooseView autoSetDimension:ALDimensionHeight toSize:60];
        
        [self.productsTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.chooseView];
        [self.productsTableView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.productsTableView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.productsTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:49];
        
        
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
        _productsTableView.delegate = self;
        _productsTableView.dataSource = self;
        _productsTableView.tableFooterView = [[UIView alloc] init];
        _productsTableView.backgroundColor = kBackColor;
        _productsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _productsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
        _productsTableView.tableFooterView.backgroundColor = kBackColor;
    }
    return _productsTableView;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [HomeCell cellWithTableView:tableView];
    
    [cell.cellView.recommendimageView setHidden:YES];
//    cell.cellView.typeLabel.text = @"申请中";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
