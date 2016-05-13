//
//  RegisterViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/11.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "RegisterViewController.h"

#import "RegistCommitView.h"
#import "LoginCell.h"
#import "JKCountDownButton.h"

@interface RegisterViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *registerTableView;
@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) RegistCommitView  *registerFooterView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"注册";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.registerTableView];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        [self.registerTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];

        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)registerTableView
{
    if (!_registerTableView) {
        _registerTableView = [UITableView newAutoLayoutView];
        _registerTableView.delegate = self;
        _registerTableView.dataSource = self;
        _registerTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
        _registerTableView.tableFooterView = self.registerFooterView;
        _registerTableView.backgroundColor = kBackColor;
    }
    return _registerTableView;
}

- (RegistCommitView *)registerFooterView
{
    if (!_registerFooterView) {
        _registerFooterView = [[RegistCommitView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
        
        QDFWeakSelf;
        [_registerFooterView setDidSetectedButton:^(NSInteger buttonTag) {
            switch (buttonTag) {
                case 11:{//注册
                    UIButton *selectBtn = [weakself.registerTableView viewWithTag:12];
                    
                    NSLog(@"  选中%hhd",selectBtn.selected);
                    
                    if (!selectBtn.selected) {
                        NSLog(@"注册");
                    }else{
                        NSLog(@"请先同意协议");
                    }
                }
                    break;
                case 12:{//我已阅读
                    
                }
                    break;
                case 13:{//注册协议
                    
                }
                    break;
                default:
                    break;
            }
        }];
        
    }
    return _registerFooterView;
}

#pragma mark - tabelView delegate and datasource
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
    static NSString *identifer = @"register";
    LoginCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[LoginCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *placeHolderArray = @[@"输入您的手机号码",@"输入验证码",@"输入密码"];
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:placeHolderArray[indexPath.row]];
    [attributeStr addAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kLightGrayColor} range:NSMakeRange(0, attributeStr.length)];
    
    [cell.loginTextField setAttributedPlaceholder:attributeStr];
    
    if (indexPath.row == 1) {
        JKCountDownButton *countDownButton = [[JKCountDownButton alloc] initWithFrame:CGRectMake(0, 0, 80, kCellHeight-16)];
        [countDownButton setBackgroundColor:kBlueColor];
        [countDownButton setTitle:@"获取验证码" forState:0];
        [countDownButton setTitleColor:kNavColor forState:0];
        countDownButton.titleLabel.font = kSecondFont;
        [countDownButton addTarget:self action:@selector(getCodeAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.loginButton setTitle:@"获取验证码是 " forState:0];
        [cell.loginButton addSubview:countDownButton];
        
    }else if (indexPath.row == 2){
        [cell.loginButton setTitle:@"显示密码" forState:0];
        [cell.loginButton setTitle:@"隐藏密码" forState:UIControlStateSelected];
        cell.loginButton.titleLabel.font = kSecondFont;
        
        [cell.loginButton addAction:^(UIButton *btn) {
            btn.selected = !btn.selected;
            
            if (btn.selected) {
                cell.loginTextField.secureTextEntry = NO;
            }else{
                cell.loginTextField.secureTextEntry = YES;
            }
        }];
    }
    
    return cell;
}

- (void)getCodeAction:(JKCountDownButton *)sender
{
    [sender startWithSecond:5];
    
    [sender didChange:^NSString *(JKCountDownButton *countDownButton, int second) {
        [sender setBackgroundColor:kLightGrayColor];
        sender.enabled = NO;
        NSString *title = [NSString stringWithFormat:@"剩余(%d秒)",second];
        return title;
    }];
    
    [sender didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
        sender.backgroundColor = kBlueColor;
        sender.enabled = YES;
        return @"获取验证码";
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
