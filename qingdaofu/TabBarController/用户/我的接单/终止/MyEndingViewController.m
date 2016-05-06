//
//  MyEndingViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyEndingViewController.h"
#import "CheckDetailPublishViewController.h"  //查看发布方
#import "MyScheduleViewController.h"    //填写进度

#import "BaseCommitButton.h"
@interface MyEndingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *myEndingTableView;
@property (nonatomic,strong) BaseCommitButton *footerButton;

@end

@implementation MyEndingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"查看发布方" style:UIBarButtonItemStylePlain target:self action:@selector(checkDetail)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview:self.myEndingTableView];
    [self.view addSubview:self.footerButton];
}

- (void)checkDetail
{
    CheckDetailPublishViewController *checkDetailPublishVC = [[CheckDetailPublishViewController alloc] init];
    [self.navigationController pushViewController:checkDetailPublishVC animated:YES];
}

- (UITableView *)myEndingTableView
{
    if (!_myEndingTableView) {
        _myEndingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight- kCellHeight) style:UITableViewStyleGrouped];
        _myEndingTableView.delegate = self;
        _myEndingTableView.dataSource = self;
    }
    return _myEndingTableView;
}

- (BaseCommitButton *)footerButton
{
    if (!_footerButton) {
        _footerButton = [BaseCommitButton buttonWithType:0];
        _footerButton.frame = CGRectMake(0, kScreenHeight-kNavHeight-kTabBarHeight, kScreenWidth, kTabBarHeight);
        _footerButton.backgroundColor = kLightGrayColor;
        [_footerButton setTitle:@"已终止" forState:0];
    }
    return _footerButton;
}
- (AuthenBaseView *)secView0
{
    if (!_secView0) {
        _secView0 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _secView0.backgroundColor = kBlueColor;
        _secView0.label.text = @"产品编号:";
        _secView0.label.textColor = kNavColor;
        _secView0.textField.text = @"RZ201605030001";
        _secView0.textField.userInteractionEnabled = NO;
        _secView0.textField.textColor = kNavColor;
        [_secView0.button setTitle:@"已终止" forState:0];
        [_secView0.button setTitleColor:kNavColor forState:0];
    }
    return _secView0;
}

- (BidCellView *)secView1
{
    if (!_secView1) {
        _secView1 = [[BidCellView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 5*kCellHeight+2)];
    }
    return _secView1;
}

- (BidSingleView *)secView2
{
    if (!_secView2) {
        _secView2 = [[BidSingleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 135+2*kCellHeight+1)];
    }
    return _secView2;
}
- (MyOrderDetailView *)secView3
{
    if (!_secView3) {
        _secView3 = [[MyOrderDetailView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight*2+120)];
        QDFWeakSelf;
        [_secView3.detail3 addAction:^(UIButton *btn) {
            MyScheduleViewController *myScheduleVC = [[MyScheduleViewController alloc] init];
            [weakself.navigationController pushViewController:myScheduleVC animated:YES];
        }];
    }
    return _secView3;
}

#pragma mark - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return kCellHeight;
    }else if (indexPath.section == 1){
        return 5*kCellHeight + 2;
    }else if (indexPath.section == 2){
        
        return 2*kCellHeight + 135 + 1;
    }
    return kCellHeight*2 + 120 + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"myEnding";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        [cell addSubview:self.secView0];
    }else if (indexPath.section == 1){
        [cell addSubview:self.secView1];
        
    }else if(indexPath.section == 2){
        [cell addSubview:self.secView2];
    }else{
        [cell addSubview:self.secView3];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kSmallPadding;
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
