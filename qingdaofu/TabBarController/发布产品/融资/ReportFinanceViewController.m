//
//  ReportFinanceViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/9.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReportFinanceViewController.h"
#import "BidCellView.h"
#import "BaseCommitButton.h"

@interface ReportFinanceViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *reportFinanceTableView;
@property (nonatomic,strong) BidCellView *secc0;
@property (nonatomic,strong) UIView *secc1;

@property (nonatomic,strong) BaseCommitButton *openFooterView;

@property (nonatomic,strong) NSMutableArray *dataList;

@end

@implementation ReportFinanceViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发布融资";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.reportFinanceTableView];
}

- (UITableView *)reportFinanceTableView
{
    if (!_reportFinanceTableView) {
        _reportFinanceTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _reportFinanceTableView.delegate = self;
        _reportFinanceTableView.dataSource = self;
        _reportFinanceTableView.backgroundColor = kBackColor;
        _reportFinanceTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        [_reportFinanceTableView.tableFooterView addSubview:self.openFooterView];
        _reportFinanceTableView.tableFooterView.backgroundColor = kBackColor;
    }
    return _reportFinanceTableView;
}

- (BidCellView *)secc0
{
    if (!_secc0) {
        _secc0 = [[BidCellView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 5*kCellHeight+5*kLineWidth+60)];
    }
    return _secc0;
}

- (UIView *)secc1
{
    if (!_secc1) {
        _secc1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
        _secc1.backgroundColor = kRedColor;
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

- (BaseCommitButton *)openFooterView
{
    if (!_openFooterView) {
        _openFooterView = [[BaseCommitButton alloc] initWithFrame:CGRectMake(kBigPadding, kBigPadding, kScreenWidth-kBigPadding*2, 60)];
        _openFooterView.backgroundColor = kBlueColor;
        [_openFooterView setTitle:@"点击展开" forState:0];
        [_openFooterView setTitle:@"点击收起" forState:UIControlStateSelected];
        
        QDFWeakSelf;
        [_openFooterView addAction:^(UIButton *btn) {
            btn.selected = !btn.selected;
            if (btn.selected) {
                [weakself.dataList insertObject:@"大喊大叫" atIndex:1];
                NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:1];
                [weakself.reportFinanceTableView insertSections:set withRowAnimation:UITableViewRowAnimationFade];
            }else{
                [weakself.dataList removeObjectAtIndex:1];
                NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:1];
                [weakself.reportFinanceTableView deleteSections:set withRowAnimation:UITableViewRowAnimationFade];
            }
            
            [weakself.reportFinanceTableView reloadData];
        }];
    }
    return _openFooterView;
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
        return 5*kCellHeight+5*kLineWidth+60;
    }
    return 200.f;
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
    
    if (indexPath.section == 0) {
        [cell addSubview:self.secc0];
    }else{
        [cell addSubview:self.secc1];
    }
    
    return cell;
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
