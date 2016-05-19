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

#import "MineUserCell.h"
#import "BidMessageCell.h"
#import "BidOneCell.h"

#import "UIView+UITextColor.h"

//#import "BidZeroCell.h"
//#import "BidCell.h"
//#import "BidSingleCell.h"
#import "MyOrderDetailCell.h"

@interface MyProcessingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *myProcessingTableView;
@property (nonatomic,strong) BaseCommitButton *processingCommitButton;

@end

@implementation MyProcessingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"查看发布方" style:UIBarButtonItemStylePlain target:self action:@selector(checkDetail)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview:self.myProcessingTableView];
    [self.view addSubview:self.processingCommitButton];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.myProcessingTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.myProcessingTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTabBarHeight];
        
        [self.processingCommitButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.processingCommitButton autoSetDimension:ALDimensionHeight toSize:kTabBarHeight];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)myProcessingTableView
{
    if (!_myProcessingTableView) {
        _myProcessingTableView = [UITableView newAutoLayoutView];
        _myProcessingTableView.translatesAutoresizingMaskIntoConstraints = YES;
        _myProcessingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _myProcessingTableView.delegate = self;
        _myProcessingTableView.dataSource = self;
    }
    return _myProcessingTableView;
}
- (BaseCommitButton *)processingCommitButton
{
    if (!_processingCommitButton) {
        _processingCommitButton = [BaseCommitButton newAutoLayoutView];
        [_processingCommitButton setTitle:@"申请结案" forState:0];
    }
    return _processingCommitButton;
}

