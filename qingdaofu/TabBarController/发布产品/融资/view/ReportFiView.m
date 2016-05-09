//
//  ReportFiView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/9.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReportFiView.h"

@implementation ReportFiView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
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
        NSArray *views = @[self.reCell0,self.reCell1,self.reCell2,self.reCell3,self.reCell4,self.reCell5];
        
        
        [self.reCell0 autoPinEdgesToSuperviewMarginsExcludingEdge:ALEdgeBottom];
        
        
        self.didSetupConstarints = YES;
    }
    [super updateConstraints];
}

- (AuthenBaseView *)reCell0
{
    if (!_reCell0) {
        _reCell0 = [AuthenBaseView newAutoLayoutView];
        _reCell0.label.text = @"|  基本信息";
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
        _reCell1.textField.placeholder = @"填写您希望融资的金额";
        [_reCell1.button setTitle:@"万元" forState:0];
        _reCell1.button.titleLabel.font = kSecondFont;
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
        _reCell2.textField.placeholder = @"能够给到中介的返点，如没有请输入0";
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
        _reCell3.textField.placeholder = @"能够给到融资方的利息";
        [_reCell3.button setTitle:@">" forState:0];
        [_reCell3.button setTitleColor:kBlueColor forState:0];
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
        _reCell4.textField.placeholder = @"小区/写字楼/商铺等";
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
