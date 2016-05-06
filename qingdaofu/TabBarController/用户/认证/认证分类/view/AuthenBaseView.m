//
//  AuthenBaseView.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/29.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AuthenBaseView.h"

@interface AuthenBaseView ()<UITextFieldDelegate>

@property (nonatomic,assign) CGFloat lH;
@property (nonatomic,assign) CGFloat lW;
@property (nonatomic,assign) BOOL didSetupConstraints;

@end

@implementation AuthenBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.label];
//        [self addSubview:self.textView];
        [self addSubview:self.textField];
        [self addSubview:self.button];
        
        [self setNeedsUpdateConstraints];
        _aH = 30 + _lH;
    }
    return self;
}

-(void)updateConstraints
{
    if (!self.didSetupConstraints) {
    
        [self.label autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:13];
        [self.label autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.label autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.textField autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.label];
        [self.textField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:90];
        
        [self.button autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.label];
        [self.button autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15];
        
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)label
{
    if (!_label) {
        _label = [UILabel newAutoLayoutView];
        _label.font = kBigFont;
        _label.text = @"联系方式";
        _label.textColor = kBlackColor;
        _label.numberOfLines = 0;
        CGSize size = [_label.text sizeWithAttributes:@{NSFontAttributeName:kFirstFont}];
        _lH = size.height;
    }
    return _label;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [UITextField newAutoLayoutView];
        _textField.font = kFirstFont;
        _textField.textColor = kBlackColor;
        _textField.delegate = self;
    }
    return _textField;
}

- (UIButton *)button
{
    if (!_button) {
        _button = [UIButton newAutoLayoutView];
        _button.titleLabel.font = kSecondFont;
        [_button setTitleColor:kLightGrayColor forState:0];
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
