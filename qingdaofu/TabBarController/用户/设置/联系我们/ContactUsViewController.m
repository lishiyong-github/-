//
//  ContactUsViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/3.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *contactTableView;

@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"联系我们";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.contactTableView];
}

- (UITableView *)contactTableView
{
    if (!_contactTableView) {
        _contactTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight)];
        _contactTableView.delegate = self;
        _contactTableView.dataSource = self;
        _contactTableView.tableFooterView = [[UIView alloc] init];
        _contactTableView.separatorColor = kSeparateColor;
        _contactTableView.backgroundColor = kBackColor;
    }
    return _contactTableView;
}

#pragma mark - tableView delegate and dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"contact";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.font = kBigFont;
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.textColor = kBlackColor;
    
    cell.detailTextLabel.font = kFirstFont;
    cell.detailTextLabel.textColor = kLightGrayColor;
    
    NSArray *textArray = @[@"客服热线",@"总机",@"传真",@"邮箱",@"公司地址"];
    NSArray *detailArray = @[@"400-855-7022",@"021-80120900",@"021-80120901",@"zx@direct-invest.com.cn",@"上海市浦东新区浦东南路855号世界广场34楼A座"];
    
    cell.textLabel.text = textArray[indexPath.row];
    cell.detailTextLabel.text =  detailArray[indexPath.row];
    
    if (indexPath.row == 0 || indexPath.row == 4) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kSmallPadding;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = kBackColor;
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {//客服热线
        NSMutableString *phoneStr = [NSMutableString stringWithFormat:@"telprompt://%@",@"400-855-7022"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneStr]];
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