#pragma mark - 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 5;
    }else if ((section == 2) || section == 4){
        return 3;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section == 1) {
//        return 5*kCellHeight + 2;
//    }else if (indexPath.section == 2){
//        return 2*kCellHeight + 135 + 1;
//    }else if (indexPath.section == 4){
//        return kCellHeight*2 + 120 + 1;
//    }
    
    if ((indexPath.section == 2) && (indexPath.row == 1)) {
        return 145;
    }else if ((indexPath.section == 4) && (indexPath.row == 1)){
        return 100;
    }
    
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"processing0";
        MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = UIColorFromRGB(0x42566d);
        
        [cell.userNameButton setTitleColor:UIColorFromRGB(0xcfd4e8) forState:0];
        [cell.userNameButton setTitle:@"产品编号：RZ201605030001" forState:0];
        cell.userNameButton.titleLabel.font = kFirstFont;
        
        [cell.userActionButton setTitle:@"已终止" forState:0];
        [cell.userActionButton setTitleColor:kNavColor forState:0];
        cell.userActionButton.titleLabel.font = kBigFont;
        
        return cell;
    }else if (indexPath.section == 1){
        identifier = @"processing1";
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
            identifier = @"processing20";
            MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cell) {
                cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [cell.userNameButton setTitle:@"|  基本信息" forState:0];
            [cell.userNameButton setTitleColor:kBlueColor forState:0];
            
            return cell;
            
        }else if (indexPath.row == 1){
            identifier = @"processing21";
            BidMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cell) {
                cell = [[BidMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            NSMutableAttributedString *deallineStr = [cell.deadlineLabel setAttributeString:@"还款方式：    " withColor:kBlackColor andSecond:@"按月付息，到期还本" withColor:kLightGrayColor withFont:12];
            [cell.deadlineLabel setAttributedText:deallineStr];
            
            NSMutableAttributedString *dateStr = [cell.dateLabel setAttributeString:@"资金到帐日：" withColor:kBlackColor andSecond:@"6个月" withColor:kLightGrayColor withFont:12];
            [cell.dateLabel setAttributedText:dateStr];
            
            NSMutableAttributedString *areaStr = [cell.areaLabel setAttributeString:@"抵押物面积：" withColor:kBlackColor andSecond:@"100m" withColor:kLightGrayColor withFont:12];
            [cell.areaLabel setAttributedText:areaStr];
            
            NSMutableAttributedString *addressStr = [cell.addressLabel setAttributeString:@"抵押物地址：" withColor:kBlackColor andSecond:@"上海市浦东新区浦东南路855号" withColor:kLightGrayColor withFont:12];
            [cell.addressLabel setAttributedText:addressStr];
            
            return cell;
        }else{
            identifier = @"processing22";
            BidOneCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cell) {
                cell = [[BidOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [cell.oneButton setTitle:@"查看补充信息" forState:0];
            
            return cell;
        }
    }else if (indexPath.section == 3){

        identifier = @"processing3";
        MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

        if (!cell) {
            cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.userNameButton setTitle:@"|  服务协议" forState:0];
        [cell.userNameButton setTitleColor:kBlueColor forState:0];
        
        [cell.userActionButton setImage:[UIImage imageNamed:@"list_more"] forState:0];
        [cell.userActionButton setTitle:@"点击查看" forState:0];
        cell.userActionButton.titleLabel.font = kSecondFont;
        [cell.userActionButton setTitleColor:kLightGrayColor forState:0];
        
        return cell;
    }else if (indexPath.section == 4){
        if (indexPath.row == 0) {
            identifier = @"processing40";
            MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.userNameButton setTitleColor:kBlueColor forState:0];
            [cell.userNameButton setTitle:@"|  进度详情" forState:0];
            
            return cell;
            
        }else if (indexPath.row == 1){
            identifier = @"processing41";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = kYellowColor;
            
            return cell;
            
        }else{
            identifier = @"processing42";
            BidOneCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[BidOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.oneButton setTitle:@"填写进度" forState:0];
            
            return cell;
        }
    }
    
    identifier = @"processing5";
    MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.userNameButton setTitleColor:kBlueColor forState:0];
    [cell.userNameButton setTitle:@"|  申请延期" forState:0];
    
    [cell.userActionButton setImage:[UIImage imageNamed:@"list_more"] forState:0];
    [cell.userActionButton setTitle:@"立即申请" forState:0];
    [cell.userActionButton setTitleColor:kLightGrayColor forState:0];
    
    return cell;
    
    
//    static NSString *identifier;
//    if (indexPath.section == 0) {
//        identifier = @"s0";
//        BidZeroCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//        
//        if (!cell) {
//            cell = [[BidZeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        }
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//        cell.bigProView.backgroundColor = kBlueColor;
//        cell.bigProView.label.text = @"产品编号:";
//        cell.bigProView.label.textColor = kNavColor;
//        cell.bigProView.textField.text = @"RZ201605030001";
//        cell.bigProView.textField.userInteractionEnabled = NO;
//        cell.bigProView.textField.textColor = kNavColor;
//        [cell.bigProView.button setTitle:@"已终止" forState:0];
//        [cell.bigProView.button setTitleColor:kNavColor forState:0];
//        
//        return cell;
//        
//    }else if (indexPath.section == 1){
//        identifier = @"s1";
//        BidCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//        
//        if (!cell) {
//            cell = [[BidCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        }
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//        NSArray *secImageArray = @[@"conserve_investment_icon",@"conserve_loan_icon",@"conserve_risk_icon",@"conserve_rights_icon"];
//        cell.cellView2.imageView1.image = [UIImage imageNamed:secImageArray[0]];
//        cell.cellView3.imageView1.image = [UIImage imageNamed:secImageArray[1]];
//        cell.cellView4.imageView1.image = [UIImage imageNamed:secImageArray[2]];
//        cell.cellView5.imageView1.image = [UIImage imageNamed:secImageArray[3]];
//        
//        return cell;
//    }else if (indexPath.section == 2){
//        identifier = @"s2";
//        BidSingleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//        
//        if (!cell) {
//            cell = [[BidSingleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        }
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        
//        return cell;
//        
//    }else if (indexPath.section == 3){
//        identifier = @"s0";
//        BidZeroCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//        
//        if (!cell) {
//            cell = [[BidZeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        }
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//        cell.backgroundColor = kNavColor;
//        cell.bigProView.label.text = @"|  服务协议";
//        cell.bigProView.label.textColor = kBlueColor;
//        cell.bigProView.textField.userInteractionEnabled = NO;
//        cell.bigProView.textField.placeholder = @"";
//        [cell.bigProView.button setTitle:@"点击查看 >" forState:0];
//        cell.bigProView.button.titleLabel.font = kSecondFont;
//        [cell.bigProView.button setTitleColor:kLightGrayColor forState:0];
//        
//        return cell;
//        
//    }else if (indexPath.section == 4){
//        identifier = @"s4";
//        MyOrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//        
//        if (!cell) {
//            cell = [[MyOrderDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        }
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        
//        return cell;
//    }
//    
//    identifier = @"s0";
//    
//    BidZeroCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    
//    if (!cell) {
//        cell = [[BidZeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//    cell.bigProView.backgroundColor = kNavColor;
//    cell.bigProView.label.text = @"|  申请延期";
//    cell.bigProView.label.textColor = kBlueColor;
//    cell.bigProView.textField.userInteractionEnabled = NO;
//    [cell.bigProView.button setTitle:@"立即申请 >" forState:0];
//    [cell.bigProView.button setTitleColor:kLightGrayColor forState:0];
//    cell.bigProView.button.titleLabel.font = kSecondFont;
//
//    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section > 4) {
        return 40;
    }
    return kBigPadding;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 5) {
        DelayRequestViewController *delayRequestVC = [[DelayRequestViewController alloc] init];
        [self.navigationController pushViewController:delayRequestVC animated:YES];
    }
}

#pragma mark - method
- (void)checkDetail
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
