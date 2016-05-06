//
//  ReceiveMessagesViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/6.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReceiveMessagesViewController.h"
#import "NewsCell.h"

@interface ReceiveMessagesViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *ReceiveTableView;

@end

@implementation ReceiveMessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"接单消息";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.ReceiveTableView];
}

- (UITableView *)ReceiveTableView
{
    if (!_ReceiveTableView) {
        _ReceiveTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStylePlain];
        _ReceiveTableView.delegate = self;
        _ReceiveTableView.dataSource = self;
        _ReceiveTableView.backgroundColor = kBackColor;
        _ReceiveTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _ReceiveTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    }
    return _ReceiveTableView;
}

#pragma mark -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"newsList";
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectedBackgroundView = [[UIView alloc] init];
    cell.selectedBackgroundView.backgroundColor = UIColorFromRGB(0xdee8ed);
    
    //    cell.leftWidthConstraints.constant = kBigPadding;
    cell.typeLabel.text = @"申请消息";
    cell.timeLabel.text = @"2016-12-12 10:10";
    cell.contextLabel.text = @"您发布的融资RZ201601010001有心得申请记录";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kBigPadding;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = kBackColor;
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
