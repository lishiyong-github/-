//
//  MyDealingViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/6.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyDealingViewController.h"

#import "CheckDetailPublishViewController.h"  //查看发布方
#import "PaceViewController.h"    //查看进度
#import "AdditionMessageViewController.h"  //补充信息

//#import "BidZeroCell.h"
//#import "BidCell.h"
//#import "BidSingleCell.h"

#import "MineUserCell.h"
#import "BidMessageCell.h"
#import "BidOneCell.h"
#import "UIView+UITextColor.h"

#import "EvaTopSwitchView.h"

@interface MyDealingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *dealingTableView;
@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) EvaTopSwitchView *dealFootView;

@end

@implementation MyDealingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"查看接单方" style:UIBarButtonItemStylePlain target:self action:@selector(checkPublishUserDetail)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview: self.dealingTableView];
    [self.view addSubview:self.dealFootView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)checkPublishUserDetail
{
    CheckDetailPublishViewController *checkDetailPublishVc = [[CheckDetailPublishViewController alloc] init];
    [self.navigationController pushViewController:checkDetailPublishVc animated:YES];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.dealingTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.dealingTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTabBarHeight];
        
        [self.dealFootView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.dealFootView autoSetDimension:ALDimensionHeight toSize:kTabBarHeight];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)dealingTableView
{
    if (!_dealingTableView) {
        _dealingTableView = [UITableView newAutoLayoutView];
        _dealingTableView.translatesAutoresizingMaskIntoConstraints = NO;
        _dealingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _dealingTableView.delegate = self;
        _dealingTableView.dataSource = self;
        _dealingTableView.backgroundColor = kBackColor;
    }
    return _dealingTableView;
}

- (EvaTopSwitchView *)dealFootView
{
    if (!_dealFootView) {
        _dealFootView = [EvaTopSwitchView newAutoLayoutView];
        _dealFootView.heightConstraint.constant = kTabBarHeight;
        _dealFootView.backgroundColor = kNavColor;
        
        [_dealFootView.getbutton setTitleColor:kBlueColor forState:0];
        [_dealFootView.getbutton setTitle:@" 终止" forState:0];
        [_dealFootView.getbutton setImage:[UIImage imageNamed:@"conserve_investment_icon"] forState:0];
        
        [_dealFootView.sendButton setTitleColor:kBlueColor forState:0];
        [_dealFootView.sendButton setTitle:@" 申请结案" forState:0];
        [_dealFootView.sendButton setImage:[UIImage imageNamed:@"conserve_investment_icon"] forState:0];
        
        [_dealFootView.blueLabel setHidden:YES];
        [_dealFootView.longLineLabel setHidden:YES];
    }
    return _dealFootView;
}

#pragma mark -
#pragma mark - tableView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    return 1;
    if (section == 1){
        return 5;
    }else if (section ==2){
        return 3;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    if (indexPath.section == 0) {
    //        return kCellHeight;
    //    }else if (indexPath.section == 1){
    //        return 5*kCellHeight + 2;
    //    }
    
    //    if (indexPath.section <2) {
    //        return kCellHeight;
    //    }
    
    if ((indexPath.section == 2) && (indexPath.row == 1)) {
        return 145;
    }
    
    
    return kCellHeight;
    //    return 2*kCellHeight + 135 + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    
    if (indexPath.section == 0) {
        identifier = @"dealing0";
        
        MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = UIColorFromRGB(0x42566d);
        
        [cell.userNameButton setTitle:@"产品编号:RZ201605030001" forState:0];
        cell.userNameButton.titleLabel.font = kFirstFont;
        [cell.userNameButton setTitleColor:UIColorFromRGB(0xcfd4e8) forState:0];
        
        [cell.userActionButton setTitle:@"处理中" forState:0];
        [cell.userActionButton setTitleColor:kNavColor forState:0];
        cell.userActionButton.titleLabel.font = kBigFont;
        
        return cell;
        
    }else if (indexPath.section == 1){
        identifier = @"dealing1";
        MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSArray *dataArray = @[@"|  展示信息",@"投资类型",@"借款金额",@"借款利率",@"返点"];
        NSArray *imageArray = @[@"",@"conserve_investment_icon",@"conserve_loan_icon",@"conserve_interest_icon",@"conserve_rebate_icon"];
        [cell.userNameButton setTitle:dataArray[indexPath.row] forState:0];
        [cell.userNameButton setImage:[UIImage imageNamed:imageArray[indexPath.row]] forState:0];
        
        if (indexPath.row == 0) {
            [cell.userNameButton setTitleColor:kBlueColor forState:0];
        }
        
        return cell;
    }else if(indexPath.section == 2){
        if (indexPath.row == 0) {
            identifier = @"dealing20";
            MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cell) {
                cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [cell.userNameButton setTitle:@"|  基本信息" forState:0];
            [cell.userNameButton setTitleColor:kBlueColor forState:0];
            
            return cell;
        }else if (indexPath.row == 1){
            identifier = @"dealing21";
            BidMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cell) {
                cell = [[BidMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            NSMutableAttributedString *deallineStr = [cell.deadlineLabel setAttributeString:@"借款期限：    " withColor:kBlackColor andSecond:@"6个月" withColor:kLightGrayColor withFont:12];
            [cell.deadlineLabel setAttributedText:deallineStr];
            
            NSMutableAttributedString *dateStr = [cell.dateLabel setAttributeString:@"资金到帐日：" withColor:kBlackColor andSecond:@"6个月" withColor:kLightGrayColor withFont:12];
            [cell.dateLabel setAttributedText:dateStr];
            
            NSMutableAttributedString *areaStr = [cell.areaLabel setAttributeString:@"抵押物面积：" withColor:kBlackColor andSecond:@"100m" withColor:kLightGrayColor withFont:12];
            [cell.areaLabel setAttributedText:areaStr];
            
            NSMutableAttributedString *addressStr = [cell.addressLabel setAttributeString:@"抵押物地址：" withColor:kBlackColor andSecond:@"上海市浦东新区浦东南路855号" withColor:kLightGrayColor withFont:12];
            [cell.addressLabel setAttributedText:addressStr];
            
            return cell;
        }else{
            identifier = @"dealing22";
            BidOneCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cell) {
                cell = [[BidOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [cell.oneButton setTitle:@"查看补充信息" forState:0];
            
            return cell;
        }
    }
    
    identifier = @"dealing3";
    MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell.userNameButton setTitle:@"查看进度" forState:0];

    [cell.userActionButton setImage:[UIImage imageNamed:@"list_more"] forState:0];
    [cell.userActionButton setTitle:@"查看" forState:0];
    
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

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    footView.backgroundColor = kBackColor;
    self.dealingTableView.tableFooterView = footView;
    return footView;
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
