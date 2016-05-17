//
//  ReportCollectViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/17.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReportCollectViewController.h"
#import "ReportFiSucViewController.h"  //发布成功
#import "UploadFilesViewController.h"  //债权文件


#import "ReportFootView.h"
#import "EvaTopSwitchView.h"

#import "ReportSuitCell.h"
#import "ReportSuitSeCell.h"

@interface ReportCollectViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *repSuitTableView;

@property (nonatomic,strong) ReportFootView *repSuitFootButton;
@property (nonatomic,strong) EvaTopSwitchView *repSuitSwitchView;

@property (nonatomic,strong) NSMutableArray *suitDataList;

@end

@implementation ReportCollectViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发布催收";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.repSuitTableView];
    [self.view addSubview:self.repSuitSwitchView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.repSuitTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.repSuitTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTabBarHeight];
        
        [self.repSuitSwitchView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.repSuitSwitchView autoSetDimension:ALDimensionHeight toSize:kTabBarHeight];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)repSuitTableView
{
    if (!_repSuitTableView) {
        _repSuitTableView = [UITableView newAutoLayoutView];
        _repSuitTableView.translatesAutoresizingMaskIntoConstraints = YES;
        _repSuitTableView = [[UITableView alloc ] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _repSuitTableView.backgroundColor = kBackColor;
        _repSuitTableView.delegate = self;
        _repSuitTableView.dataSource = self;
        _repSuitTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 90)];
        [_repSuitTableView.tableFooterView addSubview:self.repSuitFootButton];
    }
    return _repSuitTableView;
}

- (EvaTopSwitchView *)repSuitSwitchView
{
    if (!_repSuitSwitchView) {
        _repSuitSwitchView = [EvaTopSwitchView newAutoLayoutView];
        _repSuitSwitchView.heightConstraint.constant = kTabBarHeight;
        _repSuitSwitchView.backgroundColor = kNavColor;
        [_repSuitSwitchView.blueLabel setHidden:YES];
        
        [_repSuitSwitchView.getbutton setTitle:@"  保存" forState:0];
        [_repSuitSwitchView.getbutton setImage:[UIImage imageNamed:@"save"] forState:0];
        [_repSuitSwitchView.getbutton setTitleColor:kBlueColor forState:0];
        
        [_repSuitSwitchView.sendButton setTitle:@"  立即发布" forState:0];
        [_repSuitSwitchView.sendButton setImage:[UIImage imageNamed:@"publish"] forState:0];
        [_repSuitSwitchView.sendButton setTitleColor:kBlueColor forState:0];
        
        QDFWeakSelf;
        [_repSuitSwitchView.sendButton addAction:^(UIButton *btn) {
            ReportFiSucViewController *reportSuccessVC = [[ReportFiSucViewController alloc] init];
            [weakself.navigationController pushViewController:reportSuccessVC animated:YES];
        }];
    }
    return _repSuitSwitchView;
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
//        return 5*kCellHeight+5*kLineWidth+62;
        return 285;
    }
//    return kCellHeight*13+kLineWidth*13+62;
    return 640;
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
        [self.repSuitTableView insertSections:set withRowAnimation:UITableViewRowAnimationFade];
    }else{
        [self.suitDataList removeObjectAtIndex:1];
        NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:1];
        [self.repSuitTableView deleteSections:set withRowAnimation:UITableViewRowAnimationFade];
    }
    [self.repSuitTableView reloadData];
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
