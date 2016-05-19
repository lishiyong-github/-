//
//  AuthentyViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/28.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AuthentyViewController.h"
#import "AuthenPersonViewController.h"  //认证个人

#import "AuthenCell.h"
#import "AuthenBaseView.h"

@interface AuthentyViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *authenTableView;
@property (nonatomic,strong) AuthenBaseView *authenFootView;
@property (nonatomic,strong) AuthenBaseView *authenHeadView;

@end

@implementation AuthentyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.title = @"认证";
    
    [self.view addSubview:self.authenTableView];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.authenTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)authenTableView
{
    if (!_authenTableView) {
        _authenTableView = [UITableView newAutoLayoutView];
        _authenTableView.delegate = self;
        _authenTableView.dataSource = self;
        _authenTableView.tableFooterView = [[UIView alloc] init];
        _authenTableView.separatorColor = kSeparateColor;
        _authenTableView.backgroundColor = kBackColor;
        _authenTableView.tableHeaderView = self.authenHeadView;
        _authenTableView.tableFooterView = self.authenFootView;
    }
    return _authenTableView;
}

- (AuthenBaseView *)authenHeadView
{
    if (!_authenHeadView) {
        _authenHeadView = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 56)];
        _authenHeadView.label.textAlignment = NSTextAlignmentCenter;
        _authenHeadView.label.font = [UIFont systemFontOfSize:22];
        _authenHeadView.label.text = @"请选择认证的身份";
    }
    return _authenHeadView;
}

- (AuthenBaseView *)authenFootView
{
    if (!_authenFootView) {
        _authenFootView = [[AuthenBaseView alloc ] initWithFrame:CGRectMake(0, 0, kScreenWidth, 45)];
        _authenFootView.label.text = @"在您未发布及未接单前，您可以根据实际需要，修改您的身份认证";
        _authenFootView.label.textColor = kLightGrayColor;
        _authenFootView.label.font = kSecondFont;
    }
    return _authenFootView;
}

#pragma mark - tabelView delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 125;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"authenty";
    
    AuthenCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AuthenCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *imageArr = @[@"list_icon_personal",@"list_icon_firm",@"list_icon_company"];
    NSArray *textArr = @[@"认证个人",@"认证律所",@"认证公司"];
    NSArray *detailArr = @[@"可发布融资、催收、诉讼",@"可发布融资、催收、诉讼",@"可发布融资、催收、诉讼"];
    NSArray *deArr = @[@"暂不支持代理",@"可代理诉讼、催收",@"可代理诉讼、催收"];
    
    cell.aImageView.image = [UIImage imageNamed:imageArr[indexPath.row]];
    cell.bLabel.text = textArr[indexPath.row];
    cell.cLabel.text = detailArr[indexPath.row];
    cell.dLabel.text = deArr[indexPath.row];
    
    [cell.AuthenButton addAction:^(UIButton *btn) {
        if (indexPath.row == 0) {//认证个人
            AuthenPersonViewController *authenPersonVC = [[AuthenPersonViewController alloc] init];
            [self.navigationController pushViewController:authenPersonVC animated:YES];
        }else if (indexPath.row == 1){//认证律所
            
        }else{//认证公司
            
        }
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
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
