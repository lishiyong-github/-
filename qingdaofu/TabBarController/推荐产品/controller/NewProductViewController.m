//
//  NewProductViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/26.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "NewProductViewController.h"

#import "NewPublishView.h"  //发布（section==1）
#import "NewProView.h"  //section==2,3

@interface NewProductViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *mainTableView;
@property (nonatomic,strong) NewPublishView *sectionView1;
@property (nonatomic,strong) NewProView *sectionView2;
@property (nonatomic,strong) NewProView *sectionView3;

@end

@implementation NewProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"清道夫债管家";
    
    [self.view addSubview:self.mainTableView];
}

- (UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight-kTabBarHeight) style:UITableViewStyleGrouped];
        _mainTableView.backgroundColor = kBackColor;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    }
    return _mainTableView;
}

- (NewPublishView *)sectionView1
{
    if (!_sectionView1) {
        _sectionView1 = [[NewPublishView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 95+18)];
    }
    return _sectionView1;
}

- (NewProView *)sectionView2
{
    if (!_sectionView2) {
        _sectionView2 = [[NewProView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth,_sectionView2.aH)];
       _sectionView2.nameLabel.text = @"RZ201509280005dbdbd";
    }
    return _sectionView2;
}

- (NewProView *)sectionView3
{
    if (!_sectionView3) {
        _sectionView3 = [[NewProView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth,_sectionView2.aH)];
    }
    return _sectionView3;
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
            return self.sectionView2.aH;
            break;
        case 3:
            return self.sectionView3.aH;
            break;
        default:
            break;
    }
    
    return 0.1f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"main";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        cell.backgroundColor = [UIColor blueColor];
    }else if (indexPath.section == 1){
        [cell addSubview:self.sectionView1];
    }else if (indexPath.section == 2){
        [cell addSubview:self.sectionView2];

    }else if (indexPath.section == 3){
        [cell addSubview:self.sectionView3];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1f;
    }else if (section == 1){
        return kSmallPadding;
    }
    
    return kBigPadding;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
