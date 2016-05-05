//
//  MySaveViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/29.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MySaveViewController.h"
#import "MyDetailSaveViewController.h"

#import "MyStoreCell.h"

@interface MySaveViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *mySavetableView;

@property (nonatomic,strong) NSMutableArray *dataList;

@end

@implementation MySaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的保存";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.mySavetableView];
}

- (UITableView *)mySavetableView
{
    if (!_mySavetableView) {
        _mySavetableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStylePlain];
        _mySavetableView.delegate = self;
        _mySavetableView.dataSource = self;
        _mySavetableView.tableFooterView = [[UIView alloc] init];
        _mySavetableView.backgroundColor = kBackColor;
        _mySavetableView.separatorColor = kSeparateColor;
    }
    return _mySavetableView;
}

- (NSMutableArray *)dataList
{
    if (!_dataList) {
        NSArray *aa = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@""];
        _dataList = [NSMutableArray arrayWithArray:aa];
    }
    return _dataList;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyStoreCell *cell = [MyStoreCell cellWithTableView:tableView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kBigPadding;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = kBackColor;
    return headerView;
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"直接发布" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        NSLog(@"直接发布");
    }];
    editAction.backgroundColor = kBlueColor;
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        
        NSLog(@"删除");
        [self.dataList removeObjectAtIndex:indexPath.row];
        [self.mySavetableView reloadData];
    }];
    deleteAction.backgroundColor = kRedColor;
    
    return @[deleteAction,editAction];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyDetailSaveViewController *myDetailSaveVC = [[MyDetailSaveViewController alloc] init];
    [self.navigationController pushViewController:myDetailSaveVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//
//}


@end
