//
//  AllProSegView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/9.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AllProSegView.h"

@implementation AllProSegView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.allButton];
        [self addSubview:self.ingButton];
        [self addSubview:self.dealButton];
        [self addSubview:self.endButton];
        [self addSubview:self.closeButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.allButton,self.ingButton,self.dealButton,self.endButton,self.closeButton];
        [views autoSetViewsDimensionsToSize:CGSizeMake(kScreenWidth/5, 40)];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)allButton
{
    if (!_allButton) {
        _allButton = [UIButton newAutoLayoutView];
        _allButton.titleLabel.font = kBigFont;
        [_allButton setTitleColor:kBlackColor forState:0];
        [_allButton setTitleColor:kBlueColor forState:UIControlStateSelected];
    }
    return _allButton;
}

- (UIButton *)ingButton
{
    if (!_ingButton) {
        _ingButton = [UIButton newAutoLayoutView];
        _ingButton.titleLabel.font = kBigFont;
        [_ingButton setTitleColor:kBlackColor forState:0];
        [_ingButton setTitleColor:kBlueColor forState:UIControlStateSelected];
    }
    return _ingButton;
}

- (UIButton *)dealButton
{
    if (!_dealButton) {
        _dealButton = [UIButton newAutoLayoutView];
        _dealButton.titleLabel.font = kBigFont;
        [_dealButton setTitleColor:kBlackColor forState:0];
        [_dealButton setTitleColor:kBlueColor forState:UIControlStateSelected];
    }
    return _dealButton;
}

- (UIButton *)endButton
{
    if (!_endButton) {
        _endButton = [UIButton newAutoLayoutView];
        _endButton.titleLabel.font = kBigFont;
        [_endButton setTitleColor:kBlackColor forState:0];
        [_endButton setTitleColor:kBlueColor forState:UIControlStateSelected];
    }
    return _endButton;
}

- (UIButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [UIButton newAutoLayoutView];
        _closeButton.titleLabel.font = kBigFont;
        [_closeButton setTitleColor:kBlackColor forState:0];
        [_closeButton setTitleColor:kBlueColor forState:UIControlStateSelected];
    }
    return _closeButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
