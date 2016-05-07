//
//  MyPublishingViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/6.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyPublishingViewController.h"
#import "AuthenBaseView.h"
#import "BidCellView.h"
#import "BidSingleView.h"

@interface MyPublishingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *publishingTableView;
@property (nonatomic,strong) AuthenBaseView *sec0;
@property (nonatomic,strong) BidCellView *sec1;
@property (nonatomic,strong) BidSingleView *sec2;

@end

@implementation MyPublishingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"申请记录" style:UIBarButtonItemStylePlain target:self action:@selector(showRecordList)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview: self.publishingTableView];
}

- (void)showRecordList
{
    
}

- (UITableView *)publishingTableView
{
    if (!_publishingTableView) {
        _publishingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStyleGrouped];
        _publishingTableView.delegate = self;
        _publishingTableView.dataSource = self;
        _publishingTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    }
    return _publishingTableView;
}

- (AuthenBaseView *)sec0
{
    if (!_sec0) {
        _sec0 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _sec0.backgroundColor = kBlueColor;
        
        _sec0.label.text = @"产品编号：RZ201605030001";
        _sec0.label.textColor = kNavColor;
        
        _sec0.textField.userInteractionEnabled = NO;

        [_sec0.button setTitle:@"发布中" forState:0];
        [_sec0.button setTitleColor:[UIColor whiteColor] forState:0];
    }
    return _sec0;
}






- (BidCellView *)sec1
{
    if (!_sec1) {
        _sec1 = [[BidCellView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 5*kCellHeight+2)];
    }
    return _sec1;
}

- (BidSingleView *)sec2
{
    if (!_sec2) {
        _sec2 = [[BidSingleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 135+2*kCellHeight+1)];
    }
    return _sec2;
}

#pragma mark - 
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
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
    static NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"sec0";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:self.sec0];
        return cell;
        
    }else if (indexPath.section == 1){
        identifier = @"sec1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell addSubview:self.sec1];
        return cell;
    }
    
    identifier = @"sec2";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell addSubview:self.sec2];
    
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
