//
//  ReportSuitViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/10.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReportSuitViewController.h"
#import "ReportFiSucViewController.h"

#import "ReportSuitView.h"
#import "ReportSuitSeView.h"
#import "ReportFootView.h"
#import "EvaTopSwitchView.h"

@interface ReportSuitViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *repSuitTableView;

@property (nonatomic,strong) ReportSuitView *suitSect0;
@property (nonatomic,strong) ReportSuitSeView *suitSect1;
@property (nonatomic,strong) ReportFootView *repSuitFootButton;
@property (nonatomic,strong) EvaTopSwitchView *repSuitSwitchView;
@property (nonatomic,strong) NSMutableArray *suitDataList;

@end

@implementation ReportSuitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发布诉讼";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.repSuitTableView];
    [self.view addSubview:self.repSuitSwitchView];
}

- (UITableView *)repSuitTableView
{
    if (!_repSuitTableView) {
        _repSuitTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavHeight, kScreenWidth, kScreenHeight-kNavHeight-kTabBarHeight) style:UITableViewStyleGrouped];
        _repSuitTableView.backgroundColor = kBackColor;
        _repSuitTableView.delegate = self;
        _repSuitTableView.dataSource = self;
        _repSuitTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 90)];
        [_repSuitTableView.tableFooterView addSubview:self.repSuitFootButton];
        _repSuitTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kSmallPadding)];
    }
    return _repSuitTableView;
}

- (ReportSuitView *)suitSect0
{
    if (!_suitSect0) {
        _suitSect0 = [[ReportSuitView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 5*kCellHeight+5*kLineWidth+62)];
    }
    return _suitSect0;
}

-  (ReportSuitSeView *)suitSect1
{
    if (!_suitSect1) {
        _suitSect1 = [[ReportSuitSeView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight*13+kLineWidth*13+62)];
    }
    return _suitSect1;
}

- (EvaTopSwitchView *)repSuitSwitchView
{
    if (!_repSuitSwitchView) {
        _repSuitSwitchView = [[EvaTopSwitchView alloc] initWithFrame:CGRectMake(0, kScreenHeight-kTabBarHeight, kScreenWidth, kTabBarHeight)];
        _repSuitSwitchView.backgroundColor = kNavColor;
        [_repSuitSwitchView.getbutton setTitle:@"  保存" forState:0];
        [_repSuitSwitchView.getbutton setImage:[UIImage imageNamed:@"save"] forState:0];
        [_repSuitSwitchView.getbutton setTitleColor:kBlueColor forState:0];
        
        [_repSuitSwitchView.sendButton setTitle:@"  立即发布" forState:0];
        [_repSuitSwitchView.sendButton setImage:[UIImage imageNamed:@"publish"] forState:0];
        [_repSuitSwitchView.sendButton setTitleColor:kBlueColor forState:0];
        
        QDFWeakSelf;
        [_repSuitSwitchView.sendButton addAction:^(UIButton *btn) {
            ReportFiSucViewController *reportSuccessVC = [[ReportFiSucViewController alloc] init];
//            UIViewController *VC = [UIApplication sharedApplication].keyWindow.rootViewController;
//            [VC.navigationController pushViewController:reportSuccessVC animated:YES];
            [weakself presentViewController:reportSuccessVC animated:YES completion:nil];
            
        }];
    }
    return _repSuitSwitchView;
}

- (ReportFootView *)repSuitFootButton
{
    if (!_repSuitFootButton) {
        _repSuitFootButton = [[ReportFootView alloc] initWithFrame:CGRectMake(kBigPadding, 0, kScreenWidth-kBigPadding*2, 70)];
        _repSuitFootButton.backgroundColor = kBlueColor;
        //        [_repSuitFootButton addTarget:self action:@selector(openAndClose:) forControlEvents:UIControlEventTouchUpInside];
        [_repSuitFootButton.footButton addTarget:self action:@selector(openAndClose:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _repSuitFootButton;
}


- (NSMutableArray *)suitDataList
{
    if (!_suitDataList) {
        _suitDataList = [[NSMutableArray alloc] initWithObjects:@"老大旅", nil];
    }
    return _suitDataList;
}

#pragma mark - 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.suitDataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 5*kCellHeight+5*kLineWidth+62;
    }
    return kCellHeight*13+kLineWidth*13+62;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"suitSect0";
    }else{
        identifier = @"suitSect1";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        [cell addSubview:self.suitSect0];
    }else{
        [cell addSubview:self.suitSect1];
    }
    
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
        [self.suitDataList insertObject:@"大喊大叫" atIndex:1];
        NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:1];
        [self.repSuitTableView insertSections:set withRowAnimation:UITableViewRowAnimationFade];
    }else{
        [self.suitDataList removeObjectAtIndex:1];
        NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:1];
        [self.repSuitTableView deleteSections:set withRowAnimation:UITableViewRowAnimationFade];
    }
    [self.repSuitTableView reloadData];
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
