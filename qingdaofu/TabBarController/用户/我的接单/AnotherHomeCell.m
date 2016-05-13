//
//  AnotherHomeCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AnotherHomeCell.h"

@implementation AnotherHomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self addSubview:self.typeImageView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.typeLabel];
        [self addSubview:self.addressLabel];
        [self addSubview:self.grayLabel];
        [self addSubview:self.moneyView];
        [self addSubview:self.pointView];
        [self addSubview:self.rateView];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.actionView];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.typeImageView autoSetDimensionsToSize:CGSizeMake(40, 18)];
        [self.typeImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        [self.typeImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
        
        [self.nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.typeImageView withOffset:10];
        [self.nameLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.typeImageView];
        
        [self.typeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kBigPadding];
        [self.typeLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.nameLabel];
        
        [self.addressLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.typeImageView];
        [self.addressLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.typeImageView withOffset:10];
        
        [self.grayLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.addressLabel withOffset:10];
        [self.grayLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.typeImageView];
        [self.grayLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15];
        [self.grayLabel autoSetDimension:ALDimensionHeight toSize:1];
        
        NSArray *views = @[self.moneyView,self.pointView,self.rateView];
        [views autoSetViewsDimensionsToSize:CGSizeMake(kScreenWidth/3, 88)];
        
        [self.moneyView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.moneyView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.grayLabel];
        
        [self.pointView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.pointView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.moneyView];
        
        [self.rateView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.rateView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.moneyView];
        
        [self.lineLabel2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.moneyView];
        [self.lineLabel2 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.lineLabel2 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.lineLabel2 autoSetDimension:ALDimensionHeight toSize:kLineWidth];
        
        [self.actionView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel2];
        [self.actionView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.actionView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.actionView autoSetDimension:ALDimensionHeight toSize:kCellHeight];

        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIImageView *)typeImageView
{
    if (!_typeImageView) {
        _typeImageView = [UIImageView newAutoLayoutView];
        _typeImageView.backgroundColor = kRedColor;
    }
    return _typeImageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
        _nameLabel.font = kSecondFont;
        _nameLabel.text = @"RZ201602220001";
        _nameLabel.textColor = kGrayColor;
    }
    return _nameLabel;
}

- (UILabel *)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [UILabel newAutoLayoutView];
        _typeLabel.font = kSecondFont;
        _typeLabel.textColor = kBlueColor;
    }
    return _typeLabel;
}

- (UILabel *)addressLabel
{
    if (!_addressLabel) {
        _addressLabel = [UILabel newAutoLayoutView];
        _addressLabel.font = kSecondFont;
        _addressLabel.text = @"抵押物地址：上海市浦东新区浦东南路855号";
        _addressLabel.textColor = kLightGrayColor;
    }
    return _addressLabel;
}

- (LineLabel *)grayLabel
{
    if (!_grayLabel) {
        _grayLabel = [LineLabel newAutoLayoutView];
    }
    return _grayLabel;
}

- (MoneyView *)moneyView
{
    if (!_moneyView) {
        _moneyView = [MoneyView newAutoLayoutView];
        _moneyView.label1.text = @"80";
        _moneyView.label1.textColor = kYellowColor;
        _moneyView.label2.text = @"借款本金(万元)";
    }
    return _moneyView;
}

- (MoneyView *)pointView
{
    if (!_pointView) {
        _pointView = [MoneyView newAutoLayoutView];
        _pointView.label1.text = @"5.0%";
        _pointView.label1.textColor = kBlackColor;
        _pointView.label2.text = @"风险代理";
    }
    return _pointView;
}

- (MoneyView *)rateView
{
    if (!_rateView) {
        _rateView = [MoneyView newAutoLayoutView];
        _rateView.label1.text = @"机动车";
        _rateView.label1.textColor = kBlueColor;
        _rateView.label2.text = @"债券类型";
    }
    return _rateView;
}

- (LineLabel *)lineLabel2
{
    if (!_lineLabel2) {
        _lineLabel2 = [LineLabel newAutoLayoutView];
    }
    return _lineLabel2;
}

- (AnotherView *)actionView
{
    if (!_actionView) {
        _actionView = [AnotherView newAutoLayoutView];
    }
    return _actionView;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
