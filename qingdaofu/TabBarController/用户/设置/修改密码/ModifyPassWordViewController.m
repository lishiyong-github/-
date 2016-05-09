//
//  ModifyPassWordViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/9.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ModifyPassWordViewController.h"

#import "ModifyView.h"
#import "BaseCommitButton.h"

@interface ModifyPassWordViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *modifyTableView;
@property (nonatomic,strong) ModifyView *celView0;
@property (nonatomic,strong) ModifyView *celView1;
@property (nonatomic,strong) BaseCommitButton *modifyCommitButton;


@end

@implementation ModifyPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"修改密码";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.modifyTableView];
}

- (UITableView *)modifyTableView
{
    if (!_modifyTableView) {
        _modifyTableView = [[UITableView alloc ] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight- kNavHeight) style:UITableViewStylePlain];
        _modifyTableView.delegate = self;
        _modifyTableView.dataSource = self;
        _modifyTableView.tableFooterView = [[UIView alloc] init];
        _modifyTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
        _modifyTableView.backgroundColor = kBackColor;
        _modifyTableView.separatorColor = kSeparateColor;
    }
    return _modifyTableView;
}

- (ModifyView *)celView0
{
    if (!_celView0) {
        _celView0 = [[ModifyView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _celView0.leftTextField.placeholder = @"请输入原密码                    ";
    }
    return _celView0;
}

- (ModifyView *)celView1
{
    if (!_celView1) {
        _celView1 = [[ModifyView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _celView1.leftTextField.placeholder = @"输入新密码                           ";
        [_celView1.rightButton setTitle:@"显示密码" forState:0];
        [_celView1.rightButton setTitle:@"隐藏密码" forState:UIControlStateSelected];
       
        QDFWeakSelf;
        [_celView1.rightButton addAction:^(UIButton *btn) {
            NSLog(@"显示密码");
            if (!btn.selected) {
                weakself.celView1.leftTextField.secureTextEntry = NO;
            }else{
                weakself.celView1.leftTextField.secureTextEntry = YES;
            }
            btn.selected = !btn.selected;
        }];
    }
    return _celView1;
}

- (BaseCommitButton *)modifyCommitButton
{
    if (!_modifyCommitButton) {
        _modifyCommitButton = [[BaseCommitButton alloc] initWithFrame:CGRectMake(kBigPadding, kBigPadding, kScreenWidth-2*kBigPadding, kCellHeight)];
        [_modifyCommitButton setTitle:@"提交" forState:0];
        [_modifyCommitButton setBackgroundColor:kBlueColor];
        [_modifyCommitButton addAction:^(UIButton *btn) {
            NSLog(@"提交修改");
        }];
    }
    return _modifyCommitButton;
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"modify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        [cell addSubview:self.celView0];
    }else{
        [cell addSubview:self.celView1];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
    [footerView addSubview:self.modifyCommitButton];

    return footerView;
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
