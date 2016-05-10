//
//  ReportAddView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/10.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ReportAddView.h"

@implementation ReportAddView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.adCell0];
        [self addSubview:self.adLine0];
        [self addSubview:self.adCell1];
        [self addSubview:self.adLine1];
        [self addSubview:self.adCell2];
        [self addSubview:self.adLine2];
        [self addSubview:self.adCell3];
        [self addSubview:self.adLine3];
        [self addSubview:self.adCell4];
        [self addSubview:self.adLine4];
        [self addSubview:self.adCell5];
        [self addSubview:self.adLine5];
        [self addSubview:self.adCell6];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstarints) {
        
        NSArray *views = @[self.adCell0,self.adCell1,self.adCell2,self.adCell3,self.adCell4,self.adCell5,self.adCell6];
        [views autoSetViewsDimensionsToSize:CGSizeMake(kScreenWidth, kCellHeight)];
        [views autoAlignViewsToAxis:ALAxisVertical];
        
        NSArray *views2 = @[self.adLine0,self.adLine1,self.adLine2,self.adLine3,self.adLine4,self.adLine5];
        [views2 autoSetViewsDimension:ALDimensionHeight toSize:kLineWidth];
        
        NSArray *views3 = @[self.adLine1,self.adLine2,self.adLine3,self.adLine4,self.adLine5];
        [views3 autoAlignViewsToAxis:ALAxisVertical];
        
        [self.adCell0 autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.adCell0 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.adLine0 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.adCell0];
        [self.adLine0 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.adLine0 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.adCell1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.adLine0];
        [self.adCell1 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.adLine1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.adCell1];
        [self.adLine1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.adLine1 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.adCell2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.adLine1];
        [self.adCell2 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.adLine2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.adCell2];
        [self.adLine2 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.adLine2 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.adCell3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.adLine2];
        [self.adCell3 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.adLine3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.adCell3];
        [self.adLine3 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.adLine3 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.adCell4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.adLine3];
        [self.adCell4 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.adLine4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.adCell4];
        [self.adLine4 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.adLine4 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.adCell5 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.adLine4];
        [self.adCell5 autoPinEdgeToSuperviewEdge:ALEdgeLeft];

        [self.adLine5 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.adCell5];
        [self.adLine5 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.adLine5 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.adCell6 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.adLine5];
        [self.adCell6 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        self.didSetupConstarints = YES;
    }
    [super updateConstraints];
}

- (AuthenBaseView *)adCell0
{
    if (!_adCell0) {
        _adCell0 = [AuthenBaseView newAutoLayoutView];

        NSString *str1 = @"|  补充信息";
        NSString *str2 = @"(选填)";
        NSString *str = [NSString stringWithFormat:@"%@%@",str1,str2];
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:str];
        [attributeStr addAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} range:NSMakeRange(0, str1.length)];
        [attributeStr addAttributes:@{NSFontAttributeName:kSecondFont,NSForegroundColorAttributeName:kBlackColor} range:NSMakeRange(str1.length, str2.length)];
        [_adCell0.label setAttributedText:attributeStr];
        
        _adCell0.textField.userInteractionEnabled = NO;
    }
    return _adCell0;
}

- (LineLabel *)adLine0
{
    if (!_adLine0) {
        _adLine0 = [LineLabel newAutoLayoutView];
    }
    return _adLine0;
}

- (AuthenBaseView *)adCell1
{
    if (!_adCell1) {
        _adCell1 = [AuthenBaseView newAutoLayoutView];
        _adCell1.label.text = @"借款期限";
        _adCell1.textField.placeholder = @"借款期限";
        [_adCell1.button setTitle:@">" forState:0];
    }
    return _adCell1;
}

- (LineLabel *)adLine1
{
    if (!_adLine1) {
        _adLine1 = [LineLabel newAutoLayoutView];
    }
    return _adLine1;
}
- (BaseLabel *)adCell2
{
    if (!_adCell2) {
        _adCell2 = [BaseLabel newAutoLayoutView];
        _adCell2.nameLabel.text = @"抵押物类型";
        [_adCell2.tButton setTitleColor:kBlueColor forState:0];
    }
    return _adCell2;
}

- (LineLabel *)adLine2
{
    if (!_adLine2) {
        _adLine2 = [LineLabel newAutoLayoutView];
    }
    return _adLine2;
}
- (BaseLabel *)adCell3
{
    if (!_adCell3) {
        _adCell3 = [BaseLabel newAutoLayoutView];
        _adCell3.nameLabel.text = @"抵押物状态";
        [_adCell3.tButton setTitleColor:kBlueColor forState:0];
    }
    return _adCell3;
}
- (LineLabel *)adLine3
{
    if (!_adLine3) {
        _adLine3 = [LineLabel newAutoLayoutView];
    }
    return _adLine3;
}

- (AuthenBaseView *)adCell4
{
    if (!_adCell4) {
        _adCell4 = [AuthenBaseView newAutoLayoutView];
        _adCell4.label.text = @"抵押物面积";
        
        NSMutableAttributedString *AttriStr = [[NSMutableAttributedString alloc] initWithString:@"输入抵押物面积"];
        [AttriStr addAttributes:@{NSFontAttributeName:kSecondFont,NSForegroundColorAttributeName:kLightGrayColor} range:NSMakeRange(0, AttriStr.length)];
        [_adCell4.textField setAttributedPlaceholder:AttriStr];
        
        [_adCell4.button setTitleColor:kBlueColor forState:0];
        [_adCell4.button setTitle:@"M²" forState:0];
    }
    return _adCell4;
}

- (LineLabel *)adLine4
{
    if (!_adLine4) {
        _adLine4 = [LineLabel newAutoLayoutView];
    }
    return _adLine4;
}

- (AuthenBaseView *)adCell5
{
    if (!_adCell5) {
        _adCell5 = [AuthenBaseView newAutoLayoutView];
        _adCell5.label.text = @"借款人年龄";
        
        NSMutableAttributedString *AttriStr = [[NSMutableAttributedString alloc] initWithString:@"请输入年龄，只能输入数字"];
        [AttriStr addAttributes:@{NSFontAttributeName:kSecondFont,NSForegroundColorAttributeName:kLightGrayColor} range:NSMakeRange(0, AttriStr.length)];
        [_adCell5.textField setAttributedPlaceholder:AttriStr];
        _adCell5.textField.keyboardType = UIKeyboardTypeNumberPad;
        
        [_adCell5.button setTitleColor:kBlueColor forState:0];
        [_adCell5.button setTitle:@"岁" forState:0];
    }
    return _adCell5;
}

- (LineLabel *)adLine5
{
    if (!_adLine5) {
        _adLine5 = [LineLabel newAutoLayoutView];
    }
    return _adLine5;
}

- (BaseLabel *)adCell6
{
    if (!_adCell6) {
        _adCell6 = [BaseLabel newAutoLayoutView];
        _adCell6.nameLabel.text = @"权利人年龄";
        [_adCell6.tButton setTitleColor:kBlueColor forState:0];
    }
    return _adCell6;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
