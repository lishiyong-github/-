//
//  SingleButton.h
//  qingdaofu
//
//  Created by zhixiang on 16/4/27.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleButton : UIButton

@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;

@property (nonatomic,assign) CGFloat textW;
@property (nonatomic,assign) CGFloat textH;

@end
