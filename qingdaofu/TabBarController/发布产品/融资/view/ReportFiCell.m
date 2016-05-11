//
//  ReportFiCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/11.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReportFiCell.h"

@implementation ReportFiCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self addSubview:self.reCell0];
        [self addSubview:self.reLine0];
        [self addSubview:self.reCell1];
        [self addSubview:self.reLine1];
        [self addSubview:self.reCell2];
        [self addSubview:self.reLine2];
        [self addSubview:self.reCell3];
        [self addSubview:self.reLine3];
        [self addSubview:self.reCell4];
        [self addSubview:self.reLine4];
        [self addSubview:self.reCell5];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstarints) {
        NSArray *views = @[self.reCell0,self.reCell1,self.reCell2,self.reCell3,self.reCell4];
        [views autoSetViewsDimensionsToSize:CGSizeMake(kScreenWidth, kCellHeight)];
        [views autoAlignViewsToAxis:ALAxisVertical];
        
        NSArray *views2 = @[self.reLine0,self.reLine1,self.reLine2,self.reLine3,self.reLine4];
        [views2 autoSetViewsDimension:ALDimensionHeight toSize:kLineWidth];
        
        NSArray *views3 = @[self.reLine1,self.reLine2,self.reLine3,self.reLine4];
        [views3 autoAlignViewsToAxis:ALAxisVertical];
        
        
        [self.reCell0 autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.reCell0 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.reLine0 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.reCell0];
        [self.reLine0 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.reLine0 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.reCell1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.reLine0];
        [self.reCell1 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.reLine1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.reCell1];
        [self.reLine1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.reLine1 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.reCell2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.reLine1];
        [self.reCell2 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.reLine2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.reCell2];
        [self.reLine2 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.reLine2 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.reCell3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.reLine2];
        [self.reCell3 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.reLine3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.reCell3];
        [self.reLine3 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.reLine3 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.reCell4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.reLine3];
        [self.reCell4 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.reLine4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.reCell4];
        [self.reLine4 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.reLine4 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.reCell5 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.reLine4];
        [self.reCell5 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:100];
        [self.reCell5 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kBigPadding];
        [self.reCell5 autoSetDimension:ALDimensionHeight toSize:62];
        
        self.didSetupConstarints = YES;
    }
    [super updateConstraints];
}

- (AuthenBaseView *)reCell0
{
    if (!_reCell0) {
        _reCell0 = [AuthenBaseView newAutoLayoutView];
        _reCell0.label.text = @"|  基本信息";
        _reCell0.label.textColor = kBlueColor;
        _reCell0.textField.userInteractionEnabled = NO;
    }
    return _reCell0;
}

- (LineLabel *)reLine0
{
    if (!_reLine0) {
        _reLine0 = [LineLabel newAutoLayoutView];
    }
    return _reLine0;
}

- (AuthenBaseView *)reCell1
{
    if (!_reCell1) {
        _reCell1 = [AuthenBaseView newAutoLayoutView];
        _reCell1.label.text = @"借款本金";
        
        NSMutableAttributedString *sttString = [[NSMutableAttributedString alloc] initWithString:@"填写您希望融资的金额"];
        [sttString setAttributes:@{NSFontAttributeName:kSecondFont,NSForegroundColorAttributeName:kLightGrayColor} range:NSMakeRange(0, sttString.length)];
        [_reCell1.textField setAttributedPlaceholder:sttString];
        
        [_reCell1.button setTitle:@"万元" forState:0];
        _reCell1.button.titleLabel.font = kSecondFont;
        [_reCell1.button setTitleColor:kBlueColor forState:0];
    }
    return _reCell1;
}

- (LineLabel *)reLine1
{
    if (!_reLine1) {
        _reLine1 = [LineLabel newAutoLayoutView];
    }
    return _reLine1;
}

- (AuthenBaseView *)reCell2
{
    if (!_reCell2) {
        _reCell2 = [AuthenBaseView newAutoLayoutView];
        _reCell2.label.text = @"返点(%)";
        
        NSMutableAttributedString *sttString = [[NSMutableAttributedString alloc] initWithString:@"能够给到中介的返点，如没有请输入0"];
        [sttString setAttributes:@{NSFontAttributeName:kSecondFont,NSForegroundColorAttributeName:kLightGrayColor} range:NSMakeRange(0, sttString.length)];
        [_reCell2.textField setAttributedPlaceholder:sttString];
    }
    return _reCell2;
}

- (LineLabel *)reLine2
{
    if (!_reLine2) {
        _reLine2 = [LineLabel newAutoLayoutView];
    }
    return _reLine2;
}

- (AuthenBaseView *)reCell3
{
    if (!_reCell3) {
        _reCell3 = [AuthenBaseView newAutoLayoutView];
        _reCell3.label.text = @"借款利率(%)";
        
        NSMutableAttributedString *sttString = [[NSMutableAttributedString alloc] initWithString:@"能够给到融资方的利息"];
        [sttString setAttributes:@{NSFontAttributeName:kSecondFont,NSForegroundColorAttributeName:kLightGrayColor} range:NSMakeRange(0, sttString.length)];
        [_reCell3.textField setAttributedPlaceholder:sttString];
        
        [_reCell3.button setTitle:@"月" forState:0];
        [_reCell3.button setTitleColor:kBlueColor forState:0];
        [_reCell3.button setImage:[UIImage imageNamed:@"list_more"] forState:0];
    }
    return _reCell3;
}

- (LineLabel *)reLine3
{
    if (!_reLine3) {
        _reLine3 = [LineLabel newAutoLayoutView];
    }
    return _reLine3;
}

- (AuthenBaseView *)reCell4
{
    if (!_reCell4) {
        _reCell4 = [AuthenBaseView newAutoLayoutView];
        _reCell4.label.text = @"抵押物地址";
        NSMutableAttributedString *sttString = [[NSMutableAttributedString alloc] initWithString:@"小区/写字楼/商铺等"];
        [sttString setAttributes:@{NSFontAttributeName:kSecondFont,NSForegroundColorAttributeName:kLightGrayColor} range:NSMakeRange(0, sttString.length)];
        [_reCell4.textField setAttributedPlaceholder:sttString];
    }
    return _reCell4;
}

- (LineLabel *)reLine4
{
    if (!_reLine4) {
        _reLine4 = [LineLabel newAutoLayoutView];
    }
    return _reLine4;
}

- (RequestTextView *)reCell5
{
    if (!_reCell5) {
        _reCell5 = [RequestTextView newAutoLayoutView];
        _reCell5.remindLabel.text = @"详细地址";
        _reCell5.remindLabel.font = kSecondFont;
    }
    return _reCell5;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
