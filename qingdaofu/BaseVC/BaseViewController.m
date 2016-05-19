//
//  BaseViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/1/29.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "BaseViewController.h"

#import "UIImage+Color.h"

@interface BaseViewController ()

@property (nonatomic,strong) UIButton *leftBackBtn;
@property (nonatomic,assign) BOOL didSetupConstraints;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kBackColor;
    
    //设置导航条的字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:kBlackColor,NSFontAttributeName:kNavFont}];
    
    //去除系统效果
    self.navigationController.navigationBar.translucent = NO;
    
    //设置导航栏颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

-(UIBarButtonItem *)leftItem
{
    if (!_leftItem) {
        _leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"information_nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    return _leftItem;
}

- (UIButton *)leftBackBtn
{
    if (!_leftBackBtn) {
        _leftBackBtn = [UIButton buttonWithType:0];
        _leftBackBtn.bounds = CGRectMake(0, 0, 24, 24);
        [_leftBackBtn setImage:[UIImage imageNamed:@"information_nav_back"] forState:0];
        [_leftBackBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBackBtn;
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
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
