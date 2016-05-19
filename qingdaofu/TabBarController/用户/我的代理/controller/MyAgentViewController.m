//
//  MyAgentViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/17.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyAgentViewController.h"

#import "AddMyAgentViewController.h"

#import "MyAgentCell.h"
#import "BaseCommitButton.h"

#import "UIView+UITextColor.h"

@interface MyAgentViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *myAgentTableView;
@property (nonatomic,strong) BaseCommitButton *myAgentCommitButton;

@end

@implementation MyAgentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的代理";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.myAgentTableView];
    [self.view addSubview:self.myAgentCommitButton];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.myAgentTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.myAgentTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTabBarHeight];
        
        [self.myAgentCommitButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.myAgentCommitButton autoSetDimension:ALDimensionHeight toSize:kTabBarHeight];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)myAgentTableView
{
    if (!_myAgentTableView) {
        _myAgentTableView = [UITableView newAutoLayoutView];
        _myAgentTableView.translatesAutoresizingMaskIntoConstraints = YES;
        _myAgentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _myAgentTableView.delegate = self;
        _myAgentTableView.dataSource = self;
        _myAgentTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    }
    return _myAgentTableView;
}

- (BaseCommitButton *)myAgentCommitButton
{
    if (!_myAgentCommitButton) {
        _myAgentCommitButton = [BaseCommitButton newAutoLayoutView];
        [_myAgentCommitButton setTitle:@"继续添加" forState:0];
    }
    return _myAgentCommitButton;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"myAgent";
    MyAgentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MyAgentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSMutableAttributedString *str1 = [cell.agentNameLabel setAttributeString:@"姓名" withColor:kBlackColor andSecond:@"张三三" withColor:kLightGrayColor withFont:12];
    [cell.agentNameLabel setAttributedText:str1];
    
    NSMutableAttributedString *str2 = [cell.agentTelLabel setAttributeString:@"联系方式" withColor:kBlackColor andSecond:@"12345678900" withColor:kLightGrayColor withFont:12];
    [cell.agentTelLabel setAttributedText:str2];
    
    NSMutableAttributedString *str3 = [cell.agentIDLabel setAttributeString:@"身份证号" withColor:kBlackColor andSecond:@"123456789856432134" withColor:kLightGrayColor withFont:12];
    [cell.agentIDLabel setAttributedText:str3];
    
    NSMutableAttributedString *str4 = [cell.agentCerLabel setAttributeString:@"执业证号" withColor:kBlackColor andSecond:@"1234455555555555555" withColor:kLightGrayColor withFont:12];
    [cell.agentCerLabel setAttributedText:str4];
    
    NSMutableAttributedString *str5 = [cell.agentPassLabel setAttributeString:@"登录密码" withColor:kBlackColor andSecond:@"123ghjk" withColor:kLightGrayColor withFont:12];
    [cell.agentPassLabel setAttributedText:str5];
    
    QDFWeakSelf;
    [cell.agentEditButton addAction:^(UIButton *btn) {
        AddMyAgentViewController *addMyagentVc = [[AddMyAgentViewController alloc] init];
        [weakself.navigationController pushViewController:addMyagentVc animated:YES];
    }];
    
    return cell;
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
