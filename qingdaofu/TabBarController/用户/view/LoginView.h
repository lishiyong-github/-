//
//  LoginView.h
//  qingdaofu
//
//  Created by zhixiang on 16/4/27.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginView : UIView

@property (nonatomic,strong) void (^didSelectedIndex)(NSIndexPath*);
@property (nonatomic,strong) void (^didSelectedButton)(NSInteger);

@end
