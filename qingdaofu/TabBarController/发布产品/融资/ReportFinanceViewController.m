//
//  ReportFinanceViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/9.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReportFinanceViewController.h"
#import "ReportFiSucViewController.h"   //发布成功

#import "ReportFiView.h"
#import "ReportAddView.h"
#import "ReportFootView.h"
#import "EvaTopSwitchView.h"

@interface ReportFinanceViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *reportFinanceTableView;
@property (nonatomic,strong) ReportFiView *secc0;
@property (nonatomic,strong) ReportAddView *secc1;
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
    }
    return _reportFinanceTableView;
}

- (ReportFiView *)secc0
{
    if (!_secc0) {
        _secc0 = [[ReportFiView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 5*kCellHeight+5*kLineWidth+62)];
    }
    return _secc0;
}

- (ReportAddView *)secc1
{
    if (!_secc1) {
        _secc1 = [[ReportAddView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight*7+kLineWidth*6)];
    }
    return _secc1;
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
//        [_openFooterView addTarget:self action:@selector(openAndClose:) forControlEvents:UIControlEventTouchUpInside];
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
//            [weakself presentViewController:reportFiSucVC animated:YES completion:nil];
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
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 5*kCellHeight+5*kLineWidth+62;
    }
    return kCellHeight*7+kLineWidth*6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"se0";
    }else{
        identifier = @"se1";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        [cell addSubview:self.secc0];
    }else{
        [cell addSubview:self.secc1];
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
