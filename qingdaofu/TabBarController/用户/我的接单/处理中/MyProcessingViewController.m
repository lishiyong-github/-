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
        _footerButton = [[BaseCommitButton alloc] initWithFrame:CGRectMake(0, kScreenHeight-kNavHeight-kTabBarHeight, kScreenWidth, kTabBarHeight)];
        [_footerButton setTitle:@"申请结案" forState:0];
    }
    return _footerButton;
}
- (AuthenBaseView *)secVie0
{
    if (!_secVie0) {
        _secVie0 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _secVie0.backgroundColor = kBlueColor;
        _secVie0.label.text = @"产品编号:";
        _secVie0.label.textColor = kNavColor;
        _secVie0.textField.text = @"RZ201605030001";
        _secVie0.textField.userInteractionEnabled = NO;
        _secVie0.textField.textColor = kNavColor;
        [_secVie0.button setTitle:@"已终止" forState:0];
        [_secVie0.button setTitleColor:kNavColor forState:0];
    }
    return _secVie0;
}

- (BidCellView *)secVie1
{
    if (!_secVie1) {
        _secVie1 = [[BidCellView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 5*kCellHeight+2)];
        
        NSArray *secImageArray = @[@"conserve_investment_icon",@"conserve_loan_icon",@"conserve_risk_icon",@"conserve_rights_icon"];
        _secVie1.cellView2.imageView1.image = [UIImage imageNamed:secImageArray[0]];
        _secVie1.cellView3.imageView1.image = [UIImage imageNamed:secImageArray[1]];
        _secVie1.cellView4.imageView1.image = [UIImage imageNamed:secImageArray[2]];
        _secVie1.cellView5.imageView1.image = [UIImage imageNamed:secImageArray[3]];
    }
    return _secVie1;
}

- (BidSingleView *)secVie2
{
    if (!_secVie2) {
        _secVie2 = [[BidSingleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 135+2*kCellHeight+1)];
    }
    return _secVie2;
}
- (AuthenBaseView *)secVie3
{
    if (!_secVie3) {
        _secVie3 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _secVie3.backgroundColor = kNavColor;
        _secVie3.label.text = @"|  服务协议";
        _secVie3.label.textColor = kBlueColor;
        _secVie3.textField.userInteractionEnabled = NO;
        _secVie3.textField.placeholder = @"";
        [_secVie3.button setTitle:@"点击查看 >" forState:0];
        _secVie3.button.titleLabel.font = kSecondFont;
        [_secVie3.button setTitleColor:kLightGrayColor forState:0];
    }
    return _secVie3;
}
- (MyOrderDetailView *)secVie4
{
    if (!_secVie4) {
        _secVie4 = [[MyOrderDetailView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight*2+120)];
    }
    return _secVie4;
}

- (AuthenBaseView *)secVie5
{
    if (!_secVie5) {
        _secVie5 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _secVie5.backgroundColor = kNavColor;
        _secVie5.label.text = @"|  申请延期";
        _secVie5.label.textColor = kBlueColor;
        _secVie5.textField.userInteractionEnabled = NO;
        [_secVie5.button setTitle:@"立即申请 >" forState:0];
        [_secVie5.button setTitleColor:kLightGrayColor forState:0];
        _secVie5.button.titleLabel.font = kSecondFont;
    }
    return _secVie5;
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
    static NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"s0";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:self.secVie0];
        return cell;
    }else if (indexPath.section == 1){
        identifier = @"s1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:self.secVie1];
        return cell;
    }else if (indexPath.section == 2){
        identifier = @"s2";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:self.secVie2];
        return cell;
    }else if (indexPath.section == 3){
        identifier = @"s3";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:self.secVie3];
        return cell;
    }else if (indexPath.section == 4){
        identifier = @"s4";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:self.secVie4];
        return cell;
    }
    
    identifier = @"s5";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell addSubview:self.secVie5];
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
