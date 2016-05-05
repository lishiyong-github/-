//
//  PaceCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/5.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "PaceCell.h"

@implementation PaceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.dateLabel];
        [self addSubview:self.stateLabel];
        [self addSubview:self.messageLabel];
        [self addSubview:self.separateLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
//        [self.dateLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kSmallPadding];
        
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [UILabel newAutoLayoutView];
        _dateLabel.textColor = kGrayColor;
        _dateLabel.font = kSecondFont;
    }
    return _dateLabel;
}

- (UILabel *)stateLabel
{
    if (!_stateLabel) {
        _stateLabel = [UILabel newAutoLayoutView];
        _stateLabel.textColor = kGrayColor;
        _stateLabel.font = kSecondFont;
    }
    return _stateLabel;
}

- (UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [UILabel newAutoLayoutView];
        _messageLabel.textColor = kGrayColor;
        _messageLabel.font = kSecondFont;
    }
    return _messageLabel;
}

-(UILabel *)separateLabel
{
    if (!_separateLabel) {
        _separateLabel = [UILabel newAutoLayoutView];
        _separateLabel.backgroundColor = kRedColor;
        
    }
    return _separateLabel;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
