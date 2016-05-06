//
//  AppDelegate.m
//  qingdaofu
//
//  Created by zhixiang on 16/1/28.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AppDelegate.h"


#import "TabBar.h"
#import "TabBarItem.h"

#import "NewProductViewController.h"
#import "ProductsViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"

#import "MoneyView.h"

#import "APIKey.h"
#import <MAMapKit/MAMapKit.h>

@interface AppDelegate ()<TabBarDelegate,UIActionSheetDelegate>

@property (nonatomic,strong) MoneyView *singleButton1;
@property (nonatomic,strong) MoneyView *singleButton2;
@property (nonatomic,strong) MoneyView *singleButton3;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //设置apiKey
//    [MAMapServices sharedServices].apiKey = (NSString *)APIKey;
    
//    ViewController *VC = [[ViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
//    self.window.rootViewController = nav;
    
    NewProductViewController *newProductVC = [[NewProductViewController alloc] init];
    UINavigationController *newproductNav = [[UINavigationController alloc] initWithRootViewController:newProductVC];
    ProductsViewController *productsVC = [[ProductsViewController alloc] init];
    UINavigationController *productsNav = [[UINavigationController alloc] initWithRootViewController:productsVC];
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:messageVC];
    MineViewController *mineVC = [[MineViewController alloc] init];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[newproductNav,productsNav,messageNav,mineNav];
    
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    TabBar *tabBar = [[TabBar alloc] initWithFrame:tabBarController.tabBar.bounds];
    
    CGFloat normalButtonWidth = (kScreenWidth * 3 / 4) / 4;
    CGFloat tabBarHeight = CGRectGetHeight(tabBar.frame);
    CGFloat publishItemWidth = (kScreenWidth / 4);

    TabBarItem *newProductItem = [self tabBarItemWithFram:CGRectMake(0, 0, normalButtonWidth, tabBarHeight) title:@"推荐" normalImageName:@"" selectedImageName:@"" tabBarItemType:TabBarItemTypeNormal];
    TabBarItem *productsItem = [self tabBarItemWithFram:CGRectMake(normalButtonWidth, 0, normalButtonWidth, tabBarHeight) title:@"产品" normalImageName:@"" selectedImageName:@"" tabBarItemType:TabBarItemTypeNormal];
    TabBarItem *publishItem = [self tabBarItemWithFram:CGRectMake(normalButtonWidth * 2, 0, normalButtonWidth, tabBarHeight) title:@"" normalImageName:@"" selectedImageName:@"" tabBarItemType:TabBarItemTypeRise];
    publishItem.backgroundColor = kBlueColor;
    
    TabBarItem *messageItem = [self tabBarItemWithFram:CGRectMake(normalButtonWidth * 2 + publishItemWidth, 0, normalButtonWidth, tabBarHeight) title:@"消息" normalImageName:@"" selectedImageName:@"" tabBarItemType:TabBarItemTypeNormal];
    TabBarItem *mineItem = [self tabBarItemWithFram:CGRectMake(normalButtonWidth * 3 + publishItemWidth, 0, normalButtonWidth, tabBarHeight) title:@"用户" normalImageName:@"" selectedImageName:@"" tabBarItemType:TabBarItemTypeNormal];
    
    tabBar.tabBarItems = @[newProductItem,productsItem,publishItem,messageItem,mineItem];
    tabBar.delegate = self;
    [tabBarController.tabBar addSubview:tabBar];
    
    tabBarController.selectedIndex = 3;
    tabBarController.selectedViewController = newproductNav;
//    tabBarController.tabBarItem.badgeValue = @"2";
    
    self.window.rootViewController = tabBarController;
    
    return YES;
}

#pragma mark - TabBarDelegate
- (TabBarItem *)tabBarItemWithFram:(CGRect)frame title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName tabBarItemType:(TabBarItemType)tabBarItemType
{
    TabBarItem *item = [[TabBarItem alloc] initWithFrame:frame];
    [item setTitle:title forState:0];
    [item setTitle:title forState:UIControlStateSelected];
    item.titleLabel.font = kTabBarFont;
    
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    [item setImage:normalImage forState:0];
    [item setImage:selectedImage forState:UIControlStateSelected];
    [item setTitleColor:kLightGrayColor forState:0];
    [item setTitleColor:kBlueColor forState:UIControlStateSelected];
    item.tabBarItemType = tabBarItemType;
    return item;
}

#pragma mark - tabBar delegate
- (void)tabBarDidSelectedRiseButton
{
//    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
//    UIViewController *viewController = tabBarController.selectedViewController;
    
//    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    
//    [viewController.view addSubview:self.singleButton2];
    
    NSLog(@"发布");
    
}

- (MoneyView *)singleButton1
{
    if (!_singleButton1) {

    }
    return _singleButton1;
}

- (MoneyView *)singleButton2
{
    if (!_singleButton2) {
        UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
        _singleButton2 = [[MoneyView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/3, kScreenWidth/3)];
        _singleButton2.center = keyWindow.center;
    }
    return _singleButton2;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
