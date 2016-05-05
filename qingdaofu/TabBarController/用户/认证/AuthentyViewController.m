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

@interface AuthentyViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *authenTableView;

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
        
        [self.authenTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        
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
    }
    return _authenTableView;
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
    AuthenCell *cell = [AuthenCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *imageArr = @[@"",@"",@""];
    NSArray *textArr = @[@"认证个人",@"认证律所",@"认证公司"];
    NSArray *detailArr = @[@"可发布融资、催收、诉讼\n暂不支持代理",@"可发布融资、催收、诉讼\n可代理诉讼、催收",@"可发布融资、催收、诉讼\n可代理诉讼、催收"];
    
    cell.aImageView.image = [UIImage imageNamed:imageArr[indexPath.row]];
    cell.bLabel.text = textArr[indexPath.row];
    cell.cLabel.text = detailArr[indexPath.row];
    
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
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *headerView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
    headerView.backgroundColor = kBackColor;
    headerView.text = @"请选择认证的身份";
    headerView.textColor = kBlackColor;
    headerView.font = [UIFont systemFontOfSize:22];
    headerView.textAlignment = NSTextAlignmentCenter;
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-15*2, 50)];
    footerView.backgroundColor = kBackColor;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, kScreenWidth-30, 35)];
    label.text = @"在您未发布及未接单前，您可以根据实际需要，修改您的身份认证";
    label.font = kFirstFont;
    label.numberOfLines = 0;
    label.textColor = kLightGrayColor;
    [footerView addSubview:label];
    
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
