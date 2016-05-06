//
//  MyDetailStoreViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/29.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyDetailStoreViewController.h"

#import "DetailBaseView.h"
#import "BaseCommitButton.h"

@interface MyDetailStoreViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *detailStoreTableView;

@property (nonatomic,strong) UIView *cellVie1;
@property (nonatomic,strong) DetailBaseView *cellVie2;
@property (nonatomic,strong) DetailBaseView *cellVie3;
@property (nonatomic,strong) BaseCommitButton *commitApplyButton;

@end

@implementation MyDetailStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"BX201601010001";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.detailStoreTableView];
    [self.view addSubview:self.commitApplyButton];
}

- (UITableView *)detailStoreTableView
{
    if (!_detailStoreTableView) {
        _detailStoreTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStyleGrouped];
        _detailStoreTableView.delegate = self;
        _detailStoreTableView.dataSource = self;
        _detailStoreTableView.tableFooterView = [[UIView alloc] init];
        _detailStoreTableView.backgroundColor = kBackColor;
    }
    return _detailStoreTableView;
}

- (BaseCommitButton *)commitApplyButton
{
    if (!_commitApplyButton) {
        _commitApplyButton = [[BaseCommitButton alloc] initWithFrame:CGRectMake(0, kScreenHeight-kNavHeight-kTabBarHeight, kScreenWidth, kTabBarHeight)];
        [_commitApplyButton setTitle:@"申请成功" forState:0];
    }
    return _commitApplyButton;
}

- (UIView *)cellVie1
{
    if (!_cellVie1) {
        _cellVie1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    }
    return _cellVie1;
}

- (DetailBaseView *)cellVie2
{
    if (!_cellVie2) {
        _cellVie2 = [[DetailBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        [_cellVie2.imageView1 autoSetDimensionsToSize:CGSizeMake(18, 18)];
        [_cellVie2.imageView1 setImage:[UIImage imageNamed:@"list_icon_product"]];
        _cellVie2.label1.text = @"产品信息";
    }
    return _cellVie2;
}

- (DetailBaseView *)cellVie3
{
    if (!_cellVie3) {
        _cellVie3 = [[DetailBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        [_cellVie3.imageView1 autoSetDimensionsToSize:CGSizeMake(18, 18)];
        _cellVie3.imageView1.image = [UIImage imageNamed:@"list_icon_user"];
        _cellVie3.label1.text = @"发布人信息";
        [_cellVie3.button1 setTitle:@"已认证" forState:0];
        _cellVie3.button1.titleLabel.font = kFirstFont;
        [_cellVie3.button1 setTitleColor:kYellowColor forState:0];
    }
    return _cellVie3;
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
    static NSString *identifier = @"detailStore";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        [cell addSubview:self.cellVie1];
    }else{
        if (indexPath.row == 0) {
            [cell addSubview:self.cellVie2];
        }else{
            [cell addSubview:self.cellVie3];
        }
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
        if (indexPath.row == 0) {
            
        }else{
            
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
