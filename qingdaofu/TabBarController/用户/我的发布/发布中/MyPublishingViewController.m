//
//  MyPublishingViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/6.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyPublishingViewController.h"
#import "AdditionMessageViewController.h"  //补充信息

//#import "BidZeroCell.h"
//#import "BidCell.h"
//#import "BidSingleCell.h"

#import "MineUserCell.h"
#import "BidMessageCell.h"
#import "BidOneCell.h"
#import "UIView+UITextColor.h"

@interface MyPublishingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *publishingTableView;

@end

@implementation MyPublishingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"申请记录" style:UIBarButtonItemStylePlain target:self action:@selector(showRecordList)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview: self.publishingTableView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)showRecordList
{
    
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.publishingTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)publishingTableView
{
    if (!_publishingTableView) {
        _publishingTableView = [UITableView newAutoLayoutView];
        _publishingTableView.delegate = self;
        _publishingTableView.dataSource = self;
        _publishingTableView.backgroundColor = kBackColor;
    }
    return _publishingTableView;
}

#pragma mark -
#pragma mark - tableView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    return 1;
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 5;
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
        identifier = @"detailSave0";
        
        MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = UIColorFromRGB(0x42566d);
        
        [cell.userNameButton setTitle:@"产品编号:RZ201605030001" forState:0];
        cell.userNameButton.titleLabel.font = kFirstFont;
        [cell.userNameButton setTitleColor:UIColorFromRGB(0xcfd4e8) forState:0];
        
        [cell.userActionButton setTitle:@"待发布" forState:0];
        [cell.userActionButton setTitleColor:kNavColor forState:0];
        cell.userActionButton.titleLabel.font = kBigFont;
        
        return cell;
        
    }else if (indexPath.section == 1){
        identifier = @"detailSave1";
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
    }else{
        if (indexPath.row == 0) {
            identifier = @"detailSave20";
            MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cell) {
                cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [cell.userNameButton setTitle:@"|  基本信息" forState:0];
            [cell.userNameButton setTitleColor:kBlueColor forState:0];
            
            return cell;
        }else if (indexPath.row == 1){
            identifier = @"detailSave21";
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
            identifier = @"detailSave22";
            BidOneCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cell) {
                cell = [[BidOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [cell.oneButton setTitle:@"查看补充信息" forState:0];
            
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

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    footView.backgroundColor = kBackColor;
    self.publishingTableView.tableFooterView = footView;
    return footView;
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
