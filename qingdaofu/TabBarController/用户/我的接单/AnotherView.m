//
//  AnotherView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/9.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AnotherView.h"

@implementation AnotherView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.firstButton];
        [self addSubview:self.secondButton];
        [self addSubview:self.thirdButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.firstButton,self.secondButton,self.thirdButton];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
        NSArray *views1 = @[self.secondButton,self.thirdButton];
        [views1 autoSetViewsDimensionsToSize:CGSizeMake(75, 25)];
        
//        [self.firstButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.firstButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        
        [self.secondButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:9.5];
//        [self.secondButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:100];
        
        [self.secondButton autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.thirdButton withOffset:-10];
        
        [self.thirdButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kBigPadding];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)firstButton
{
    if (!_firstButton) {
        _firstButton = [UIButton newAutoLayoutView];
        _firstButton.titleLabel.font = kSecondFont;
        [_firstButton setTitleColor:kRedColor forState:0];
    }
    return _firstButton;
}

- (UIButton *)secondButton
{
    if (!_secondButton) {
        _secondButton = [UIButton newAutoLayoutView];
        [_secondButton setTitleColor:kBlackColor forState:0];
        _secondButton.titleLabel.font = kFirstFont;
        _secondButton.layer.borderColor = kLightGrayColor.CGColor;
        _secondButton.layer.borderWidth = kLineWidth;
    }
    return _secondButton;
}

- (UIButton *)thirdButton
{
    if (!_thirdButton) {
        _thirdButton = [UIButton newAutoLayoutView];
        [_thirdButton setTitleColor:kBlueColor forState:0];
        _thirdButton.titleLabel.font = kFirstFont;
        _thirdButton.layer.borderColor = kBlueColor.CGColor;
        _thirdButton.layer.borderWidth = kLineWidth;
    }
    return _thirdButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
