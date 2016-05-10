//
//  ReportFiSucViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/10.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReportFiSucViewController.h"

#import "ReportSuccessView.h"
#import "EvaTopSwitchView.h"

@interface ReportFiSucViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *reportSucTableView;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) ReportSuccessView *sucSec0;

@property (nonatomic,strong) EvaTopSwitchView *reportSucFootView;

@end

@implementation ReportFiSucViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"发布成功";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishReport)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview:self.reportSucTableView];
    [self.view addSubview:self.reportSucFootView];
}

- (void)finishReport
{
    UINavigationController *nav = self.navigationController;
    [nav popViewControllerAnimated:NO];
    [nav popViewControllerAnimated:NO];
}

- (UITableView *)reportSucTableView
{
    if (!_reportSucTableView) {
        _reportSucTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTabBarHeight-kNavHeight) style:UITableViewStylePlain];
        _reportSucTableView.backgroundColor = kBackColor;
        _reportSucTableView.delegate = self;
        _reportSucTableView.dataSource = self;
        _reportSucTableView.tableFooterView = [[UIView alloc] init];
        _reportSucTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
        [_reportSucTableView.tableHeaderView addSubview:self.headerView];
    }
    return _reportSucTableView;
}

- (UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0, kScreenWidth, 165)];
        _headerView.backgroundColor = kBlueColor;
    }
    return _headerView;
}

- (ReportSuccessView *)sucSec0
{
    if (!_sucSec0) {
        _sucSec0 = [[ReportSuccessView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 130)];
        _sucSec0.tiLabel.text = @"发布时间：2016-05-10 17:40";
        _sucSec0.tyLabel.text = @"产品类型：融资";
        _sucSec0.stLabel.text = @"产品状态：已发布";
    }
    return _sucSec0;
}

- (EvaTopSwitchView *)reportSucFootView
{
    if (!_reportSucFootView) {
        _reportSucFootView = [[EvaTopSwitchView alloc] initWithFrame:CGRectMake(0, kScreenHeight-kTabBarHeight-kNavHeight, kScreenWidth, kTabBarHeight)];
        _reportSucFootView.backgroundColor = kNavColor;
        _reportSucFootView.heightConstraint.constant = kTabBarHeight;
        [_reportSucFootView.blueLabel setHidden:YES];
        
        [_reportSucFootView.getbutton setTitle:@"回主页  " forState:0];
        [_reportSucFootView.getbutton setImage:[UIImage imageNamed:@"back"] forState:0];
        [_reportSucFootView.getbutton setTitleColor:kBlueColor forState:0];
        [_reportSucFootView.getbutton addTarget:self action:@selector(finishReport) forControlEvents:UIControlEventTouchUpInside];
        
        [_reportSucFootView.sendButton setTitle:@"继续发布  " forState:0];
        [_reportSucFootView.sendButton setImage:[UIImage imageNamed:@"add"] forState:0];
        [_reportSucFootView.sendButton setTitleColor:kBlueColor forState:0];
    }
    return _reportSucFootView;
}

#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"reportSuc";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell addSubview:self.sucSec0];
    
    return cell;
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
