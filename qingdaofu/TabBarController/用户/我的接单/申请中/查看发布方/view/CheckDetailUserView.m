//
//  CheckDetailUserView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "CheckDetailUserView.h"

@implementation CheckDetailUserView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.cellV1];
        [self addSubview:self.line1];
        [self addSubview:self.cellV2];
        [self addSubview:self.line2];
        [self addSubview:self.cellV3];
        [self addSubview:self.line3];
        [self addSubview:self.cellV4];
        [self addSubview:self.line4];
        [self addSubview:self.cellV5];
        [self addSubview:self.line5];
        [self addSubview:self.cellV6];

        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        NSArray *views1 = @[self.cellV1,self.cellV2,self.cellV3,self.cellV4,self.cellV5,self.cellV6];
        NSArray *views2 = @[self.line1,self.line2,self.line3,self.line4,self.line5];
        
        [views1 autoSetViewsDimensionsToSize:CGSizeMake(kScreenWidth, kCellHeight)];
        [views2 autoSetViewsDimensionsToSize:CGSizeMake(kScreenWidth, 0.5)];
        
        [self.cellV1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
        
        [self.line1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cellV1];
        [self.line1 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.cellV2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.line1];
        [self.cellV2 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.line2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cellV2];
        [self.line2 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.cellV3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.line2];
        [self.cellV3 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.line3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cellV3];
        [self.line3 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.cellV4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.line3];
        [self.cellV4 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.line4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cellV4];
        [self.line4 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.cellV5 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.line4];
        [self.cellV5 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.line5 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cellV5];
        [self.line5 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.cellV6 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.line5];
        [self.cellV6 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (AuthenBaseView *)cellV1
{
    if (!_cellV1) {
        _cellV1 = [AuthenBaseView newAutoLayoutView];
        _cellV1.label.textColor = kBlueColor;
        _cellV1.label.text = @"|  申请人信息";
        _cellV1.textField.userInteractionEnabled = NO;
        [_cellV1.button autoSetDimensionsToSize:CGSizeMake(24, 24)];
        [_cellV1.button setImage:[UIImage imageNamed:@"publish_list_authentication"] forState:0];
        }
    return _cellV1;
}

- (LineLabel *)line1
{
    if (!_line1) {
        _line1 = [LineLabel newAutoLayoutView];
    }
    return _line1;
}

- (AuthenBaseView *)cellV2
{
    if (!_cellV2) {
        _cellV2 = [AuthenBaseView newAutoLayoutView];
        _cellV2.label.text = @"姓名";
        _cellV2.textField.userInteractionEnabled = NO;
    }
    return _cellV2;
}
- (LineLabel *)line2
{
    if (!_line2) {
        _line2 = [LineLabel newAutoLayoutView];
    }
    return _line2;
}
- (AuthenBaseView *)cellV3
{
    if (!_cellV3) {
        _cellV3 = [AuthenBaseView newAutoLayoutView];
        _cellV3.label.text = @"身份证号码";
        _cellV3.textField.userInteractionEnabled = NO;
        _cellV3.button.titleLabel.font = kSecondFont;
        [_cellV3.button setTitleColor:kLightGrayColor forState:0];

    }
    return _cellV3;
}
- (LineLabel *)line3
{
    if (!_line3) {
        _line3 = [LineLabel newAutoLayoutView];
    }
    return _line3;
}
- (AuthenBaseView *)cellV4
{
    if (!_cellV4) {
        _cellV4 = [AuthenBaseView newAutoLayoutView];
        _cellV4.label.text = @"身份图片";
        _cellV4.textField.userInteractionEnabled = NO;
        _cellV4.button.titleLabel.font = kSecondFont;
        [_cellV4.button setTitleColor:kLightGrayColor forState:0];

    }
    return _cellV4;
}
- (LineLabel *)line4
{
    if (!_line4) {
        _line4 = [LineLabel newAutoLayoutView];
    }
    return _line4;
}
- (AuthenBaseView *)cellV5
{
    if (!_cellV5) {
        _cellV5 = [AuthenBaseView newAutoLayoutView];
        _cellV5.label.text = @"邮箱";
        _cellV5.textField.userInteractionEnabled = NO;
        [_cellV5.button setTitle:@"233455678@qq.com" forState:0];
    }
    return _cellV5;
}
- (LineLabel *)line5
{
    if (!_line5) {
        _line5 = [LineLabel newAutoLayoutView];
    }
    return _line5;
}
- (BaseLabel *)cellV6
{
    if (!_cellV6) {
        _cellV6 = [BaseLabel newAutoLayoutView];
        _cellV6.nameLabel.text = @"经典案例";
        [_cellV6.tButton setTitle:@"查看" forState:0];
    }
    return _cellV6;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
