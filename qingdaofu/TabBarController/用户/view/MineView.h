//
//  MineView.h
//  qingdaofu
//
//  Created by zhixiang on 16/4/28.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseLabel.h"
#import "UserButton.h"

@interface MineView : UIView

@property (nonatomic,strong) BaseLabel *topLabel;
@property (nonatomic,strong) UILabel *linelabel;
@property (nonatomic,strong) UserButton *button1;
@property (nonatomic,strong) UserButton *button2;
@property (nonatomic,strong) UserButton *button3;
@property (nonatomic,strong) UserButton *button4;

@property (nonatomic,assign) BOOL didSetupConstraints;

//@property (nonatomic,strong) void (^didSelectedButton)(NSInteger);

@property (nonatomic,assign) CGFloat aH;

@end
