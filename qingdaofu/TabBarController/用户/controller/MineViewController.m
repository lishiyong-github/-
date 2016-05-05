//
//  MineViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/26.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MineViewController.h"
#import "AuthentyViewController.h"  //未认证
#import "CompleteViewController.h"  //已认证

#import "MyReleaseViewController.h" //我的发布
#import "MyOrderViewController.h"  //我的接单

#import "MySaveViewController.h"  //我的保存
#import "MyStoreViewController.h"  //我的收藏
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
        [_loginView setDidSelectedIndex:^(NSIndexPath *indexPath) {
            if (indexPath.section == 0) {//认证
                NSLog(@"认证");
                
                [weakself.loginView setDidSelectedButton:^(NSInteger buttonTag) {
                    switch (buttonTag) {
                        case 10:{
                            
                        }
                            break;
                        case 11:{
                            
                        }
                            break;
                        case 20:{
                            MyOrderViewController *myOrderVC = [[MyOrderViewController alloc] init];
                            myOrderVC.hidesBottomBarWhenPushed = YES;
                            [weakself.navigationController pushViewController:myOrderVC animated:YES];
                        }
                        default:
                            break;
                    }
                }];

//                AuthentyViewController *authentyVC = [[AuthentyViewController alloc] init];
//                authentyVC.hidesBottomBarWhenPushed = YES;
//                [weakself.navigationController pushViewController:authentyVC animated:YES];
                
                
                CompleteViewController *completeVC = [[CompleteViewController alloc] init];
                completeVC.hidesBottomBarWhenPushed = YES;
                [weakself.navigationController pushViewController:completeVC animated:YES];
//
            }else if (indexPath.section == 1){//我的发布
                
                MyReleaseViewController *myReleaseVC = [[MyReleaseViewController alloc] init];
                myReleaseVC.hidesBottomBarWhenPushed = YES;
                [weakself.navigationController pushViewController:myReleaseVC animated:YES];
                
            }else if (indexPath.section == 2){//我的接单
                
                MyOrderViewController *myOrderVC = [[MyOrderViewController alloc] init];
                myOrderVC.hidesBottomBarWhenPushed = YES;
                [weakself.navigationController pushViewController:myOrderVC animated:YES];
            
            }else if (indexPath.section == 3){
                if (indexPath.row == 0) {//我的保存
                    MySaveViewController *mySaveVC = [[MySaveViewController alloc] init];
                    mySaveVC.hidesBottomBarWhenPushed = YES;
                    [weakself.navigationController pushViewController:mySaveVC animated:YES];
                    
                }else{//我的收藏
                    MyStoreViewController *myStoreVC = [[MyStoreViewController alloc] init];
                    myStoreVC.hidesBottomBarWhenPushed = YES;
                    [weakself.navigationController pushViewController:myStoreVC animated:YES];
                }
            }else{//设置
                MySettingsViewController *mySettingsVC = [[MySettingsViewController alloc] init];
                mySettingsVC.hidesBottomBarWhenPushed = YES;
                [weakself.navigationController pushViewController:mySettingsVC animated:YES];
            }
        }];
        
        
        [weakself.loginView setDidSelectedButton:^(NSInteger buttonTag) {
            switch (buttonTag) {
                case 10:{
                    
                }
                    break;
                case 11:{
                    
                }
                    break;
                case 20:{
                    MyOrderViewController *myOrderVC = [[MyOrderViewController alloc] init];
                    myOrderVC.hidesBottomBarWhenPushed = YES;
                    [weakself.navigationController pushViewController:myOrderVC animated:YES];
                }
                default:
                    break;
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
