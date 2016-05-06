//
//  MySettingsViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/3.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MySettingsViewController.h"

#import "SuggestionViewController.h"  //意见反馈
#import "ContactUsViewController.h"  //联系我们
#import "AboutViewController.h"  //关于清道夫

@interface MySettingsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *mySettingTableView;
@property (nonatomic,strong) UIButton *exitButton;

@end

@implementation MySettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.navigationItem.leftBarButtonItem = self.leftItem;

    [self.view addSubview:self.mySettingTableView];
}

- (UITableView *)mySettingTableView
{
    if (!_mySettingTableView) {
        _mySettingTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _mySettingTableView.delegate = self;
        _mySettingTableView.dataSource = self;
        _mySettingTableView.tableFooterView = [[UIView alloc] init];
        _mySettingTableView.separatorColor = kSeparateColor;
    }
    return _mySettingTableView;
}

- (UIButton *)exitButton
{
    if (!_exitButton) {
        _exitButton = [UIButton buttonWithType:0];
        _exitButton.frame = CGRectMake(0, 0, kScreenWidth, kCellHeight);
        _exitButton.backgroundColor = kNavColor;
        [_exitButton setTitle:@"退出登录" forState:0];
        [_exitButton setTitleColor:kRedColor forState:0];
        _exitButton.titleLabel.font = kFirstFont;
        [_exitButton addAction:^(UIButton *btn) {
            NSLog(@"退出");
        }];
    }
    return _exitButton;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 4;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"setting";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = kBigFont;
    
    NSArray *textArray = @[@[@"修改密码"],@[@"消息提醒"],@[@"意见反馈",@"常见问答",@"联系我们",@"关于清道夫"]];
  
    if (indexPath.section < 3) {
        cell.textLabel.text = textArray[indexPath.section][indexPath.row];
    }else{
        [cell addSubview:self.exitButton];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
    }else if(indexPath.section == 1){
        
    }else if (indexPath.section == 2){
        switch (indexPath.row) {
            case 0:{//意见反馈
                SuggestionViewController *suggestionVC = [[SuggestionViewController alloc] init];
                [self.navigationController pushViewController:suggestionVC animated:YES];
            }
                break;
            case 1:{//常见问答
                
            }
                break;
            case 2:{//联系我们
                ContactUsViewController *contactUsVC = [[ContactUsViewController alloc] init];
                [self.navigationController pushViewController:contactUsVC animated:YES];
            }
                break;
            case 3:{//关于清道夫
                AboutViewController *aboutVC = [[AboutViewController alloc] init];
                [self.navigationController pushViewController:aboutVC animated:YES];
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
