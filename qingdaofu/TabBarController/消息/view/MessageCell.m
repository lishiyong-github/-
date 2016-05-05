//
//  MessageCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/26.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"cell2";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self addSubview: self.userLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.newsLabel];
        [self addSubview:self.countLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.userLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
        [self.userLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
        [self.userLabel autoSetDimensionsToSize:CGSizeMake(200, 30)];
        
        [self.timeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.userLabel];
        [self.timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.userLabel];
        [self.timeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
        [self.timeLabel autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.userLabel];
        
        [self.newsLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.userLabel];
        [self.newsLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.userLabel];
        [self.newsLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.userLabel];
        [self.newsLabel autoSetDimension:ALDimensionHeight toSize:20];
        
        [self.countLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.timeLabel];
        [self.countLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
        [self.countLabel autoSetDimension:ALDimensionHeight toSize:20];
        [self.countLabel autoSetDimension:ALDimensionWidth toSize:20 relation:-1];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)userLabel
{
    if (!_userLabel) {
        _userLabel = [UILabel newAutoLayoutView];
        _userLabel.font = kBigFont;
    }
    return _userLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel newAutoLayoutView];
        _timeLabel.font = kSecondFont;
        _timeLabel.textColor = kLightGrayColor;
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}

- (UILabel *)newsLabel
{
    if (!_newsLabel) {
        _newsLabel = [UILabel newAutoLayoutView];
        _newsLabel.font = kFirstFont;
        _newsLabel.textColor = kGrayColor;
    }
    return _newsLabel;
}

- (UILabel *)countLabel
{
    if (!_countLabel) {
        _countLabel = [UILabel newAutoLayoutView];
        _countLabel.font = kSecondFont;
        _countLabel.textAlignment = NSTextAlignmentRight;
    }
    return _countLabel;
}


- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
