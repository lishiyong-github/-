//
//  MyOrderViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/3.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyOrderViewController.h"
#import "MyApplyingViewController.h"    //申请中
#import "MyProcessingViewController.h"  //处理中
#import "MyEndingViewController.h"      //终止
#import "MyClosingViewController.h"     //结案

#import "MyScheduleViewController.h"   //填写进度
#import "AdditionalEvaluateViewController.h"  //去评价

#import "AnotherHomeCell.h"
#import "AllProSegView.h"

@interface MyOrderViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) AllProSegView *orderHeadView;
@property (nonatomic,strong) UITableView *myOrderTableView;

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的接单";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.orderHeadView];
    [self.view addSubview:self.myOrderTableView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.orderHeadView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
        [self.orderHeadView autoSetDimension:ALDimensionHeight toSize:40];
        
        [self.myOrderTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.orderHeadView];
        [self.myOrderTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (AllProSegView *)orderHeadView
{
    if (!_orderHeadView) {
        _orderHeadView = [AllProSegView newAutoLayoutView];
        _orderHeadView.backgroundColor = kRedColor;
    }
    return _orderHeadView;
}

- (UITableView *)myOrderTableView
{
    if (!_myOrderTableView) {
        _myOrderTableView = [UITableView newAutoLayoutView];
        _myOrderTableView.delegate = self;
        _myOrderTableView.dataSource = self;
        _myOrderTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
        _myOrderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myOrderTableView.backgroundColor = kBackColor;
    }
    return _myOrderTableView;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    static NSString *identifier = @"myOrderList";
    AnotherHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AnotherHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.typeLabel.text = @"申请中";
    [cell.actionView.firstButton setTitle:@"截止日期：2016-01-01" forState:0];
    [cell.actionView.secondButton setHidden:YES];
    [cell.actionView.thirdButton setTitle:@"去评价" forState:0];
    QDFWeakSelf;
    [cell.actionView.thirdButton addAction:^(UIButton *btn) {
//        MyScheduleViewController *myScheduleVC = [[MyScheduleViewController alloc] init];
//        [weakself.navigationController pushViewController:myScheduleVC animated:YES];
        
        AdditionalEvaluateViewController *addtionalEvaluateVC = [[AdditionalEvaluateViewController alloc] init];
        [weakself.navigationController pushViewController:addtionalEvaluateVC animated:YES];
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section>0) {
        
        return kBigPadding;
    }
    return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerVirw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    headerVirw.backgroundColor = kBackColor;
    self.myOrderTableView.tableHeaderView = headerVirw;
    return headerVirw;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    MyApplyingViewController *myApplyingVC = [[MyApplyingViewController alloc] init];
//    [self.navigationController pushViewController:myApplyingVC animated:YES];
    
//    MyProcessingViewController *myProcessingVC = [[MyProcessingViewController alloc] init];
//    [self.navigationController pushViewController:myProcessingVC animated:YES];
    
//    MyEndingViewController *myEndingVC = [[MyEndingViewController alloc] init];
//    [self.navigationController pushViewController:myEndingVC animated:YES];
    
    MyClosingViewController *myClosingVC = [[MyClosingViewController alloc] init];
    [self.navigationController pushViewController:myClosingVC animated:YES];
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
