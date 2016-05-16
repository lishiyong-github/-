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
        [self addSubview:self.separateLabel1];
        [self addSubview:self.stateLabel];
        [self addSubview:self.separateLabel2];
        [self addSubview:self.messageLabel];
        
       
       self.leftConstraints = [self.messageLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.separateLabel2 withOffset:0];
       self.leftConstraints = [self.messageLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        self.leftConstraints = [self.messageLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        self.leftConstraints = [self.messageLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        NSArray *views1 = @[self.dateLabel,self.stateLabel,self.messageLabel];
        [views1 autoAlignViewsToAxis:ALAxisHorizontal];
        
        NSArray *views2 = @[self.separateLabel1,self.separateLabel2];
        [views2 autoSetViewsDimension:ALDimensionWidth toSize:kLineWidth];
        
        [self.dateLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.dateLabel autoSetDimension:ALDimensionWidth toSize:100];
        
        [self.separateLabel1 autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.separateLabel1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.dateLabel];
        [self.separateLabel1 autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
        [self.stateLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.separateLabel1];
        [self.stateLabel autoSetDimension:ALDimensionWidth toSize:80];
        
        [self.separateLabel2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.stateLabel];
        [self.separateLabel2 autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.separateLabel2 autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        

//        [self.messageLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
//        [self.messageLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
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
        _dateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _dateLabel;
}

- (UILabel *)stateLabel
{
    if (!_stateLabel) {
        _stateLabel = [UILabel newAutoLayoutView];
        _stateLabel.textColor = kGrayColor;
        _stateLabel.font = kSecondFont;
        _stateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _stateLabel;
}

- (UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [UILabel newAutoLayoutView];
        _messageLabel.textColor = kGrayColor;
        _messageLabel.font = kSecondFont;
        _messageLabel.numberOfLines = 0;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _messageLabel;
}

-(UILabel *)separateLabel1
{
    if (!_separateLabel1) {
        _separateLabel1 = [UILabel newAutoLayoutView];
        _separateLabel1.backgroundColor = kBlueColor;
    }
    return _separateLabel1;
}

- (UILabel *)separateLabel2
{
    if (!_separateLabel2) {
        _separateLabel2 = [UILabel newAutoLayoutView];
        _separateLabel2.backgroundColor = kBlueColor    ;
    }
    return _separateLabel2;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
