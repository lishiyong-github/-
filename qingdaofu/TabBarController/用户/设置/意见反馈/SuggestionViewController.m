//
//  SuggestionViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/3.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "SuggestionViewController.h"

#import "BaseCommitButton.h"

@interface SuggestionViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *suggestTableView;
@property (nonatomic,strong) UIView *section0;
@property (nonatomic,strong) UITextField *section1;

@property (nonatomic,strong) BaseCommitButton *commitButton;

@end

@implementation SuggestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"意见反馈";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.suggestTableView];
}

- (UITableView *)suggestTableView
{
    if (!_suggestTableView) {
        _suggestTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStyleGrouped];
        _suggestTableView.backgroundColor = kBackColor;
        _suggestTableView.delegate = self;
        _suggestTableView.dataSource = self;
        _suggestTableView.tableFooterView = [[UIView alloc] init];
        _suggestTableView.separatorColor = kSeparateColor;
    }
    return _suggestTableView;
}

- (UIView *)section0
{
    if (!_section0) {
        _section0 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    }
    return _section0;
}

- (UITextField *)section1
{
    if (!_section1) {
        _section1 = [[UITextField alloc] initWithFrame:CGRectMake(kBigPadding, 0, kScreenWidth-2*kBigPadding, kCellHeight)];
        _section1.placeholder = @"手机号码/邮箱（选填，方便我们联系您）";
        _section1.textColor = kBlackColor;
        _section1.font = kFirstFont;
    }
    return _section1;
}

- (BaseCommitButton *)commitButton
{
    if (!_commitButton) {
        _commitButton = [[BaseCommitButton alloc] initWithFrame:CGRectMake(kSmallPadding, kSmallPadding, kScreenWidth-2*kSmallPadding, 40)];
        [_commitButton setTitle:@"提交" forState:0];
        [_commitButton addAction:^(UIButton *btn) {
            NSLog(@"提交");
        }];
    }
    return _commitButton;
}

#pragma mark - tabelView delegate and dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 200;
    }
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"suggest";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        [cell addSubview:self.section0];
    }else{
        [cell addSubview:self.section1];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return kSmallPadding;
    }
    return 70;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = kBackColor;
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 70)];
    footerView.backgroundColor = kBackColor;
    
    [footerView addSubview:self.commitButton];
    
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
