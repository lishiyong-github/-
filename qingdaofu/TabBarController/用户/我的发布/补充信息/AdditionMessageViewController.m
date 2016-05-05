//
//  AdditionMessageViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/5.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AdditionMessageViewController.h"
#import "BaseLabel.h"

@interface AdditionMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *addMessageTableView;
@property (nonatomic,strong) BaseLabel *mCell0;
@property (nonatomic,strong) BaseLabel *mCell1;
@property (nonatomic,strong) BaseLabel *mCell2;
@property (nonatomic,strong) BaseLabel *mCell3;
@property (nonatomic,strong) BaseLabel *mCell4;

@end

@implementation AdditionMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"补充信息";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveMessage)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kFirstFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview:self.addMessageTableView];
}

- (void)saveMessage
{
    
}

- (UITableView *)addMessageTableView
{
    if (!_addMessageTableView) {
        _addMessageTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth,kScreenHeight-kNavHeight) style:UITableViewStylePlain];
        _addMessageTableView.backgroundColor = kBackColor;
        _addMessageTableView.delegate = self;
        _addMessageTableView.dataSource = self;
        _addMessageTableView.tableFooterView = [[UIView alloc] init];
        _addMessageTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kSmallPadding)];
        _addMessageTableView.tableHeaderView.backgroundColor = kBackColor;
    }
    return _addMessageTableView;
}

- (BaseLabel *)mCell0
{
    if (!_mCell0) {
        _mCell0 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _mCell0.nameLabel.text = @"抵押物类型";
        [_mCell0.tButton setTitle:@"住宅 >" forState:0];
    }
    return _mCell0;
}

- (BaseLabel *)mCell1
{
    if (!_mCell1) {
        _mCell1 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _mCell1.nameLabel.text = @"状态";
        [_mCell1.tButton setTitle:@"自住 >" forState:0];
    }
    return _mCell1;
}

- (BaseLabel *)mCell2
{
    if (!_mCell2) {
        _mCell2 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _mCell2.nameLabel.text = @"抵押状况";
        [_mCell2.tButton setTitle:@"清房 >" forState:0];
    }
    return _mCell2;
}

- (BaseLabel *)mCell3
{
    if (!_mCell3) {
        _mCell3 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _mCell3.nameLabel.text = @"借款人年龄";
        [_mCell3.tButton setTitle:@"30" forState:0];
    }
    return _mCell3;
}

- (BaseLabel *)mCell4
{
    if (!_mCell4) {
        _mCell4 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _mCell4.nameLabel.text = @"权利人年龄";
        [_mCell4.tButton setTitle:@"65岁以下 >" forState:0];
    }
    return _mCell4;
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"additionMessage";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    if (indexPath.row == 0) {
        [cell addSubview:self.mCell0];
    }else if (indexPath.row == 1){
        [cell addSubview:self.mCell1];
    }else if (indexPath.row == 2){
        [cell addSubview:self.mCell2];
    }else if (indexPath.row == 3){
        [cell addSubview:self.mCell3];
    }else{
        [cell addSubview:self.mCell4];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
