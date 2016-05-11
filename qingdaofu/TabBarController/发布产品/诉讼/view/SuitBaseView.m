//
//  SuitBaseView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/10.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "SuitBaseView.h"

@implementation SuitBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.label];
        [self addSubview:self.segment];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.label,self.segment];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
        [self.label autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        
        [self.segment autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:105];
        [self.segment autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kSmallPadding];
        [self.segment autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kBigPadding];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)label
{
    if (!_label) {
        _label = [UILabel newAutoLayoutView];
        _label.textColor = kBlackColor;
        _label.font = kBigFont;
    }
    return _label;
}

- (UISegmentedControl *)segment
{
    if (!_segment) {
        _segment = [UISegmentedControl newAutoLayoutView];
        [_segment insertSegmentWithTitle:@"民间借贷" atIndex:0 animated:YES];
        [_segment insertSegmentWithTitle:@"应收帐款" atIndex:1 animated:YES];
        _segment.tintColor = kBlueColor;
        _segment.selectedSegmentIndex = 0;
    }
    return _segment;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
