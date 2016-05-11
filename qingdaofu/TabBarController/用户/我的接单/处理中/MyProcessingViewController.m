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

#import "BidZeroCell.h"
#import "BidCell.h"
#import "BidSingleCell.h"
#import "MyOrderDetailCell.h"

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
        BidZeroCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[BidZeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        cell.bigProView.backgroundColor = kBlueColor;
        cell.bigProView.label.text = @"产品编号:";
        cell.bigProView.label.textColor = kNavColor;
        cell.bigProView.textField.text = @"RZ201605030001";
        cell.bigProView.textField.userInteractionEnabled = NO;
        cell.bigProView.textField.textColor = kNavColor;
        [cell.bigProView.button setTitle:@"已终止" forState:0];
        [cell.bigProView.button setTitleColor:kNavColor forState:0];
        
        return cell;
        
    }else if (indexPath.section == 1){
        identifier = @"s1";
        BidCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[BidCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        NSArray *secImageArray = @[@"conserve_investment_icon",@"conserve_loan_icon",@"conserve_risk_icon",@"conserve_rights_icon"];
        cell.cellView2.imageView1.image = [UIImage imageNamed:secImageArray[0]];
        cell.cellView3.imageView1.image = [UIImage imageNamed:secImageArray[1]];
        cell.cellView4.imageView1.image = [UIImage imageNamed:secImageArray[2]];
        cell.cellView5.imageView1.image = [UIImage imageNamed:secImageArray[3]];
        
        return cell;
    }else if (indexPath.section == 2){
        identifier = @"s2";
        BidSingleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[BidSingleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }else if (indexPath.section == 3){
        identifier = @"s0";
        BidZeroCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[BidZeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        cell.backgroundColor = kNavColor;
        cell.bigProView.label.text = @"|  服务协议";
        cell.bigProView.label.textColor = kBlueColor;
        cell.bigProView.textField.userInteractionEnabled = NO;
        cell.bigProView.textField.placeholder = @"";
        [cell.bigProView.button setTitle:@"点击查看 >" forState:0];
        cell.bigProView.button.titleLabel.font = kSecondFont;
        [cell.bigProView.button setTitleColor:kLightGrayColor forState:0];
        
        return cell;
        
    }else if (indexPath.section == 4){
        identifier = @"s4";
        MyOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[MyOrderDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    identifier = @"s0";
    
    BidZeroCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[BidZeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.bigProView.backgroundColor = kNavColor;
    cell.bigProView.label.text = @"|  申请延期";
    cell.bigProView.label.textColor = kBlueColor;
    cell.bigProView.textField.userInteractionEnabled = NO;
    [cell.bigProView.button setTitle:@"立即申请 >" forState:0];
    [cell.bigProView.button setTitleColor:kLightGrayColor forState:0];
    cell.bigProView.button.titleLabel.font = kSecondFont;

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
