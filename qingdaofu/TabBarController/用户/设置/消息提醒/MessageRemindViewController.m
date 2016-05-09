//
//  MessageRemindViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/9.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MessageRemindViewController.h"

#import "AuthenBaseView.h"

@interface MessageRemindViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *messageRemindTableView;
@property (nonatomic,strong) AuthenBaseView *celVie0;
@property (nonatomic,strong) AuthenBaseView *meReFootView;

@end

@implementation MessageRemindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息提醒";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.messageRemindTableView];
}

- (UITableView *)messageRemindTableView
{
    if (!_messageRemindTableView) {
        _messageRemindTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStylePlain];
        _messageRemindTableView.delegate = self;
        _messageRemindTableView.dataSource = self;
        _messageRemindTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
//        _messageRemindTableView.tableFooterView = [[UIView alloc] init];
        _messageRemindTableView.backgroundColor = kBackColor;
    }
    return _messageRemindTableView;
}

- (AuthenBaseView *)celVie0
{
    if (!_celVie0) {
        _celVie0 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _celVie0.label.text = @"消息提醒";
        _celVie0.textField.userInteractionEnabled = NO;
        [_celVie0.button setTitle:@"已开启" forState:0];
        _celVie0.button.titleLabel.font = kBigFont;
    }
    return _celVie0;
}

- (AuthenBaseView *)meReFootView
{
    if (!_meReFootView) {
        _meReFootView = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _meReFootView.label.text = @"在iPhone的“设置－通知”功能中找到应用程序清道夫，可以更改清道夫的新消息提醒设置";
        _meReFootView.label.font = kSecondFont;
        _meReFootView.label.textColor = kLightGrayColor;
    }
    return _meReFootView;
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"messageRemind";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell addSubview:self.celVie0];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 80;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 80)];
    [footerView addSubview:self.meReFootView];
    
    return footerView;
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
