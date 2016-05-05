//
//  MyDetailSaveViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/3.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyDetailSaveViewController.h"

#import "AuthenBaseView.h"
#import "CompletCellView.h"
#import "DetailView.h"
#import "DetailBaseView.h"
#import "BaseCommitButton.h"


#import "BidCellView.h"
#import "BidSingleView.h"

@interface MyDetailSaveViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UITableView *detailSaveTableView;
@property (nonatomic,strong) AuthenBaseView *sectionView0;
@property (nonatomic,strong) BidCellView *sectionView1;
@property (nonatomic,strong) BidSingleView *sectionView2;

@property (nonatomic,strong) BaseCommitButton *footerView;

@end

@implementation MyDetailSaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit)];
    
    [self.view addSubview:self.detailSaveTableView];
    [self.view addSubview:self.footerView];
}

- (void)edit
{
    
}

- (UITableView *)detailSaveTableView
{
    if (!_detailSaveTableView) {
        _detailSaveTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStyleGrouped];
        _detailSaveTableView.delegate = self;
        _detailSaveTableView.dataSource = self;
        _detailSaveTableView.tableFooterView = [[UIView alloc] init];
        _detailSaveTableView.separatorColor = kSeparateColor;
    }
    return _detailSaveTableView;
}

- (AuthenBaseView *)sectionView0
{
    if (!_sectionView0) {
        _sectionView0 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _sectionView0.backgroundColor = kBlueColor;
        _sectionView0.label.text = @"产品编号:";
        _sectionView0.label.textColor = kNavColor;
        _sectionView0.textField.text = @"RZ201605030001";
        _sectionView0.textField.userInteractionEnabled = NO;
        _sectionView0.textField.textColor = kNavColor;
        [_sectionView0.button setTitle:@"待发布" forState:0];
        [_sectionView0.button setTitleColor:kNavColor forState:0];
    }
    return _sectionView0;
}

- (BidCellView *)sectionView1
{
    if (!_sectionView1) {
        _sectionView1 = [[BidCellView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 5*kCellHeight+2)];
    }
    return _sectionView1;
}

- (BidSingleView *)sectionView2
{
    if (!_sectionView2) {
        _sectionView2 = [[BidSingleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 135+2*kCellHeight+1)];
    }
    return _sectionView2;
}

- (BaseCommitButton *)footerView
{
    if (!_footerView) {
        _footerView = [[BaseCommitButton alloc] initWithFrame:CGRectMake(0, kScreenHeight-kNavHeight-kCellHeight, kScreenWidth, kCellHeight)];
        [_footerView setTitle:@"立即发布" forState:0];
    }
    return _footerView;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
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
    static NSString *identifier = @"saveDetail";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        [cell addSubview:self.sectionView0];
    }else if (indexPath.section == 1){
        [cell addSubview:self.sectionView1];

    }else{
        [cell addSubview:self.sectionView2];
    }
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
