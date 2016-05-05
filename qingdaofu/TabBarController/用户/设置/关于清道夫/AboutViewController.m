//
//  AboutViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/3.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *aboutTableView;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于清道夫";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.aboutTableView];
}

- (UITableView *)aboutTableView
{
    if (!_aboutTableView) {
        _aboutTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStylePlain];
        _aboutTableView.delegate = self;
        _aboutTableView.dataSource = self;
        _aboutTableView.tableFooterView = [[UIView alloc] init];
        _aboutTableView.separatorColor = kSeparateColor;
        _aboutTableView.backgroundColor = kBackColor;
    }
    return _aboutTableView;
}

#pragma mark - tableView delegate and dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"about";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = kBigFont;
    
    NSArray *texArray = @[@"商务合作",@"去评分",@"服务协议"];
    cell.textLabel.text = texArray[indexPath.row];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 210;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 210)];
    headerView.backgroundColor = kBackColor;
    
    //imageView
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth-80)/2, 40, 80, 100)];
    imageView.backgroundColor = kBlueColor;
    [headerView addSubview:imageView];
    
    //version
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.bottom+10, kScreenWidth, 20)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = kLightGrayColor;
    label.font = kFirstFont;
    label.text = [NSString stringWithFormat:@"清道夫V%@",@"1.0.2"];
    [headerView addSubview:label];
    
    return headerView;
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
