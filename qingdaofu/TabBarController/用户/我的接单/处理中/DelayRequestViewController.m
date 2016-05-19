//
//  DelayRequestViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "DelayRequestViewController.h"

#import "PlaceHolderTextView.h"
#import "AuthenBaseView.h"
#import "RequestView.h"
#import "BaseCommitButton.h"

@interface DelayRequestViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *delayTableView;
@property (nonatomic,strong) PlaceHolderTextView *reasonTextView;
@property (nonatomic,strong) RequestView *requestView;
@property (nonatomic,strong) BaseCommitButton *commitButton;

@end


@implementation DelayRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"申请延期";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.delayTableView];
    [self.view addSubview:self.commitButton];
}

#pragma mark - getter and setter
- (UITableView *)delayTableView
{
    if (!_delayTableView) {
        _delayTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight-kTabBarHeight) style:UITableViewStylePlain];
        _delayTableView.delegate = self;
        _delayTableView.dataSource = self;
        _delayTableView.backgroundColor = kBackColor;
        _delayTableView.tableFooterView = [[UIView alloc] init];
    }
    return _delayTableView;
}
- (PlaceHolderTextView *)reasonTextView
{
    if (!_reasonTextView) {
        _reasonTextView = [[PlaceHolderTextView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
        _reasonTextView.placeholder = @"请填写申请延期原因";
        _reasonTextView.placeholderColor = kLightGrayColor;
    }
    return _reasonTextView;
}

- (RequestView *)requestView
{
    if (!_requestView) {
        _requestView = [[RequestView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _requestView.textField.placeholder = @"请填写延期天数";
        _requestView.label.text = @"天";
    }
    return _requestView;
}

- (BaseCommitButton *)commitButton
{
    if (!_commitButton) {
        _commitButton = [[BaseCommitButton alloc] initWithFrame:CGRectMake(0, kScreenHeight-kNavHeight-kTabBarHeight, kScreenWidth, kTabBarHeight)];
        [_commitButton setTitle:@"立即申请" forState:0];
    }
    return _commitButton;
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 200;
    }
    return kCellHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"delay";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0) {
        [cell addSubview:self.reasonTextView];
    }else{
        [cell addSubview:self.requestView];
    }
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
