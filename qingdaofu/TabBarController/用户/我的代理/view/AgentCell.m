//
//  AgentCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/17.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AgentCell.h"

@implementation AgentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.agentLabel];
        [self.contentView addSubview:self.agentTextField];
        
        self.leftAgentContraints = [self.agentTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:90];
        
        [self.contentView setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.agentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.agentLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:13];
        
        [self.agentTextField autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.agentLabel];
        [self.agentTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kBigPadding];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)agentLabel
{
    if (!_agentLabel) {
        _agentLabel = [UILabel newAutoLayoutView];
        _agentLabel.textColor = kBlackColor;
        _agentLabel.font = kBigFont;
    }
    return _agentLabel;
}

- (UITextField *)agentTextField
{
    if (!_agentTextField) {
        _agentTextField = [UITextField newAutoLayoutView];
        _agentTextField.textColor = kBlackColor;
        _agentTextField.font = kSecondFont;
    }
    return _agentTextField;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
