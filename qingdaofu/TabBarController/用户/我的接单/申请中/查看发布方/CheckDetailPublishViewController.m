//
//  CheckDetailPublishViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "CheckDetailPublishViewController.h"
#import "BaseCommitButton.h"
#import "CheckDetailUserView.h"

@interface CheckDetailPublishViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *checkDetailTableView;

@property (nonatomic,strong) CheckDetailUserView *userView;
@property (nonatomic,strong) UIView *chatView;
@property (nonatomic,strong) BaseCommitButton *stateButton;

@end

@implementation CheckDetailPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发布方详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.checkDetailTableView];
    [self.view addSubview:self.stateButton];
}

- (UITableView *)checkDetailTableView
{
    if (!_checkDetailTableView) {
        _checkDetailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavHeight) style:UITableViewStyleGrouped];
        _checkDetailTableView.delegate = self;
        _checkDetailTableView.dataSource = self;
    }
    return _checkDetailTableView;
}

- (CheckDetailUserView *)userView
{
    if (!_userView) {
        _userView = [[CheckDetailUserView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight*6)];
        _userView.cellV1.button.backgroundColor = kBlueColor;
        [_userView.cellV2.button setTitle:@"李方方" forState:0];
        [_userView.cellV3.button setTitle:@"421181199110105466" forState:0];
        [_userView.cellV4.button setTitle:@"已上传" forState:0];
        [_userView.cellV5.button setTitle:@"1234455555@qq.com" forState:0];
        [_userView.cellV6.button addAction:^(UIButton *btn) {
            NSLog(@"点击查看经典案例");
        }];
    }
    return _userView;
}

- (UIView *)chatView
{
    if (!_chatView) {
        _chatView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 160)];
    }
    return _chatView;
}

- (BaseCommitButton *)stateButton
{
    if (!_stateButton) {
        _stateButton = [[BaseCommitButton alloc] initWithFrame:CGRectMake(0, kScreenHeight-kNavHeight-kCellHeight, kScreenWidth, kCellHeight)];
        [_stateButton setTitle:@"申请中" forState:0];
    }
    return _stateButton;
}

#pragma mark - 
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
    if (indexPath.section == 0) {
        return kCellHeight*6;
    }
    return 160;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"checkDetail";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        [cell addSubview:self.userView];
    }else{
        [cell addSubview:self.chatView];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kSmallPadding;
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
