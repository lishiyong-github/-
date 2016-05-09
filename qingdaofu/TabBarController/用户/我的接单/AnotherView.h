//
//  AnotherView.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/9.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnotherView : UIView

@property (nonatomic,strong) UIButton *firstButton;
@property (nonatomic,strong) UIButton *secondButton;
@property (nonatomic,strong) UIButton *thirdButton;

@property (nonatomic,assign) BOOL didSetupConstraints;

@end
