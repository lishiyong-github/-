//
//  MessageViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/26.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MessageViewController.h"
#import "PublishMessagesViewController.h" //发布消息
#import "ReceiveMessagesViewController.h"  //接单消息
#import "EvaluateMessagesViewController.h"  //评价消息
#import "SystemMessagesViewController.h"   //系统消息

#import "MessageCell.h"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *messageTableView;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息";
    
    [self.view addSubview:self.messageTableView];
}

- (UITableView *)messageTableView
{
    if (!_messageTableView) {
        _messageTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStyleGrouped];
        _messageTableView.delegate = self;
        _messageTableView.dataSource = self;
        _messageTableView.tableFooterView = [[UIView alloc] init];
        _messageTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
        _messageTableView.tableHeaderView.backgroundColor = kBackColor;
        _messageTableView.backgroundColor = kBackColor;
        _messageTableView.separatorColor = kSeparateColor;
    }
    return _messageTableView;
}

#pragma mark - tabelView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 60;
    }
    return 68;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    
    if (indexPath.section == 0) {
        identifier = @"all";
        NSArray *titleArray = @[@"发布消息",@"接单消息",@"评价消息",@"系统消息"];
        NSArray *imageArray = @[@"news_publish_icon",@"news_order_icon",@"news_evaluate_icon",@"news_system_icon"];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        [cell setSeparatorInset:UIEdgeInsetsMake(0, kBigPadding, 0, 0)];
        
        cell.imageView.bounds = CGRectMake(0, 0, 41, 41);
        cell.imageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
    
        cell.textLabel.font = [UIFont systemFontOfSize:18];
        cell.textLabel.textColor = kBlackColor;
        cell.textLabel.text = titleArray[indexPath.row];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    
    identifier = @"newMessages";
    
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell setSeparatorInset:UIEdgeInsetsMake(0, kBigPadding, 0, 0)];
    
    cell.userLabel.text = @"用户1234567888";
    cell.timeLabel.text = @"2016-02-10 10:12";
    cell.newsLabel.text = @"最新消息最新消息最新消息";
    cell.countLabel.text = @"40";
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1f;
    }
    return kCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UILabel *headerView1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, kScreenWidth, kCellHeight-10)];
        headerView1.text = @"   最近联系人";
        headerView1.textColor = kBlackColor;
        headerView1.font = kBigFont;
        return headerView1;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{//发布消息
                PublishMessagesViewController *pubMessagesVC = [[PublishMessagesViewController alloc] init];
                pubMessagesVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:pubMessagesVC animated:YES];
            }
                break;
            case 1:{//接单消息
                ReceiveMessagesViewController *receiveMessagesVC = [[ReceiveMessagesViewController alloc] init];
                receiveMessagesVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:receiveMessagesVC animated:YES];
            }
                break;
            case 2:{//评价消息
                EvaluateMessagesViewController *evaluateMessagesVC = [[EvaluateMessagesViewController alloc] init];
                evaluateMessagesVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:evaluateMessagesVC animated:YES];
            }
                break;
            case 3:{//系统消息
                SystemMessagesViewController *systemMessagesVC = [[SystemMessagesViewController alloc] init];
                systemMessagesVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:systemMessagesVC animated:YES];
            }
                break;
            default:
                break;
        }
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
