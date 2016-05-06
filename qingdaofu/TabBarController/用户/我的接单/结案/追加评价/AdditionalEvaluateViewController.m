//
//  AdditionalEvaluateViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AdditionalEvaluateViewController.h"

#import "AuthenBaseView.h"
#import "StarView.h"
#import "BaseLabel.h"
#import "RequestTextView.h"
#import "BaseCommitButton.h"

@interface AdditionalEvaluateViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *additionalTableView;

@property (nonatomic,strong) AuthenBaseView *cellVi0;
@property (nonatomic,strong) StarView *cellVi1;
@property (nonatomic,strong) RequestTextView *cellVi2;
@property (nonatomic,strong) UIView *cellvi3;
@property (nonatomic,strong) BaseLabel *cellVi4;

@property (nonatomic,strong) BaseCommitButton *commitEvaButton;

@end

@implementation AdditionalEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"填写评价";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.additionalTableView];
    [self.view addSubview:self.commitEvaButton];
}

#pragma mark -
- (UITableView *)additionalTableView
{
    if (!_additionalTableView) {
        _additionalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStylePlain];
        _additionalTableView.backgroundColor = kBackColor;
        _additionalTableView.delegate = self;
        _additionalTableView.dataSource = self;
        _additionalTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _additionalTableView.tableFooterView.backgroundColor = kBackColor;
        
    }
    return _additionalTableView;
}

- (AuthenBaseView *)cellVi0
{
    if (!_cellVi0) {
        _cellVi0 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight+kBigPadding)];
        _cellVi0.backgroundColor = kBackColor;

        _cellVi0.label.text = @"您的融资单号RZ201602020001已经结束，感谢您对平台的信任，请留下您的评价";
        _cellVi0.label.font = kSecondFont;
        _cellVi0.label.textColor = kBlueColor;
        
        _cellVi0.textField.placeholder = @"";
        _cellVi0.textField.userInteractionEnabled = NO;
    }
    return _cellVi0;
}

- (StarView *)cellVi1
{
    if (!_cellVi1) {
        _cellVi1 = [[StarView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight*3)];
    }
    return _cellVi1;
}

- (RequestTextView *)cellVi2
{
    if (!_cellVi2) {
        _cellVi2 = [[RequestTextView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        _cellVi2.remindLabel.text = @"请输入您的真实感受，对接单方的帮助很大奥";
    }
    return _cellVi2;
}

- (UIView *)cellvi3
{
    if (!_cellvi3) {
        _cellvi3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    }
    return _cellvi3;
}

- (BaseLabel *)cellVi4
{
    if (!_cellVi4) {
        _cellVi4 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _cellVi4.nameLabel.text = @"";
        [_cellVi4.tButton setTitle:@"匿名评价 " forState:0];
        [_cellVi4.goButton setBackgroundColor:kRedColor];
    }
    return _cellVi4;
}

- (BaseCommitButton *)commitEvaButton
{
    if (!_commitEvaButton) {
        _commitEvaButton = [[BaseCommitButton alloc] initWithFrame:CGRectMake(0, kScreenHeight-kNavHeight-kTabBarHeight, kScreenWidth, kTabBarHeight)];
        [_commitEvaButton setTitle:@"提交评价" forState:0];
    }
    return _commitEvaButton;
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return kCellHeight+kBigPadding;
    }else if (indexPath.row == 1){
        return kCellHeight*3;
    }else if (indexPath.row ==2){
        return 100;
    }else if (indexPath.row == 3){
        return 100;
    }
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"additional";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0) {
        [cell addSubview:self.cellVi0];
    }else if (indexPath.row == 1){
        [cell addSubview:self.cellVi1];
    }else if (indexPath.row == 2){
        [cell addSubview:self.cellVi2];
    }else if (indexPath.row == 3){
        [cell addSubview:self.cellvi3];
    }else{
        [cell addSubview:self.cellVi4];
    }
    
    return cell;
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
