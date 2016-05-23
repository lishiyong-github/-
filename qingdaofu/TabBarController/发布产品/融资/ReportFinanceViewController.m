//
//  ReportFinanceViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/9.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReportFinanceViewController.h"
#import "ReportFiSucViewController.h"   //发布成功

//#import "ReportFiView.h"
//#import "ReportAddView.h"
#import "ReportFootView.h"
#import "EvaTopSwitchView.h"

#import "ReportFiCell.h"
#import "ReportAddCell.h"

#import "ReportFinanceCell.h"

@interface ReportFinanceViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *reportFinanceTableView;
//@property (nonatomic,strong) ReportFiView *secc0;
//@property (nonatomic,strong) ReportAddView *secc1;
@property (nonatomic,strong) ReportFootView *openFooterView;
@property (nonatomic,strong) EvaTopSwitchView *repFiSwitchView;
@property (nonatomic,strong) NSMutableArray *dataList;

@end

@implementation ReportFinanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"发布融资";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.reportFinanceTableView];
    [self.view addSubview:self.repFiSwitchView];
}

- (UITableView *)reportFinanceTableView
{
    if (!_reportFinanceTableView) {
        _reportFinanceTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTabBarHeight-kNavHeight) style:UITableViewStylePlain];
        _reportFinanceTableView.delegate = self;
        _reportFinanceTableView.dataSource = self;
        _reportFinanceTableView.backgroundColor = kBackColor;
        _reportFinanceTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        [_reportFinanceTableView.tableFooterView addSubview:self.openFooterView];
        _reportFinanceTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kSmallPadding)];
        _reportFinanceTableView.separatorColor = kSeparateColor;
    }
    return _reportFinanceTableView;
}

- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [[NSMutableArray alloc] initWithObjects:@"德国队后", nil];
    }
    return _dataList;
}

