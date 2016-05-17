//
//  ReportFinanceCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/17.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReportFinanceCell.h"
#import "UIButton+Addition.h"

@implementation ReportFinanceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.fiLabel];
        [self addSubview:self.fiTextField];
        [self addSubview:self.fiButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.fiLabel,self.fiTextField,self.fiButton];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
        [self.fiLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        
        [self.fiLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:13];
        
        [self.fiTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:110];
        
        [self.fiButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kBigPadding];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)fiLabel
{
    if (!_fiLabel) {
        _fiLabel = [UILabel newAutoLayoutView];
        _fiLabel.textColor = kBlackColor;
        _fiLabel.font = kBigFont;
    }
    return _fiLabel;
}

- (UITextField *)fiTextField
{
    if (!_fiTextField) {
        _fiTextField = [UITextField newAutoLayoutView];
        _fiTextField.textColor = kBlackColor;
        _fiTextField.font = kSecondFont;
    }
    return _fiTextField;
}

- (UIButton *)fiButton
{
    if (!_fiButton) {
        _fiButton = [UIButton newAutoLayoutView];
        [_fiButton swapImage];
        [_fiButton setTitleColor:kBlueColor forState:0];
        _fiButton.titleLabel.font = kSecondFont;
    }
    return _fiButton;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
