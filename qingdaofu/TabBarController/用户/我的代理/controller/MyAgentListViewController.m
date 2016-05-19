//
//  MyAgentListViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/19.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyAgentListViewController.h"
#import "MyAgentViewController.h"  //我的代理详细
#import "AddMyAgentViewController.h"  //继续添加代理

#import "MineUserCell.h"
#import "UIView+UITextColor.h"

@interface MyAgentListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *myAgentListTableView;

@end

@implementation MyAgentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"代理人列表";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"继续添加" style:UIBarButtonItemStylePlain target:self action:@selector(goToAddAgent)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} forState:0];

    [self.view addSubview:self.myAgentListTableView];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.myAgentListTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)myAgentListTableView
{
    if (!_myAgentListTableView) {
        _myAgentListTableView = [UITableView newAutoLayoutView];
        _myAgentListTableView.delegate = self;
        _myAgentListTableView.dataSource = self;
        _myAgentListTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
        _myAgentListTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
        _myAgentListTableView.backgroundColor = kBackColor;
    }
    return _myAgentListTableView;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"agentList";
    MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    if (!cell) {
        cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSMutableAttributedString *agentnameStr = [cell.userNameButton setAttributeString:@"李三三" withColor:kLightGrayColor andSecond:@"[停用]" withColor:kBlackColor withFont:15];
    [cell.userNameButton setAttributedTitle:agentnameStr forState:0];
    
    [cell.userActionButton setTitle:@"123456789908" forState:0];
    [cell.userActionButton setImage:[UIImage imageNamed:@"list_more"] forState:0];
    [cell.userActionButton setTitleColor:kBlueColor forState:0];
    cell.userActionButton.titleLabel.font = kBigFont;
    
    cell.userNameButton.userInteractionEnabled = NO;
    cell.userActionButton.userInteractionEnabled = NO;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MyAgentViewController *myAgentVc = [[MyAgentViewController alloc] init];
    [self.navigationController pushViewController:myAgentVc animated:YES];
}

#pragma mark - method
- (void)goToAddAgent
{
    AddMyAgentViewController *addMyAgentVC = [[AddMyAgentViewController alloc] init];
    [self.navigationController pushViewController:addMyAgentVC animated:YES];
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
