//
//  ForgetPassViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/11.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ForgetPassViewController.h"
#import "JKCountDownButton.h"

#import "LoginCell.h"
#import "BaseCommitButton.h"

@interface ForgetPassViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *forgetPassTableView;
@property (nonatomic,assign) BOOL didSetupConstraints;

@end

@implementation ForgetPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"忘记密码";
    self.navigationItem.leftBarButtonItem = self.leftItem;

    [self.view addSubview:self.forgetPassTableView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.forgetPassTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)forgetPassTableView
{
    if (!_forgetPassTableView) {
        _forgetPassTableView = [UITableView newAutoLayoutView];
        _forgetPassTableView.delegate = self;
        _forgetPassTableView.dataSource = self;
        _forgetPassTableView.backgroundColor = kBackColor;
        _forgetPassTableView.tableFooterView = [[UIView alloc] init];
    }
    return _forgetPassTableView;
}

#pragma mark - tableView delelagte and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"forgetPass";
    LoginCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[LoginCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSArray *arr = @[@"",@"验证码",@"输入新密码"];
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:arr[indexPath.row]];
    [attributeStr addAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kLightGrayColor} range:NSMakeRange(0, attributeStr.length)];
    [cell.loginTextField setAttributedPlaceholder:attributeStr];
    
    if (indexPath.row == 0) {
        cell.backgroundColor = kBackColor;
        cell.loginTextField.text = @"验证码已经发送到12345678900上";
    }else if (indexPath.row == 1){
        JKCountDownButton *countDownBtn = [[JKCountDownButton alloc] initWithFrame:CGRectMake(0, 0, 80, kCellHeight-16)];
        [countDownBtn setBackgroundColor:kBlueColor];
        [countDownBtn setTitleColor:kNavColor forState:0];
        [countDownBtn setTitle:@"获取验证码" forState:0];
        countDownBtn.titleLabel.font = kSecondFont;
        [countDownBtn addTarget:self action:@selector(getForgetCode:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.loginButton setTitle:@"获取验证码呢 " forState:0];
        [cell.loginButton addSubview:countDownBtn];
    }else{
        [cell.loginButton setTitle:@"显示密码" forState:0];
        [cell.loginButton setTitle:@"隐藏密码" forState:UIControlStateSelected];
        
        [cell.loginButton addAction:^(UIButton *btn) {
            btn.selected = !btn.selected;
            if (btn.selected) {
                cell.loginTextField.secureTextEntry = YES;
            }else{
                cell.loginTextField.secureTextEntry = NO;
            }
        }];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 70;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 70)];
    BaseCommitButton *forgetCommitBtn = [[BaseCommitButton alloc] initWithFrame:CGRectMake(kBigPadding, kBigPadding, kScreenWidth-kBigPadding*2, 40)];
    [forgetCommitBtn setTitle:@"确定" forState:0];
    [footerView addSubview:forgetCommitBtn];
    
    return footerView;
}

- (void)getForgetCode:(JKCountDownButton *)sender
{
    [sender startWithSecond:4];
    
    [sender didChange:^NSString *(JKCountDownButton *countDownButton, int second) {
        
        sender.backgroundColor = kLightGrayColor;
        sender.enabled = NO;
        NSString *str = [NSString stringWithFormat:@"剩余(%d)秒",second];
        return str;
    }];
    
    [sender didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
        
        [sender setBackgroundColor:kBlueColor];
        sender.enabled = YES;
        return @"发送验证码";
    }];
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
