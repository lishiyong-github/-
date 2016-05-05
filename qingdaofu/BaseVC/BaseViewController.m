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
}

-(UIBarButtonItem *)leftItem
{
    if (!_leftItem) {
//        UIButton *backButton = [UIButton buttonWithType:0];
//        backButton.frame = CGRectMake(0, 0, 50, 50);
//        [backButton setTitle:@"<返回" forState:0];
//        [backButton setTitleColor:kBlueColor forState:0];
//        backButton.titleLabel.font = [UIFont systemFontOfSize:16];
//        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//        UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//        _leftItem = leftBarButtonItem;
        _leftItem = [[UIBarButtonItem alloc] initWithTitle:@"<返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        [_leftItem setTintColor:kBlueColor];
    }
    return _leftItem;
}

-(UIBarButtonItem *)rightItem
{
    if (!_rightItem) {
//        UIButton *shareButton = [UIButton buttonWithType:0];
//        [shareButton setTitle:@"分享" forState:0];
//        [shareButton setTitleColor:[UIColor blackColor] forState:0];
//        [shareButton addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
//        UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:shareButton];
        
        
        _rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(share)];
        [_rightItem setTintColor:kBlueColor];
    }
    return _rightItem;
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)share
{
    NSLog(@"分享");
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
