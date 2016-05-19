//
//  NewProductViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/26.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "NewProductViewController.h"

#import "NewPublishCell.h"
#import "HomeCell.h"

#import "UIImage+Color.h"

#import "ReportFinanceViewController.h"  //发布融资
#import "ReportSuitViewController.h"   //发布催收
#import "ReportCollectViewController.h" //发布诉讼
#import "ProductsDetailsViewController.h" //详细信息

@interface NewProductViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIButton *titleView;
@property (nonatomic,strong) UITableView *mainTableView;

@end

@implementation NewProductViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:kBlackColor,NSFontAttributeName:kNavFont}];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:kNavColor] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.titleView = self.titleView;
    
    [self.view addSubview:self.mainTableView];
    
    [self.view setNeedsUpdateConstraints];
}

- (UIButton *)titleView
{
    if (!_titleView) {
        _titleView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
        [_titleView setImage:[UIImage imageNamed:@"nav_logo"] forState:0];
    }
    return _titleView;
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.mainTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.mainTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTabBarHeight];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [UITableView newAutoLayoutView];
        _mainTableView.translatesAutoresizingMaskIntoConstraints = YES;
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _mainTableView.backgroundColor = kBackColor;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
//        _mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    }
    return _mainTableView;
}

#pragma mark - tableView delelagte and datasource
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
    switch (indexPath.section) {
        case 0:
            return 100.f;
            break;
        case 1:
            return 95+18;
            break;
        case 2:
            return 156;
            break;
        case 3:
            return 156;
            break;
        default:
            break;
    }
    
    return 0.1f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"main1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = kBlueColor;
        
        return cell;
        
    }else if (indexPath.section == 1){
        identifier = @"main2";
        NewPublishCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[NewPublishCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        QDFWeakSelf;
        [cell.financeButton addAction:^(UIButton *btn) {//融资
            ReportFinanceViewController *reportFinanceVC = [[ReportFinanceViewController alloc] init];
            reportFinanceVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:reportFinanceVC animated:YES];
        }];
        
        [cell.collectionButton addAction:^(UIButton *btn) {//催收
            ReportCollectViewController *reportCollectVC = [[ReportCollectViewController alloc] init];
            reportCollectVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:reportCollectVC animated:YES];
        }];
        
        [cell.suitButton addAction:^(UIButton *btn) {//诉讼
            ReportSuitViewController *reportSuitVC = [[ReportSuitViewController alloc] init];
            reportSuitVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:reportSuitVC animated:YES];
        }];
        
        return cell;
    }
        identifier = @"main3";
        HomeCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
        if (!cell) {
            cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
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
    
    return kBigPadding;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 || indexPath.section ==3) {
        ProductsDetailsViewController *productsDetailVC = [[ProductsDetailsViewController alloc] init];
        productsDetailVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:productsDetailVC animated:YES];
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
