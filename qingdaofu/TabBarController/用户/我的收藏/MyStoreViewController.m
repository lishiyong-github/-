//
//  MyStoreViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/29.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyStoreViewController.h"
#import "MyDetailStoreViewController.h"    //收藏详细

#import "MyStoreCell.h"

@interface MyStoreViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *myStoreTableView;
@property (nonatomic,strong) NSMutableArray *dataList;

@end

@implementation MyStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的收藏";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.myStoreTableView];
    
}

- (UITableView *)myStoreTableView
{
    if (!_myStoreTableView) {
        _myStoreTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStylePlain];
        _myStoreTableView.delegate = self;
        _myStoreTableView.dataSource = self;
        _myStoreTableView.tableFooterView = [[UIView alloc] init];
        _myStoreTableView.separatorColor = kSeparateColor;
    }
    return _myStoreTableView;
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
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"store";
    MyStoreCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MyStoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell.sButton1 setTitle:@"RZ201605130001" forState:0];
    [cell.sButton2 setTitle:@"2016-05-13" forState:0];
    [cell.sButton2 setImage:[UIImage imageNamed:@"list_more"] forState:0];

    return cell;
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"立即申请" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
    }];
    editAction.backgroundColor = kBlueColor;
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"取消收藏"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        [self.dataList removeObjectAtIndex:indexPath.row];
        [self.myStoreTableView reloadData];
    }];
    deleteAction.backgroundColor = kRedColor;
    
    return @[deleteAction,editAction];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MyDetailStoreViewController *myDetailStoreVC = [[MyDetailStoreViewController alloc] init];
    [self.navigationController pushViewController:myDetailStoreVC animated:YES];
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
