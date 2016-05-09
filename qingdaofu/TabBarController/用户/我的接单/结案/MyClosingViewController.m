//
//  MyClosingViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyClosingViewController.h"

#import "CheckDetailPublishViewController.h"  //查看发布方
#import "AdditionalEvaluateViewController.h"  //追加评价
#import "AdditionMessageViewController.h"     //补充信息

@interface MyClosingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *myClosingTableView;

@end

@implementation MyClosingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"查看发布方" style:UIBarButtonItemStylePlain target:self action:@selector(checkDetail)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview:self.myClosingTableView];
    [self.view addSubview:self.additionalEvalateButton];
}

- (void)checkDetail
{
    CheckDetailPublishViewController *checkDetailPublishVC = [[CheckDetailPublishViewController alloc] init];
    [self.navigationController pushViewController:checkDetailPublishVC animated:YES];
}

#pragma mark - setter and getter
- (UITableView *)myClosingTableView
{
    if (!_myClosingTableView) {
        _myClosingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight-kCellHeight) style:UITableViewStyleGrouped];
        _myClosingTableView.delegate = self;
        _myClosingTableView.dataSource = self;
    }
    return _myClosingTableView;
}

- (BaseCommitButton *)additionalEvalateButton
{
    if (!_additionalEvalateButton) {
        _additionalEvalateButton = [[BaseCommitButton alloc] initWithFrame:CGRectMake(0, kScreenHeight-kNavHeight-kTabBarHeight, kScreenWidth, kTabBarHeight)];
        [_additionalEvalateButton setTitle:@"追加评价" forState:0];
        
        QDFWeakSelf;
        [_additionalEvalateButton addAction:^(UIButton *btn) {
            AdditionalEvaluateViewController *additionalEvaluateVC = [[AdditionalEvaluateViewController alloc] init];
            [weakself.navigationController pushViewController:additionalEvaluateVC animated:YES];
        }];
    }
    return _additionalEvalateButton;
}

- (AuthenBaseView *)secView0
{
    if (!_secView0) {
        _secView0 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _secView0.backgroundColor = kBlueColor;
        _secView0.label.text = @"产品编号：RZ201605030001";
        _secView0.label.textColor = kNavColor;
        _secView0.textField.userInteractionEnabled = NO;
        _secView0.textField.placeholder = @"";
        [_secView0.button setTitle:@"已结案" forState:0];
        [_secView0.button setTitleColor:kNavColor forState:0];
    }
    return _secView0;
}

- (BidCellView *)secView1
{
    if (!_secView1) {
        _secView1 = [[BidCellView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 5*kCellHeight+2)];
        NSArray *secImageArray = @[@"conserve_investment_icon",@"conserve_loan_icon",@"conserve_interest_icon",@"conserve_rebate_icon"];
        _secView1.cellView2.imageView1.image = [UIImage imageNamed:secImageArray[0]];
        _secView1.cellView3.imageView1.image = [UIImage imageNamed:secImageArray[1]];
        _secView1.cellView4.imageView1.image = [UIImage imageNamed:secImageArray[2]];
        _secView1.cellView5.imageView1.image = [UIImage imageNamed:secImageArray[3]];
    }
    return _secView1;
}

- (BidSingleView *)secView2
{
    if (!_secView2) {
        _secView2 = [[BidSingleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 135+2*kCellHeight+1)];
        
        QDFWeakSelf;
        [_secView2.cellView8 addAction:^(UIButton *btn) {
            
        }];
    }
    return _secView2;
}
- (MyOrderDetailView *)secView3
{
    if (!_secView3) {
        _secView3 = [[MyOrderDetailView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight+120)];
        [_secView3.detail3 setHidden:YES];
    }
    return _secView3;
}
- (UIView *)secView4
{
    if (!_secView4) {
        _secView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        _secView4.backgroundColor = kBlueColor;
    }
    return _secView4;
}

#pragma mark - 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return kCellHeight;
    }else if (indexPath.section == 1){
        return 5*kCellHeight + 2;
    }else if (indexPath.section == 2){
        return 2*kCellHeight + 135 + 1;
    }else if (indexPath.section == 3){
        return kCellHeight + 120 + 1;
    }
    return 100;
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
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kSmallPadding;
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
