//
//  RequestTextView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "RequestTextView.h"

@implementation RequestTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.delegate = self;
        [self addSubview:self.remindLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraits) {
        
        [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
        [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.remindLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        self.didSetupConstraits = YES;
    }
    [super updateConstraints];
}

- (UILabel *)remindLabel
{
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.textColor = kLightGrayColor;
        _remindLabel.font = kFirstFont;
        _remindLabel.numberOfLines = 0;
    }
    return _remindLabel;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [self.remindLabel setHidden:YES];
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if (textView.text.length <= 0) {
        [self.remindLabel setHidden:NO];
    }
    [textView resignFirstResponder];
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
