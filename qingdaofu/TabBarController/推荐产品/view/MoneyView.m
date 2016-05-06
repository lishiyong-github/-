//
//  MoneyView.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/28.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MoneyView.h"

@interface MoneyView ()

@property (nonatomic,assign) CGFloat lH1;
@property (nonatomic,assign) CGFloat lH2;

@end

@implementation MoneyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.label1];
        [self addSubview:self.label2];
        
        [self setNeedsUpdateConstraints];
        
        _aH = 45 + _lH1 + _lH2;
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        [self.label1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        [self.label1 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.label1 autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.label1 autoSetDimension:ALDimensionHeight toSize:_lH1];
        
        [self.label2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.label1 withOffset:15];
        [self.label2 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.label2 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.label1];
        [self.label2 autoSetDimension:ALDimensionHeight toSize:_lH2];
        
        self.didSetupConstraints = YES;
    }
    
    [super updateConstraints];
}

- (UILabel *)label1
{
    if (!_label1) {
        _label1 = [UILabel newAutoLayoutView];
        _label1.textColor = kYellowColor;
        _label1.text = @"800";
        _label1.font = [UIFont systemFontOfSize:24];
        _label1.textAlignment = NSTextAlignmentCenter;
        
        CGSize size = [_label1.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:24]}];
        
        _lH1 = size.height;
    }
    return _label1;
}

- (UILabel *)label2
{
    if (!_label2) {
        _label2 = [UILabel newAutoLayoutView];
        _label2.textColor = kLightGrayColor;
        _label2.text = @"借款";
        _label2.textAlignment = NSTextAlignmentCenter;
        _label2.font = kSecondFont;
        CGSize size = [_label2.text sizeWithAttributes:@{NSFontAttributeName:kSecondFont}];
        _lH2 = size.height;

    }
    return _label2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
