//
//  MyReleaseViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyReleaseViewController.h"
#import "MyPublishingViewController.h"   //发布中
#import "MyDealingViewController.h"   //处理中

#import "AdditionMessageViewController.h"  //补充信息
#import "ApplyRecordsViewController.h"     //申请记录
#import "PaceViewController.h"          //处理进度

#import "AnotherHomeCell.h"
#import "AllProSegView.h"

@interface MyReleaseViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) AllProSegView *releaseProView;
@property (nonatomic,strong) UITableView *myReleaseTableView;

@end

@implementation MyReleaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"所有产品";
    self.navigationItem.leftBarButtonItem = self.leftItem;

    [self.view addSubview:self.releaseProView];
    [self.view addSubview:self.myReleaseTableView];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.releaseProView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
        [self.releaseProView autoSetDimension:ALDimensionHeight toSize:40];
        
        [self.myReleaseTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.releaseProView];
        [self.myReleaseTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (AllProSegView *)releaseProView
{
    if (!_releaseProView) {
        _releaseProView = [AllProSegView newAutoLayoutView];
        _releaseProView.backgroundColor = kBlueColor;
    }
    return _releaseProView;
}

- (UITableView *)myReleaseTableView
{
    if (!_myReleaseTableView) {
        _myReleaseTableView = [UITableView newAutoLayoutView];
        _myReleaseTableView.delegate = self;
        _myReleaseTableView.dataSource = self;
        _myReleaseTableView.backgroundColor = kBackColor;
        _myReleaseTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    }
    return _myReleaseTableView;
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"myRelease";
    AnotherHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AnotherHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.typeLabel.text = @"发布中";
    cell.typeLabel.textColor = kBlueColor;
    
    [cell.firstButton setTitle:@"您有新的申请记录" forState:0];
    [cell.secondButton setTitle:@"查看进度" forState:0];
    [cell.thirdButton setTitle:@"查看申请" forState:0];
    
    QDFWeakSelf;
    [cell.secondButton addAction:^(UIButton *btn) {
//        AdditionMessageViewController *addtionMessageVC = [[AdditionMessageViewController alloc] init];
//        [weakself.navigationController pushViewController:addtionMessageVC animated:YES];
        
        PaceViewController *paceVC = [[PaceViewController alloc] init];
        [self.navigationController pushViewController:paceVC animated:YES];
    }];
    
    [cell.thirdButton addAction:^(UIButton *btn) {
        ApplyRecordsViewController *applyRecordsVC = [[ApplyRecordsViewController alloc] init];
        [weakself.navigationController pushViewController:applyRecordsVC animated:YES];
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
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    headView.backgroundColor = kBackColor;
    self.myReleaseTableView.tableHeaderView = headView;
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    MyPublishingViewController *myPublishingVC = [[MyPublishingViewController alloc] init];
//    [self.navigationController pushViewController:myPublishingVC animated:YES];
    
//    MyDealingViewController *myDealingVC = [[MyDealingViewController alloc] init];
//    [self.navigationController pushViewController:myDealingVC animated:YES];

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
