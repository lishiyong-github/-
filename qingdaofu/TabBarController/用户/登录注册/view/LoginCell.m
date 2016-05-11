//
//  LoginCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/11.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "LoginCell.h"

@implementation LoginCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.loginTextField];
        [self addSubview:self.loginButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.loginTextField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:13];
        [self.loginTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        
        [self.loginButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kBigPadding];
        [self.loginButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.loginTextField];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UITextField *)loginTextField
{
    if (!_loginTextField) {
        _loginTextField = [UITextField newAutoLayoutView];
        _loginTextField.textColor = kBlackColor;
        _loginTextField.font = kBigFont;
    }
    return _loginTextField;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [UIButton newAutoLayoutView];
        _loginButton.titleLabel.font = kBigFont;
        [_loginButton setTitleColor:kBlueColor forState:0];
    }
    return _loginButton;
}

- (void)changePlaceholderColor:(NSString *)placeholder
{
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:placeholder];
    [attributeStr addAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kLightGrayColor} range:NSMakeRange(0, attributeStr.length)];
    [_loginTextField setAttributedPlaceholder:attributeStr];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
