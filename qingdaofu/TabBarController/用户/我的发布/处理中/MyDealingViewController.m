//
//  MyDealingViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/6.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyDealingViewController.h"
#import "PaceViewController.h"    //查看进度

#import "AuthenBaseView.h"
#import "BidCellView.h"
#import "BidSingleView.h"
#import "BaseLabel.h"
#import "EvaTopSwitchView.h"

@interface MyDealingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *dealingTableView;
@property (nonatomic,strong) AuthenBaseView *sect0;
@property (nonatomic,strong) BidCellView *sect1;
@property (nonatomic,strong) BidSingleView *sect2;
@property (nonatomic,strong) BaseLabel *sect3;
@property (nonatomic,strong) EvaTopSwitchView *dealFootView;

@end

@implementation MyDealingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"申请记录" style:UIBarButtonItemStylePlain target:self action:@selector(showRecordList)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview: self.dealingTableView];
}

- (void)showRecordList
{
    
}

- (UITableView *)dealingTableView
{
    if (!_dealingTableView) {
        _dealingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStyleGrouped];
        _dealingTableView.delegate = self;
        _dealingTableView.dataSource = self;
        _dealingTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    }
    return _dealingTableView;
}

- (AuthenBaseView *)sect0
{
    if (!_sect0) {
        _sect0 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _sect0.backgroundColor = kBlueColor;
        
        _sect0.label.text = @"产品编号：RZ201605030001";
        _sect0.label.textColor = kNavColor;
        
        _sect0.textField.userInteractionEnabled = NO;
        
        [_sect0.button setTitle:@"处理中" forState:0];
        [_sect0.button setTitleColor:[UIColor whiteColor] forState:0];
    }
    return _sect0;
}

- (BidCellView *)sect1
{
    if (!_sect1) {
        _sect1 = [[BidCellView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 5*kCellHeight+2)];
        
        NSArray *secImageArray = @[@"conserve_investment_icon",@"conserve_loan_icon",@"conserve_interest_icon",@"conserve_rebate_icon"];
        
        [_sect1.cellView2.imageView1 setImage:[UIImage imageNamed:secImageArray[0]]];
        [_sect1.cellView3.imageView1 setImage:[UIImage imageNamed:secImageArray[1]]];
        [_sect1.cellView4.imageView1 setImage:[UIImage imageNamed:secImageArray[2]]];
        [_sect1.cellView5.imageView1 setImage:[UIImage imageNamed:secImageArray[3]]];
    }
    return _sect1;
}

- (BidSingleView *)sect2
{
    if (!_sect2) {
        _sect2 = [[BidSingleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 135+2*kCellHeight+1)];
    }
    return _sect2;
}

- (BaseLabel *)sect3
{
    if (!_sect3) {
        _sect3 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _sect3.nameLabel.text = @"查看进度";
        [_sect3.tButton setTitle:@"查看" forState:0];
    }
    return _sect3;
}

#pragma mark -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
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
    }
    return 2*kCellHeight + 135 + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"sect0";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:self.sect0];
        return cell;
        
    }else if (indexPath.section == 1){
        identifier = @"sect1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell addSubview:self.sect1];
        return cell;
    }
    
    identifier = @"sect2";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell addSubview:self.sect2];
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 3) {
        PaceViewController *paceVC = [[PaceViewController alloc] init];
        [self.navigationController pushViewController:paceVC animated:YES];
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
