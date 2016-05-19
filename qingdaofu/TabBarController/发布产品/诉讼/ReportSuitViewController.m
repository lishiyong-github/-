//
//  ReportSuitViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/10.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReportSuitViewController.h"

#import "ReportFiSucViewController.h"  //发布成功
#import "UploadFilesViewController.h"  //债权文件
#import "DebtCreditMessageViewController.h"  //债权人信息

#import "ReportFootView.h"
#import "EvaTopSwitchView.h"

#import "ReportSuitCell.h"
#import "ReportSuitSeCell.h"

@interface ReportSuitViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *repCoTableView;

@property (nonatomic,strong) ReportFootView *repSuitFootButton;
@property (nonatomic,strong) EvaTopSwitchView *repCoSwitchView;

@property (nonatomic,strong) NSMutableArray *suitDataList;

@end

@implementation ReportSuitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发布诉讼";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.repCoTableView];
    [self.view addSubview:self.repCoSwitchView];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.repCoTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.repCoTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTabBarHeight];
        
        [self.repCoSwitchView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.repCoSwitchView autoSetDimension:ALDimensionHeight toSize:kTabBarHeight];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)repCoTableView
{
    if (!_repCoTableView) {
        _repCoTableView = [UITableView newAutoLayoutView];
        _repCoTableView.translatesAutoresizingMaskIntoConstraints = YES;
        _repCoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _repCoTableView.backgroundColor = kBackColor;
        _repCoTableView.delegate = self;
        _repCoTableView.dataSource = self;
        _repCoTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 90)];
        [_repCoTableView.tableFooterView addSubview:self.repSuitFootButton];
        _repCoTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kSmallPadding)];
    }
    return _repCoTableView;
}

- (EvaTopSwitchView *)repCoSwitchView
{
    if (!_repCoSwitchView) {
        _repCoSwitchView = [EvaTopSwitchView newAutoLayoutView];
        _repCoSwitchView.heightConstraint.constant = kTabBarHeight;
        _repCoSwitchView.backgroundColor = kNavColor;
        [_repCoSwitchView.blueLabel setHidden:YES];
        
        [_repCoSwitchView.getbutton setTitle:@"  保存" forState:0];
        [_repCoSwitchView.getbutton setImage:[UIImage imageNamed:@"save"] forState:0];
        [_repCoSwitchView.getbutton setTitleColor:kBlueColor forState:0];
        
        [_repCoSwitchView.sendButton setTitle:@"  立即发布" forState:0];
        [_repCoSwitchView.sendButton setImage:[UIImage imageNamed:@"publish"] forState:0];
        [_repCoSwitchView.sendButton setTitleColor:kBlueColor forState:0];
        
        QDFWeakSelf;
        [_repCoSwitchView.sendButton addAction:^(UIButton *btn) {
            ReportFiSucViewController *reportSuccessVC = [[ReportFiSucViewController alloc] init];
            [weakself.navigationController pushViewController:reportSuccessVC animated:YES];
        }];
    }
    return _repCoSwitchView;
}

- (ReportFootView *)repSuitFootButton
{
    if (!_repSuitFootButton) {
        _repSuitFootButton = [[ReportFootView alloc] initWithFrame:CGRectMake(kBigPadding, 0, kScreenWidth-kBigPadding*2, 70)];
        _repSuitFootButton.backgroundColor = kBlueColor;
        [_repSuitFootButton.footButton addTarget:self action:@selector(openAndClose:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _repSuitFootButton;
}

- (NSMutableArray *)suitDataList
{
    if (!_suitDataList) {
        _suitDataList = [[NSMutableArray alloc] initWithObjects:@"老大旅", nil];
    }
    return _suitDataList;
}

#pragma mark - 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.suitDataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 5*kCellHeight+5*kLineWidth+62;
    }
    return kCellHeight*13+kLineWidth*13+62;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"suitSect0";
        ReportSuitCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[ReportSuitCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    identifier = @"suitSect1";
    
    ReportSuitSeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ReportSuitSeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    QDFWeakSelf;
    [cell setDidSelectedIndex:^(NSInteger row) {
        switch (row) {
            case 80:{//债权文件
                UploadFilesViewController *uploadFilesVC = [[UploadFilesViewController alloc] init];
                [weakself.navigationController pushViewController:uploadFilesVC animated:YES];
            }
                break;
            case 81:{//债权人信息
                DebtCreditMessageViewController *debtCreditVc = [[DebtCreditMessageViewController alloc] init];
                [weakself.navigationController pushViewController:debtCreditVc animated:YES];
            }
                break;
            case 82:{//债务人信息
                
            }
                break;
            default:
                break;
        }
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    if (section == 0) {
//        return 0.1f;
//    }
//    return kBigPadding;
    
    return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = kBackColor;
        return view;
    }
    
    return nil;
}

- (void)openAndClose:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [self.suitDataList insertObject:@"大喊大叫" atIndex:1];
        NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:1];
        [self.repCoTableView insertSections:set withRowAnimation:UITableViewRowAnimationFade];
    }else{
        [self.suitDataList removeObjectAtIndex:1];
        NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:1];
        [self.repCoTableView deleteSections:set withRowAnimation:UITableViewRowAnimationFade];
    }
    [self.repCoTableView reloadData];
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
