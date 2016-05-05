//
//  PublishMessageViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/27.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "PublishMessageViewController.h"

#import "MessageCell.h"

@interface PublishMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UITableView *pubMessageTableView;

@end

@implementation PublishMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"发布消息";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.pubMessageTableView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        [self.pubMessageTableView autoPinEdgeToSuperviewMargin:ALEdgeTop];
        [self.pubMessageTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
        
        
        self.didSetupConstraints = YES;
    }
    
    [super updateViewConstraints];
}

- (UITableView *)pubMessageTableView
{
    if (!_pubMessageTableView) {
        _pubMessageTableView = [UITableView newAutoLayoutView];
        _pubMessageTableView.delegate = self;
        _pubMessageTableView.dataSource = self;
        _pubMessageTableView.tableFooterView = [[UIView alloc] init];
        _pubMessageTableView.backgroundColor = kBackColor;
    }
    return _pubMessageTableView;
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
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageCell *cell = [MessageCell cellWithTableView:tableView];
    
    cell.userLabel.text = @"申请消息";
    cell.timeLabel.text = @"2013-12-12";
    cell.newsLabel.text = @"您申请的融资GUUIKNGFSCVGH对方已同意";
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
