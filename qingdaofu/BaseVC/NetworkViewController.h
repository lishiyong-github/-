//
//  NetworkViewController.h
//  qingdaofu
//
//  Created by zhixiang on 16/1/29.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkViewController : UIViewController

-(void)requestDataGetWithString:(NSString *)string params:(NSDictionary *)params successBlock:()successBlock andFailBlock:()failBlock;

-(void)requestDataPostWithString:(NSString *)string params:(NSDictionary *)params successBlock:()successBlock andFailBlock:()failBlock;

-(void)showMBProgressHUDText:(NSString *)text;

@end
