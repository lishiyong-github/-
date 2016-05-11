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

#import "BidZeroCell.h"  //0产品编号
#import "BidCell.h"      //1展示信息
#import "BidSingleCell.h"//2基本信息
#import "MyOrderDetailCell.h"//进度详情

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
    static NSString *identifier;
    
    if (indexPath.section == 0) {
        identifier = @"aaa";
        BidZeroCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[BidZeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        cell.backgroundColor = kBlueColor;
        cell.bigProView.label.text = @"产品编号：RZ201605030001";
        cell.bigProView.label.textColor = kNavColor;
        cell.bigProView.textField.userInteractionEnabled = NO;
        [cell.bigProView.button setTitle:@"已结案" forState:0];
        [cell.bigProView.button setTitleColor:kNavColor forState:0];

        return cell;
        
    }else if(indexPath.section == 1){
        identifier = @"bbb";
        BidCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[BidCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSArray *secImageArray = @[@"conserve_investment_icon",@"conserve_loan_icon",@"conserve_interest_icon",@"conserve_rebate_icon"];
        cell.cellView2.imageView1.image = [UIImage imageNamed:secImageArray[0]];
        cell.cellView3.imageView1.image = [UIImage imageNamed:secImageArray[1]];
        cell.cellView4.imageView1.image = [UIImage imageNamed:secImageArray[2]];
        cell.cellView5.imageView1.image = [UIImage imageNamed:secImageArray[3]];
        
        return cell;
        
    }else if (indexPath.section ==2){
        identifier = @"ccc";
        BidSingleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[BidSingleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (indexPath.section == 3){
        identifier = @"ddd";
        MyOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[MyOrderDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.detail3 setHidden:YES];
        return cell;
    }
    identifier = @"eee";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell addSubview:self.secView4];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kBigPadding;
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
