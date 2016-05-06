//
//  TakePictureView.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/29.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "TakePictureView.h"

@implementation TakePictureView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.button];
    }
    return self;
}

- (UIButton *)button
{
    if (!_button) {
        _button = [UIButton buttonWithType:0];
        _button.frame = CGRectMake(0, 0, 50, 50);
        _button.layer.cornerRadius = corner;
        _button.layer.masksToBounds = YES;
        _button.layer.borderWidth = kLineWidth;
        _button.layer.borderColor = kSeparateColor.CGColor;
    }
    return _button;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
