//
//  UserButton.h
//  qingdaofu
//
//  Created by zhixiang on 16/4/28.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserButton : UIButton

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UIImageView *imageView1;
@property (nonatomic,strong) UILabel *label1;

@property (nonatomic,assign) CGFloat aH;

@end
