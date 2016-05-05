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
        
        [self addSubview:self.textView];
        [self addSubview:self.remindLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraits) {
        
        [self.textView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(kBigPadding, kBigPadding, kBigPadding, kBigPadding)];
        
//        [self.remindLabel autoPinEdgesToSuperviewMarginsExcludingEdge:ALEdgeBottom];
        
        [self.remindLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.textView];
        [self.remindLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.textView];
        
        self.didSetupConstraits = YES;
    }
    [super updateConstraints];
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [UITextView newAutoLayoutView];
        _textView.textColor= kBlueColor;
        _textView.font = kSecondFont;
        _textView.delegate = self;
    }
    return _textView;
}

- (UILabel *)remindLabel
{
    if (!_remindLabel) {
        _remindLabel = [UILabel newAutoLayoutView];
        _remindLabel.textColor = kLightGrayColor;
        _remindLabel.font = kFirstFont;
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
