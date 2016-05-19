//
//  MyDetailStoreViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/29.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyDetailStoreViewController.h"

//#import "DetailBaseView.h"

#import "MineUserCell.h"
#import "BaseCommitButton.h"


@interface MyDetailStoreViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstarints;
@property (nonatomic,strong) UITableView *detailStoreTableView;
@property (nonatomic,strong) BaseCommitButton *detailStoreCommitButton;

@end

@implementation MyDetailStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"BX201601010001";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.detailStoreTableView];
    [self.view addSubview:self.detailStoreCommitButton];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstarints) {
        
        [self.detailStoreTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.detailStoreTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTabBarHeight];
        
        
        self.didSetupConstarints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)detailStoreTableView
{
    if (!_detailStoreTableView) {
        _detailStoreTableView = [UITableView newAutoLayoutView];
        _detailStoreTableView.translatesAutoresizingMaskIntoConstraints = YES;
        _detailStoreTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _detailStoreTableView.delegate = self;
        _detailStoreTableView.dataSource = self;
        _detailStoreTableView.backgroundColor = kBackColor;
    }
    return _detailStoreTableView;
}
- (BaseCommitButton *)detailStoreCommitButton
{
    if (!_detailStoreCommitButton) {
        _detailStoreCommitButton = [BaseCommitButton newAutoLayoutView];
        [_detailStoreCommitButton setTitle:@"申请成功" forState:0];
    }
    return _detailStoreCommitButton;
}

#pragma mark - 
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 2;
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
    static NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"detailStore0";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
    }
        
        identifier = @"detailStore1";
        MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
    if (!cell) {
        cell = [[MineUserCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *detailTextArray = @[@"产品信息",@"发布人信息"];
    NSArray *detailImageArray = @[@"list_icon_product",@"list_icon_user"];
    [cell.userNameButton setImage:[UIImage imageNamed:detailImageArray[indexPath.row]] forState:0];
    [cell.userNameButton setTitle:detailTextArray[indexPath.row] forState:0];
    [cell.userActionButton setImage:[UIImage imageNamed:@"list_more"] forState:0];
    
    if (indexPath.row ==1) {
        [cell.userActionButton setTitle:@"已认证" forState:0];
        [cell.userActionButton setTitleColor:kYellowColor forState:0];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kBigPadding;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {//产品信息
            
        }else{//发布人信息 
            
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
