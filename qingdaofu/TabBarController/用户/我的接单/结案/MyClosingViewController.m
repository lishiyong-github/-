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

#import "MineUserCell.h"
#import "BidMessageCell.h"
#import "BidOneCell.h"
#import "UIView+UITextColor.h"
#import "BaseCommitButton.h"

#import "MyOrderDetailCell.h"//进度详情

@interface MyClosingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *myClosingTableView;
@property (nonatomic,strong) BaseCommitButton *closingCommitButton;

@end

@implementation MyClosingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"查看发布方" style:UIBarButtonItemStylePlain target:self action:@selector(checkClosingDetail)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview:self.myClosingTableView];
    [self.view addSubview:self.closingCommitButton];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.myClosingTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.myClosingTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTabBarHeight];
        
        [self.closingCommitButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.closingCommitButton autoSetDimension:ALDimensionHeight toSize:kTabBarHeight];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

#pragma mark - setter and getter
- (UITableView *)myClosingTableView
{
    if (!_myClosingTableView) {
        _myClosingTableView = [UITableView newAutoLayoutView];
        _myClosingTableView.translatesAutoresizingMaskIntoConstraints = YES;
        _myClosingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _myClosingTableView.delegate = self;
        _myClosingTableView.dataSource = self;
    }
    return _myClosingTableView;
}

- (BaseCommitButton *)closingCommitButton
{
    if (!_closingCommitButton) {
        _closingCommitButton = [BaseCommitButton newAutoLayoutView];
        [_closingCommitButton setTitle:@"追加评价" forState:0];
        
        QDFWeakSelf;
        [_closingCommitButton addAction:^(UIButton *btn) {
            AdditionalEvaluateViewController *additionalEvaluateVC = [[AdditionalEvaluateViewController alloc] init];
            [weakself.navigationController pushViewController:additionalEvaluateVC animated:YES];
        }];
    }
    return _closingCommitButton;
}

#pragma mark -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return 1;
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 5;
    }else if (section == 2){
        return 3;
    }else if (section == 3){
        return 2;
    }
    return 2;  //动态
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section == 0) {
//        return kCellHeight;
//    }else if (indexPath.section == 1){
//        return 5*kCellHeight + 2;
//    }else if (indexPath.section == 2){
//        return 2*kCellHeight + 135 + 1;
//    }else if (indexPath.section == 3){
//        return kCellHeight + 120 + 1;
//    }
//    return 100;
    if ((indexPath.section == 2) && (indexPath.row == 1)) {
        return 145;
    }else if ((indexPath.section == 3) && (indexPath.row == 1)){
        return 100;
    }else if ((indexPath.section == 4) && (indexPath.row == 1)){
        return 60;
    }
    
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"closing0";
        MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = UIColorFromRGB(0x42566d);
        
        [cell.userNameButton setTitleColor:UIColorFromRGB(0xcfd4e8) forState:0];
        [cell.userNameButton setTitle:@"产品编号：RZ201605030001" forState:0];
        cell.userNameButton.titleLabel.font = kFirstFont;
        
        [cell.userActionButton setTitle:@"已结案" forState:0];
        [cell.userActionButton setTitleColor:kNavColor forState:0];
        cell.userActionButton.titleLabel.font = kBigFont;
        
        return cell;
        
    }else if (indexPath.section == 1){
        identifier = @"closing1";
        MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        NSArray *dataArray = @[@"|  展示信息",@"  投资类型",@"  借款金额",@"  风险费率",@"  债权类型"];
        NSArray *imageArray = @[@"",@"conserve_investment_icon",@"conserve_loan_icon",@"conserve_risk_icon",@"conserve_rights_icon"];
        [cell.userNameButton setTitle:dataArray[indexPath.row] forState:0];
        [cell.userNameButton setImage:[UIImage imageNamed:imageArray[indexPath.row]] forState:0];
        
        if (indexPath.row == 0) {
            [cell.userNameButton setTitleColor:kBlueColor forState:0];
        }
        
        return cell;
        
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            identifier = @"closing20";
            MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cell) {
                cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [cell.userNameButton setTitle:@"|  基本信息" forState:0];
            [cell.userNameButton setTitleColor:kBlueColor forState:0];
            
            return cell;
            
        }else if (indexPath.row == 1){
            identifier = @"closing21";
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
            identifier = @"ending22";
            BidOneCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cell) {
                cell = [[BidOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [cell.oneButton setTitle:@"查看补充信息" forState:0];
            
            return cell;
        }
    }else if(indexPath.section == 3){
        if (indexPath.row == 0) {
            identifier = @"closing30";
            MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [cell.userNameButton setTitleColor:kBlueColor forState:0];
            [cell.userNameButton setTitle:@"|  进度详情" forState:0];
            
            return cell;
            
        }else if (indexPath.row == 1){
            identifier = @"closing31";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = kYellowColor;
            
            return cell;
        }
    }else{
        if (indexPath.row ==0) {
            identifier = @"closing40";
            MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell .selectionStyle = UITableViewCellSelectionStyleNone;
            
            [cell.userNameButton setTitle:@"|  给出的评价" forState:0];
            [cell.userNameButton setTitleColor:kBlueColor forState:0];
            
            return cell;
            
        }else{
            identifier = @"closing41";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = kYellowColor;
            
            return cell;
        }
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kBigPadding;
}

#pragma mark - method
- (void)checkClosingDetail
{
    CheckDetailPublishViewController *checkDetailPublishVC = [[CheckDetailPublishViewController alloc] init];
    [self.navigationController pushViewController:checkDetailPublishVC animated:YES];
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
