//
//  NewsCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/6.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        [self addSubview:self.seperateLabel];
        [self.contentView addSubview:self.flagImageView];
        [self.contentView addSubview:self.typeLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.contextLabel];
        [self.contentView addSubview:self.goTobutton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.flagImageView,self.typeLabel,self.timeLabel];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
        NSArray *views2 = @[self.contextLabel,self.goTobutton];
        [views2 autoAlignViewsToAxis:ALAxisHorizontal];
        
//        [self.seperateLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
//        [self.seperateLabel autoSetDimension:ALDimensionHeight toSize:kBigPadding];
        
        [self.flagImageView autoSetDimensionsToSize:CGSizeMake(5, 5)];
        [self.flagImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        
//        [self.typeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.seperateLabel withOffset:kBigPadding];
//        [self.typeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:self.leftWidthConstraints.constant];
        [self.typeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.flagImageView withOffset:5];
        [self.typeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kBigPadding];
        
        
        [self.timeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kBigPadding];
        
        [self.contextLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.typeLabel withOffset:kBigPadding];
        [self.contextLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        
        [self.goTobutton autoSetDimensionsToSize:CGSizeMake(15, 15)];
        [self.goTobutton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kBigPadding];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)seperateLabel
{
    if (!_seperateLabel) {
        _seperateLabel = [UILabel newAutoLayoutView];
        _seperateLabel.backgroundColor = kBackColor;
    }
    return _seperateLabel;
}

- (UIImageView *)flagImageView
{
    if (!_flagImageView) {
        _flagImageView = [UIImageView newAutoLayoutView];
        _flagImageView.backgroundColor = kBlueColor;
    }
    return _flagImageView;
}

- (UILabel *)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [UILabel newAutoLayoutView];
        _typeLabel.textColor = kBlackColor;
        _typeLabel.font = kBigFont;
    }
    return _typeLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel newAutoLayoutView];
        _timeLabel.textColor = kLightGrayColor;
        _timeLabel.font = [UIFont systemFontOfSize:10];
    }
    return _timeLabel;
}

- (UILabel *)contextLabel
{
    if (!_contextLabel) {
        _contextLabel = [UILabel newAutoLayoutView];
        _contextLabel.textColor = kLightGrayColor;
        _contextLabel.font = kSecondFont;
    }
    return _contextLabel;
}

- (UIButton *)goTobutton
{
    if (!_goTobutton) {
        _goTobutton = [UIButton newAutoLayoutView];
        [_goTobutton setImage:[UIImage imageNamed:@"list_more"] forState:0];
    }
    return _goTobutton;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
