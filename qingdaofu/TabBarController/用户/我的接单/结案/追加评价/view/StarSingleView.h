//
//  StarSingleView.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarSingleView : UIView

@property (nonatomic,strong) void (^didSelectedStar)(NSInteger);

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,strong) UIButton *starBtn1;
@property (nonatomic,strong) UIButton *starBtn2;
@property (nonatomic,strong) UIButton *starBtn3;
@property (nonatomic,strong) UIButton *starBtn4;
@property (nonatomic,strong) UIButton *starBtn5;

@end
