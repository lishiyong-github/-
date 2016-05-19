//
//  MineViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/26.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MineViewController.h"

#import "LoginViewController.h"     //登录
#import "AuthentyViewController.h"  //未认证
#import "CompleteViewController.h"  //已认证

#import "MyReleaseViewController.h" //我的发布
#import "MyOrderViewController.h"  //我的接单

#import "MySaveViewController.h"  //我的保存
#import "MyStoreViewController.h"  //我的收藏
#import "MyAgentViewController.h"  //我的代理
#import "AddMyAgentViewController.h" //添加代理

#import "MySettingsViewController.h"  //设置

#import "LoginView.h"
#import "NoLoginView.h"


@interface MineViewController ()

@property (nonatomic,assign) BOOL didSetupConstraits;
@property (nonatomic,strong) LoginView *loginView;
@property (nonatomic,strong) NoLoginView *noLoginView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"用户中心";
    
    [self.view addSubview:self.loginView];
}

- (LoginView *)loginView
{
    if (!_loginView) {
        _loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight-kTabBarHeight)];
        QDFWeakSelf;
        
        [_loginView setDidSelectedButton:^(NSInteger buttonTag) {
            
            switch (buttonTag) {
                case 10://我的发布
                    NSLog(@"全部");
                    break;
                case 11:
                case 12:
                case 13:
                case 14:{
                    MyReleaseViewController *myReleaseVC = [[MyReleaseViewController alloc] init];
                    myReleaseVC.hidesBottomBarWhenPushed = YES;
                    [weakself.navigationController pushViewController:myReleaseVC animated:YES];
                }
                    break;
                case 20://我的接单
                case 21:
                case 22:
                case 23:
                case 24:{
                    MyOrderViewController *myOrderVC = [[MyOrderViewController alloc] init];
                    myOrderVC.hidesBottomBarWhenPushed = YES;
                    [weakself.navigationController pushViewController:myOrderVC animated:YES];
                }
                    break;
                case 100:{//添加代理
                    AddMyAgentViewController *addMyAgentVC = [[AddMyAgentViewController alloc] init];
                    addMyAgentVC.hidesBottomBarWhenPushed = YES;
                    [weakself.navigationController pushViewController:addMyAgentVC animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
        }];
        
        [_loginView setDidSelectedIndex:^(NSIndexPath *indexPath) {
            if (indexPath.section == 0) {//认证
                NSLog(@"认证");

//                LoginViewController *loginVC = [[LoginViewController alloc] init];
//                loginVC.hidesBottomBarWhenPushed = YES;
//                [weakself.navigationController pushViewController:loginVC animated:YES];
                
                AuthentyViewController *authentyVC = [[AuthentyViewController alloc] init];
                authentyVC.hidesBottomBarWhenPushed = YES;
                [weakself.navigationController pushViewController:authentyVC animated:YES];
                
//                CompleteViewController *completeVC = [[CompleteViewController alloc] init];
//                completeVC.hidesBottomBarWhenPushed = YES;
//                [weakself.navigationController pushViewController:completeVC animated:YES];
//
            }else if (indexPath.section == 3){
                if (indexPath.row == 0) {//我的代理
                    
                    MyAgentViewController *myAgentVC = [[MyAgentViewController alloc] init];
                    myAgentVC.hidesBottomBarWhenPushed = YES;
                    [weakself.navigationController pushViewController:myAgentVC animated:YES];
                    
                }else if (indexPath.row == 2){//我的保存
                    MySaveViewController *mySaveVC = [[MySaveViewController alloc] init];
                    mySaveVC.hidesBottomBarWhenPushed = YES;
                    [weakself.navigationController pushViewController:mySaveVC animated:YES];
                    
                }else {//我的收藏
                    MyStoreViewController *myStoreVC = [[MyStoreViewController alloc] init];
                    myStoreVC.hidesBottomBarWhenPushed = YES;
                    [weakself.navigationController pushViewController:myStoreVC animated:YES];
                }
                
            }else if(indexPath.section == 4){//设置
                MySettingsViewController *mySettingsVC = [[MySettingsViewController alloc] init];
                mySettingsVC.hidesBottomBarWhenPushed = YES;
                [weakself.navigationController pushViewController:mySettingsVC animated:YES];
            }
        }];
    }
    return _loginView;
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
