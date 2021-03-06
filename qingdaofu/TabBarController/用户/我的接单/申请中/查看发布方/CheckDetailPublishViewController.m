//
//  CheckDetailPublishViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "CheckDetailPublishViewController.h"
#import "BaseCommitButton.h"

#import "CheckDetailUserCell.h"

@interface CheckDetailPublishViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *checkDetailTableView;

@property (nonatomic,strong) UIView *chatView;
@property (nonatomic,strong) BaseCommitButton *stateButton;

@property (nonatomic,strong) UIButton *rightBarBtn;

@end

@implementation CheckDetailPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发布方详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBarBtn];

    [self.view addSubview:self.checkDetailTableView];
    [self.view addSubview:self.stateButton];
}

- (UIButton *)rightBarBtn
{
    if (!_rightBarBtn) {
        _rightBarBtn = [UIButton buttonWithType:0];
        _rightBarBtn.bounds = CGRectMake(0, 0, 24, 24);
        [_rightBarBtn setImage:[UIImage imageNamed:@"information_nav_remind"] forState:0];
        QDFWeakSelf;
        [_rightBarBtn addAction:^(UIButton *btn) {
            [weakself warnning];
        }];
    }
    return _rightBarBtn;
}

- (void)warnning
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"是否提醒发布方完善信息" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确认发布方信息");
    }];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:actionOK];
    [alertController addAction:actionCancel];
    
    [self.navigationController presentViewController:alertController animated:YES completion:nil];
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
        _stateButton = [[BaseCommitButton alloc] initWithFrame:CGRectMake(0, kScreenHeight-kNavHeight-kTabBarHeight, kScreenWidth, kTabBarHeight)];
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
    static NSString *identifier;
    
    if (indexPath.section == 0) {
        identifier = @"as";
        CheckDetailUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[CheckDetailUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.cellV1.button.backgroundColor = kBlueColor;
        [cell.cellV2.button setTitle:@"李方方" forState:0];
        [cell.cellV3.button setTitle:@"421181199110105466" forState:0];
        [cell.cellV4.button setTitle:@"已上传" forState:0];
        [cell.cellV5.button setTitle:@"1234455555@qq.com" forState:0];
        [cell.cellV6.goButton addAction:^(UIButton *btn) {
            NSLog(@"点击查看经典案例");
        }];
        return cell;

    }
    
    identifier = @"bs";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    [cell addSubview:self.chatView];
    
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
