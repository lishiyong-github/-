//
//  ReceiveMessageViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/27.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReceiveMessageViewController.h"

#import "MessageCell.h"

@interface ReceiveMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *reMessageTableView;

@end

@implementation ReceiveMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"接单消息";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.reMessageTableView];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        [self.reMessageTableView autoPinEdgeToSuperviewMargin:ALEdgeTop];
        [self.reMessageTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
        
        self.didSetupConstraints = YES;
    }
    
    [super updateViewConstraints];
}

- (UITableView *)reMessageTableView
{
    if (!_reMessageTableView) {
        _reMessageTableView = [UITableView newAutoLayoutView];
        _reMessageTableView.delegate = self;
        _reMessageTableView.dataSource = self;
        _reMessageTableView.tableFooterView = [[UIView alloc] init];
        _reMessageTableView.backgroundColor = kBackColor;
    }
    return _reMessageTableView;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell *cell = [MessageCell cellWithTableView:tableView];
    
    cell.userLabel.text = @"终止消息";
    cell.timeLabel.text = @"2016-12-12 16:45";
    cell.newsLabel.text = @"您的发布诉讼GFFV JTTVJKF对方申请结案";
    cell.countLabel.text = @">";
    cell.countLabel.textColor = kGrayColor;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
    headerView.backgroundColor = kBackColor;
    tableView.tableHeaderView = headerView;
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
