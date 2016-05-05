//
//  SystemMessageViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/27.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "SystemMessageViewController.h"

#import "MessageCell.h"

@interface SystemMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *sysMessageTableView;

@end

@implementation SystemMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"系统消息";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.sysMessageTableView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        [self.sysMessageTableView autoPinEdgeToSuperviewMargin:ALEdgeTop];
        [self.sysMessageTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
        
        self.didSetupConstraints = YES;
    }
    
    [super updateViewConstraints];
}

- (UITableView *)sysMessageTableView
{
    if (!_sysMessageTableView) {
        _sysMessageTableView = [UITableView newAutoLayoutView];
        _sysMessageTableView.delegate = self;
        _sysMessageTableView.dataSource = self;
        _sysMessageTableView.tableFooterView = [[UIView alloc] init];
        _sysMessageTableView.backgroundColor = kBackColor;
    }
    return _sysMessageTableView;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
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
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    cell.userLabel.text = @"完善撤案品信息";
    cell.timeLabel.text = @"2016-12-12 16:45";
    cell.newsLabel.text = @"用户12344455提醒您完善融资FHNNJKK的信息";
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
    UIView *headerView = [[UIView alloc] init];
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
