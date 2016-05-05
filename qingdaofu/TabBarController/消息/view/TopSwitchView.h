//
//  TopSwitchView.h
//  qingdaofu
//
//  Created by zhixiang on 16/4/27.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopSwitchView : UIView

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) void (^didSelectedButton)(NSInteger);

@end
