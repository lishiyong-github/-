//
//  RequestView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "RequestView.h"

@implementation RequestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.textField];
        [self addSubview:self.label];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.textField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kBigPadding];
        [self.textField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        
        [self.label autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kBigPadding];
        [self.label autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.textField];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [UITextField newAutoLayoutView];
        _textField.textColor = kBlackColor;
        _textField.font = kBigFont;
        _textField.delegate = self;
    }
    return _textField;
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

#pragma mark - textField delegate 
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.textField endEditing:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
