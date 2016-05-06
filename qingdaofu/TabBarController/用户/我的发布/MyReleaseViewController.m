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

#import "AnotherHomeCell.h"

@interface MyReleaseViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *myReleaseTableView;

@end

@implementation MyReleaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"所有产品";
    self.navigationItem.leftBarButtonItem = self.leftItem;

    [self.view addSubview:self.myReleaseTableView];
}

- (UITableView *)myReleaseTableView
{
    if (!_myReleaseTableView) {
        _myReleaseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStylePlain];
        _myReleaseTableView.delegate = self;
        _myReleaseTableView.dataSource = self;
        _myReleaseTableView.backgroundColor = kBackColor;
        _myReleaseTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
        _myReleaseTableView.tableFooterView.backgroundColor = kBackColor;
    }
    return _myReleaseTableView;
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170+kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnotherHomeCell *cell = [AnotherHomeCell cellWithTableView:tableView];
    
    cell.cellView.typeLabel.text = @"发布中";
    cell.cellView.typeLabel.textColor = kBlueColor;
    cell.actionView.label.text = @"您有新的申请记录";
    [cell.actionView.button setTitle:@"  处理进度  " forState:0];
    
    QDFWeakSelf;
    [cell.actionView.button addAction:^(UIButton *btn) {
        AdditionMessageViewController *addtionMessageVC = [[AdditionMessageViewController alloc] init];
        [weakself.navigationController pushViewController:addtionMessageVC animated:YES];
    }];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyPublishingViewController *myPublishingVC = [[MyPublishingViewController alloc] init];
    [self.navigationController pushViewController:myPublishingVC animated:YES];
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
