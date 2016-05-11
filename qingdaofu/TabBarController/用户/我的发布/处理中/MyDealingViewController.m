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

#import "BidZeroCell.h"
#import "BidCell.h"
#import "BidSingleCell.h"

//#import "AuthenBaseView.h"
//#import "BidCellView.h"
//#import "BidSingleView.h"
//#import "BaseLabel.h"
#import "EvaTopSwitchView.h"

@interface MyDealingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *dealingTableView;
//@property (nonatomic,strong) AuthenBaseView *sect0;
//@property (nonatomic,strong) BidCellView *sect1;
//@property (nonatomic,strong) BidSingleView *sect2;
//@property (nonatomic,strong) BaseLabel *sect3;
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
}

- (void)checkPublishUserDetail
{
    CheckDetailPublishViewController *checkDetailPublishVc = [[CheckDetailPublishViewController alloc] init];
    [self.navigationController pushViewController:checkDetailPublishVc animated:YES];
}

- (UITableView *)dealingTableView
{
    if (!_dealingTableView) {
        _dealingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStyleGrouped];
        _dealingTableView.delegate = self;
        _dealingTableView.dataSource = self;
        _dealingTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding+kTabBarHeight)];
    }
    return _dealingTableView;
}

- (EvaTopSwitchView *)dealFootView
{
    if (!_dealFootView) {
        _dealFootView = [[EvaTopSwitchView alloc] initWithFrame:CGRectMake(0, kScreenHeight-kNavHeight-kTabBarHeight, kScreenWidth, kTabBarHeight)];
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
    }else if (indexPath.section == 2){
        return 2*kCellHeight + 135 + 1;
    }
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"sect0";
        BidZeroCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[BidZeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        cell.bigProView.backgroundColor = kBlueColor;
        
        cell.bigProView.label.text = @"产品编号：RZ201605030001";
        cell.bigProView.label.textColor = kNavColor;
        
        cell.bigProView.textField.userInteractionEnabled = NO;
        
        [cell.bigProView.button setTitle:@"处理中" forState:0];
        [cell.bigProView.button setTitleColor:kNavColor forState:0];
        cell.bigProView.button.titleLabel.font = kBigFont;

        return cell;
        
    }else if (indexPath.section == 1){
        identifier = @"sect1";
        BidCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[BidCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSArray *secImageArray = @[@"conserve_investment_icon",@"conserve_loan_icon",@"conserve_interest_icon",@"conserve_rebate_icon"];
        
        cell.cellView1.label.text = @"|  展示信息";
        cell.cellView1.textField.userInteractionEnabled= NO;
        
        [cell.cellView2.imageView1 setImage:[UIImage imageNamed:secImageArray[0]]];
        cell.cellView2.label1.text = @"投资类型";
        
        [cell.cellView3.imageView1 setImage:[UIImage imageNamed:secImageArray[1]]];
        cell.cellView3.label1.text = @"借款金额";
        
        [cell.cellView4.imageView1 setImage:[UIImage imageNamed:secImageArray[2]]];
        cell.cellView4.label1.text = @"借款利率";
        
        [cell.cellView5.imageView1 setImage:[UIImage imageNamed:secImageArray[3]]];
        cell.cellView5.label1.text = @"返点";
        
        return cell;
    }else if (indexPath.section == 2){
        
        identifier = @"sect2";
        BidSingleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[BidSingleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        cell.cellView6.label.text = @"｜  基本信息";
        cell.cellView6.textField.userInteractionEnabled = NO;
        
        cell.cellView7.complete1.label1.text = @"借款期限:";
        cell.cellView7.complete1.label2.text = @"6个月";
        
        cell.cellView7.complete2.label1.text = @"资金到帐日:";
        cell.cellView7.complete2.label2.text = @"1个月";
        
        cell.cellView7.complete3.label1.text = @"抵押物面积:";
        cell.cellView7.complete3.label2.text = @"100M²";
        
        cell.cellView7.complete4.label1.text = @"抵押物地址:";
        cell.cellView7.complete4.label2.text = @"上海市浦东新区浦东南路855号世界广场35楼";
        
        [cell.cellView8 setTitle:@"查看补充信息 >" forState:0];
        QDFWeakSelf;
        [cell.cellView8 addAction:^(UIButton *btn) {
            AdditionMessageViewController *addtionMessageVC = [[AdditionMessageViewController alloc] init];
            [weakself.navigationController pushViewController:addtionMessageVC animated:YES];
        }];
        
        return cell;
    }
    
    identifier = @"sect0";
    BidZeroCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[BidZeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.bigProView.label.text = @"查看进度";
    [cell.bigProView.button setTitle:@"查看" forState:0];
    [cell.bigProView.button setImage:[UIImage imageNamed:@"list_more"] forState:0];
    
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
