//
//  CompleteViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/28.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "CompleteViewController.h"
#import "AuthenPersonViewController.h"

#import "AuthenBaseView.h"
#import "CompletView.h"

@interface CompleteViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *completeTableView;
@property (nonatomic,strong) UIButton *rightBarBtn;
@property (nonatomic,strong) AuthenBaseView *cell0;
@property (nonatomic,strong) CompletView *cell1;
@property (nonatomic,strong) AuthenBaseView *comFootView;


@end

@implementation CompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人信息";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBarBtn];
    
    [self.view addSubview:self.completeTableView];
}

- (UIButton *)rightBarBtn
{
    if (!_rightBarBtn) {
        _rightBarBtn = [UIButton buttonWithType:0];
        _rightBarBtn.bounds = CGRectMake(0, 0, 24, 24);
        [_rightBarBtn setImage:[UIImage imageNamed:@"nav_tip"] forState:0];
        [_rightBarBtn addAction:^(UIButton *btn) {
            NSLog(@"可发布融资催收诉讼");
        }];
    }
    return _rightBarBtn;
}

- (UITableView *)completeTableView
{
    if (!_completeTableView) {
        _completeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStylePlain];
        _completeTableView.delegate = self;
        _completeTableView.dataSource = self;
        _completeTableView.tableFooterView = [[UIView alloc] init];
        _completeTableView.backgroundColor = kBackColor;
        _completeTableView.separatorInset = UIEdgeInsetsZero;
    }
    return _completeTableView;
}

- (AuthenBaseView *)cell0
{
    if (!_cell0) {
        _cell0 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _cell0.label.text = @"|  认证信息";
        _cell0.label.textColor = kBlueColor;
        _cell0.textField.userInteractionEnabled = NO;
        [_cell0.button setTitle:@"编辑" forState:0];
        [_cell0.button setTitleColor:kBlueColor forState:0];
        _cell0.button.titleLabel.font = kFirstFont;
        QDFWeakSelf;
        [_cell0.button addAction:^(UIButton *btn) {
            AuthenPersonViewController *authenPersonVC = [[AuthenPersonViewController alloc] init];
            [weakself.navigationController pushViewController:authenPersonVC animated:YES];
        }];
    }
    return _cell0;
}

- (CompletView *)cell1
{
    if (!_cell1) {
        _cell1 = [[CompletView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 215)];
    }
    return _cell1;
}

- (AuthenBaseView *)comFootView
{
    if (!_comFootView) {
        _comFootView = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        _comFootView.label.text = @"在您未发布及未接单前，您可以根据实际需要，修改您的身份认证";
        _comFootView.label.textColor = kLightGrayColor;
        _comFootView.label.font = kSecondFont;
    }
    return _comFootView;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return kCellHeight;
    }
    return 215;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"complete";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0) {
        [cell addSubview:self.cell0];
    }else{
        [cell addSubview:self.cell1];
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kBigPadding;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = kBackColor;
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
//    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
//    footerView.backgroundColor = kBackColor;
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, kScreenWidth-30, 40)];
//    label.numberOfLines = 0;
//    label.textColor = kLightGrayColor;
//    label.text = @"在您未发布及未接单前，您可以根据实际需要，修改您的身份认证";
//    label.font = kFirstFont;
//    label.backgroundColor = [UIColor clearColor];
//    [footerView addSubview:label];
//    
//    return footerView;
    
    return self.comFootView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
