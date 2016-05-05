//
//  MyProcessingViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyProcessingViewController.h"
#import "DelayRequestViewController.h"
#import "CheckDetailPublishViewController.h"

#import "BaseCommitButton.h"

@interface MyProcessingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *myProcessingTableView;
@property (nonatomic,strong) BaseCommitButton *footerButton;

@end

@implementation MyProcessingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"查看发布方" style:UIBarButtonItemStylePlain target:self action:@selector(checkDetail)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview:self.myProcessingTableView];
    [self.view addSubview:self.footerButton];
}

- (void)checkDetail
{
    CheckDetailPublishViewController *checkDetailPublishVC = [[CheckDetailPublishViewController alloc] init];
    [self.navigationController pushViewController:checkDetailPublishVC animated:YES];
}

- (UITableView *)myProcessingTableView
{
    if (!_myProcessingTableView) {
        _myProcessingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight- kNavHeight - kCellHeight) style:UITableViewStyleGrouped];
        _myProcessingTableView.delegate = self;
        _myProcessingTableView.dataSource = self;
    }
    return _myProcessingTableView;
}
- (BaseCommitButton *)footerButton
{
    if (!_footerButton) {
        _footerButton = [[BaseCommitButton alloc] initWithFrame:CGRectMake(0, kScreenHeight-kNavHeight-kCellHeight, kScreenWidth, kCellHeight)];
        [_footerButton setTitle:@"申请结案" forState:0];
    }
    return _footerButton;
}
- (AuthenBaseView *)secView0
{
    if (!_secView0) {
        _secView0 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _secView0.backgroundColor = kBlueColor;
        _secView0.label.text = @"产品编号:";
        _secView0.label.textColor = kNavColor;
        _secView0.textField.text = @"RZ201605030001";
        _secView0.textField.userInteractionEnabled = NO;
        _secView0.textField.textColor = kNavColor;
        [_secView0.button setTitle:@"已终止" forState:0];
        [_secView0.button setTitleColor:kNavColor forState:0];
    }
    return _secView0;
}

- (BidCellView *)secView1
{
    if (!_secView1) {
        _secView1 = [[BidCellView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 5*kCellHeight+2)];
    }
    return _secView1;
}

- (BidSingleView *)secView2
{
    if (!_secView2) {
        _secView2 = [[BidSingleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 135+2*kCellHeight+1)];
    }
    return _secView2;
}
- (AuthenBaseView *)secView3
{
    if (!_secView3) {
        _secView3 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _secView3.backgroundColor = kNavColor;
        _secView3.label.text = @"| 服务协议";
        _secView3.label.textColor = kBlueColor;
        _secView3.textField.userInteractionEnabled = NO;
        _secView3.textField.placeholder = @"";
        [_secView3.button setTitle:@"点击查看 >" forState:0];
        _secView3.button.titleLabel.font = kSecondFont;
        [_secView3.button setTitleColor:kLightGrayColor forState:0];
    }
    return _secView3;
}
- (MyOrderDetailView *)secView4
{
    if (!_secView4) {
        _secView4 = [[MyOrderDetailView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight*2+120)];
    }
    return _secView4;
}

- (AuthenBaseView *)secView5
{
    if (!_secView5) {
        _secView5 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _secView5.backgroundColor = kNavColor;
        _secView5.label.text = @"| 申请延期";
        _secView5.label.textColor = kBlueColor;
        _secView5.textField.userInteractionEnabled = NO;
        _secView5.textField.placeholder = @"";
        [_secView5.button setTitle:@"立即申请 >" forState:0];
        [_secView5.button setTitleColor:kLightGrayColor forState:0];
        _secView5.button.titleLabel.font = kSecondFont;
    }
    return _secView5;
}

#pragma mark - 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return 5*kCellHeight + 2;
    }else if (indexPath.section == 2){
        return 2*kCellHeight + 135 + 1;
    }else if (indexPath.section == 4){
        return kCellHeight*2 + 120 + 1;
    }
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"myProcessing";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        [cell addSubview:self.secView0];
    }else if (indexPath.section == 1){
        [cell addSubview:self.secView1];
    }else if(indexPath.section == 2){
        [cell addSubview:self.secView2];
    }else if(indexPath.section == 3){
        [cell addSubview:self.secView3];
    }else if (indexPath.section == 4){
        [cell addSubview:self.secView4];
    }else{
        [cell addSubview:self.secView5];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 5) {
        return 40;
    }
    return kSmallPadding;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 5) {
        DelayRequestViewController *delayRequestVC = [[DelayRequestViewController alloc] init];
        [self.navigationController pushViewController:delayRequestVC animated:YES];
    }
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
