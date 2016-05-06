//
//  EvaBaseView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/6.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "EvaBaseView.h"

@implementation EvaBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.userTimeLabel];
        [self addSubview:self.starView];
        [self addSubview:self.evaLabel];
        [self addSubview:self.proLabel];
        [self addSubview:self.AddEvaButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (AuthenBaseView *)userTimeLabel
{
    if (!_userTimeLabel) {
        
    }
    return _userTimeLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
