//
//  MessageViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/26.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MessageViewController.h"
#import "PublishMessageViewController.h" //发布消息
#import "ReceiveMessageViewController.h"  //接单消息
#import "EvaluateMesaageViewController.h"  //评价消息
#import "SystemMessageViewController.h"   //系统消息

#import "MessageCell.h"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *messageTableView;

@property (nonatomic,assign) BOOL didSetupConstraints;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息";
    
    [self.view addSubview:self.messageTableView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.messageTableView autoPinEdgeToSuperviewMargin:ALEdgeTop];
        [self.messageTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 50, 0) excludingEdge:ALEdgeTop];
        
        self.didSetupConstraints = YES;
    }
    
    [super updateViewConstraints];
}

- (UITableView *)messageTableView
{
    if (!_messageTableView) {
        _messageTableView = [UITableView newAutoLayoutView];
        _messageTableView.delegate = self;
        _messageTableView.dataSource = self;
        _messageTableView.tableFooterView = [[UIView alloc] init];
        _messageTableView.backgroundColor = kBackColor;
    }
    return _messageTableView;
}

#pragma mark - tabelView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSArray *titleArray = @[@"发布消息",@"接单消息",@"评价消息",@"系统消息"];
        static NSString *identifier1 = @"cell1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier1];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
        }
        
            cell.imageView.backgroundColor = [UIColor redColor];
            cell.textLabel.text = titleArray[indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        
        return cell;
    }
    
    MessageCell *cell = [MessageCell cellWithTableView:tableView];
    
    return cell;
    
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (section == 1) {
//        return @"最近联系人";
//    }
//    return @"";
//}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    if (section == 1) {
//        
//        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
//        headerView.backgroundColor = kBackColor;
////        UILabel *personLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, kScreenWidth-20*2, 30)];
////        personLabel.text = @"最近联系人";
////        personLabel.font = smallFont;
////        personLabel.textColor = [UIColor blackColor];
////        [headerView addSubview:personLabel];
//        
////        tableView.tableHeaderView = headerView;
//        return headerView;
//    }else{
    
        UIView *headerView0 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
        headerView0.backgroundColor = kBackColor;
        tableView.tableHeaderView = headerView0;
        
        return headerView0;
//    }
//    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{//发布消息
                PublishMessageViewController *pubMessageVC = [[PublishMessageViewController alloc] init];
                pubMessageVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:pubMessageVC animated:YES];
            }
                break;
            case 1:{//接单消息
                ReceiveMessageViewController *receiveMessageVC = [[ReceiveMessageViewController alloc] init];
                receiveMessageVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:receiveMessageVC animated:YES];
            }
                break;
            case 2:{//评价消息
                EvaluateMesaageViewController *evaluateMessageVC = [[EvaluateMesaageViewController alloc] init];
                evaluateMessageVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:evaluateMessageVC animated:YES];
            }
                break;
            case 3:{//系统消息
                SystemMessageViewController *systemMessageVC = [[SystemMessageViewController alloc] init];
                systemMessageVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:systemMessageVC animated:YES];
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