- (ReportFootView *)openFooterView
{
    if (!_openFooterView) {
        _openFooterView = [[ReportFootView alloc] initWithFrame:CGRectMake(kBigPadding, kBigPadding, kScreenWidth-kBigPadding*2, 70)];
        _openFooterView.backgroundColor = kBlueColor;
        [_openFooterView.footButton addTarget:self action:@selector(openAndClose:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openFooterView;
}

- (EvaTopSwitchView *)repFiSwitchView
{
    if (!_repFiSwitchView) {
        _repFiSwitchView = [[EvaTopSwitchView alloc] initWithFrame:CGRectMake(0, kScreenHeight-kTabBarHeight-kNavHeight, kScreenWidth, kTabBarHeight)];
        _repFiSwitchView.heightConstraint.constant = kTabBarHeight;
        _repFiSwitchView.backgroundColor = kNavColor;
        [_repFiSwitchView.blueLabel setHidden:YES];
        
        [_repFiSwitchView.getbutton setTitle:@"  保存" forState:0];
        [_repFiSwitchView.getbutton setImage:[UIImage imageNamed:@"save"] forState:0];
        [_repFiSwitchView.getbutton setTitleColor:kBlueColor forState:0];
        
        [_repFiSwitchView.sendButton setTitle:@"  立即发布" forState:0];
        [_repFiSwitchView.sendButton setImage:[UIImage imageNamed:@"publish"] forState:0];
        [_repFiSwitchView.sendButton setTitleColor:kBlueColor forState:0];
        
        QDFWeakSelf;
        [_repFiSwitchView.sendButton addAction:^(UIButton *btn) {
            ReportFiSucViewController *reportFiSucVC = [[ReportFiSucViewController alloc] init];
            [weakself.navigationController pushViewController:reportFiSucVC animated:YES];
        }];
    }
    return _repFiSwitchView;
}

#pragma mark - 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
//    if (section == 0) {
//        return 6;
//    }
//    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 5*kCellHeight+5*kLineWidth+62;
    }
    return kCellHeight*7+kLineWidth*6;
    
//    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    //= @"reportFi";
    
//    ReportFinanceCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (!cell) {
//        cell = [[ReportFinanceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//    
//    NSArray *ttArray = @[@[@"|  基本信息",@"借款本金",@"返点(%)",@"借款利率(%)",@"抵押物地址",@""],@[@"",@"借款期限",@"抵押物类型",@"抵押物状态",@"抵押物面积",@"借款人年龄",@"权利人年龄"]];
//    NSArray *placeArray = @[@[@"",@"填写您希望融资的金额",@"能够给到中介的返点，如没有请输入0",@"能够给到融资方的利息",@"小区/写字楼/商铺等",@"详细地址"],@[@"",@"",@"",@"",@"输入抵押物面积",@"请输入年龄，智能输入数字",@""]];
//    
//    cell.fiLabel.text = ttArray[indexPath.section][indexPath.row];
//    cell.fiTextField.placeholder = placeArray[indexPath.section][indexPath.row];
//    
//    if (indexPath.section == 0) {
//        if (indexPath.row == 0) {
//            cell.fiLabel.textColor = kBlueColor;
//            cell.fiTextField.userInteractionEnabled = NO;
//        }else if (indexPath.row ==1){
//            [cell.fiButton setTitle:@"万元" forState:0];
//        }else if (indexPath.row == 3){
//            [cell.fiButton setImage:[UIImage imageNamed:@"list_more"] forState:0];
//            [cell.fiButton setTitle:@"月" forState:0];
//        }else if (indexPath.row == 4){
//            cell.fiTextField.userInteractionEnabled = NO;
//            [cell.fiButton setTitle:@"有" forState:0];
//            [cell.fiButton setImage:[UIImage imageNamed:@"list_more"] forState:0];
//        }
//    }else{
//        if (indexPath.row == 0) {
//            NSString *str1 = @"|  补充信息";
//            NSString *str2 = @"(选填)";
//            NSString *str = [[NSString alloc] initWithFormat:@"%@%@",str1,str2];
//            NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:str];
//            [attStr addAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} range:NSMakeRange(0, str1.length)];
//            [attStr addAttributes:@{NSFontAttributeName:kSecondFont,NSForegroundColorAttributeName:kBlackColor} range:NSMakeRange(str1.length, str2.length)];
//            [cell.fiLabel setAttributedText:attStr];
//            
//        }else if (indexPath.row>0 && indexPath.row<4){
//            cell.fiTextField.userInteractionEnabled = NO;
//            [cell.fiButton setImage:[UIImage imageNamed:@"list_more"] forState:0];
//    
//            [cell.fiButton setTitle:@"月" forState:0];
//            
//        }else if (indexPath.row == 4){
//            
//            [cell.fiButton setTitle:@"平方" forState:0];
//        }else if (indexPath.row == 5){
//            [cell.fiButton setTitle:@"岁" forState:0];
//
//        }else{
//            cell.fiTextField.userInteractionEnabled = NO;
//            [cell.fiButton setTitle:@"65岁以下" forState:0];
//            [cell.fiButton setImage:[UIImage imageNamed:@"list_more"] forState:0];
//        }
//    }
//    
    
    if (indexPath.section == 0) {
        identifier = @"se0";
        ReportFiCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[ReportFiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    identifier = @"se1";
    
    ReportAddCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[ReportAddCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1f;
    }
    return kBigPadding;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = kBackColor;
        return view;
    }
    
    return nil;
}

- (void)openAndClose:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [self.dataList insertObject:@"大喊大叫" atIndex:1];
        NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:1];
        [self.reportFinanceTableView insertSections:set withRowAnimation:UITableViewRowAnimationFade];
    }else{
        [self.dataList removeObjectAtIndex:1];
        NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:1];
        [self.reportFinanceTableView deleteSections:set withRowAnimation:UITableViewRowAnimationFade];
    }
    
    [self.reportFinanceTableView reloadData];
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
