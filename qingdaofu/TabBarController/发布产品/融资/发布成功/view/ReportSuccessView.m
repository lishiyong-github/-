//
//  ReportSuccessView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/10.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReportSuccessView.h"

@implementation ReportSuccessView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.tiLabel];
        [self addSubview:self.tyLabel];
        [self addSubview:self.stLabel];
        [self addSubview:self.stLineLabel];
        [self addSubview:self.toButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.tiLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kSmallPadding];
        [self.tiLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        
        [self.tyLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.tiLabel withOffset:kSmallPadding];
        [self.tyLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        
        [self.stLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.tyLabel withOffset:kSmallPadding];
        [self.stLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];

        [self.stLineLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.stLabel withOffset:kSmallPadding];
        [self.stLineLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.stLineLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.stLineLabel autoSetDimension:ALDimensionHeight toSize:kLineWidth];

        [self.toButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kBigPadding];
        [self.toButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.stLineLabel withOffset:kSmallPadding];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)tiLabel
{
    if (!_tiLabel) {
        _tiLabel = [UILabel newAutoLayoutView];
        _tiLabel.textColor = kLightGrayColor;
        _tiLabel.font = kFirstFont;
    }
    return _tiLabel;
}

- (UILabel *)tyLabel
{
    if (!_tyLabel) {
        _tyLabel = [UILabel newAutoLayoutView];
        _tyLabel.textColor = kLightGrayColor;
        _tyLabel.font = kFirstFont;
    }
    return _tyLabel;
}

- (UILabel *)stLabel
{
    if (!_stLabel) {
        _stLabel = [UILabel newAutoLayoutView];
        _stLabel.textColor = kLightGrayColor;
        _stLabel.font = kFirstFont;
    }
    return _stLabel;
}

- (LineLabel *)stLineLabel
{
    if (!_stLineLabel) {
        _stLineLabel = [LineLabel newAutoLayoutView];
    }
    return _stLineLabel;
}

- (UIButton *)toButton
{
    if (!_toButton) {
        _toButton = [UIButton newAutoLayoutView];
        _toButton.titleLabel.font = kBigFont;
        [_toButton setTitleColor:kBlueColor forState:0];
        [_toButton setTitle:@"点击查看我的发布>" forState:0];
    }
    return _toButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
