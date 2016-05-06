//
//  MineView.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/28.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MineView.h"

@implementation MineView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.topLabel];
        [self addSubview:self.linelabel];
        [self addSubview:self.button1];
        [self addSubview:self.button2];
        [self addSubview:self.button3];
        [self addSubview:self.button4];
        
        [self setNeedsUpdateConstraints];
        _aH = self.topLabel.aH + 1 + self.button1.aH;
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        [self.topLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
        
        [self.linelabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.topLabel withOffset:self.topLabel.aH];
        [self.linelabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.linelabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.linelabel autoSetDimension:ALDimensionHeight toSize:0.5];
        
        NSArray *views = @[self.button1,self.button2,self.button3,self.button4];
        [views autoSetViewsDimensionsToSize:CGSizeMake(kScreenWidth/4, self.button1.aH)];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
        [self.button1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.linelabel];
        [self.button1 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.button2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.button1];
        [self.button3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.button2];
        [self.button4 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.button3];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (BaseLabel *)topLabel
{
    if (!_topLabel) {
        _topLabel = [BaseLabel newAutoLayoutView];
        _topLabel.nameLabel.text = @"我的发布";
        [_topLabel.tButton setTitle:@"查看全部  " forState:0];
//        QDFWeakSelf;
//        [_topLabel.tButton addAction:^(UIButton *btn) {
//            if (weakself.didSelectedButton) {
//                weakself.didSelectedButton(10);
//            }
//        }];
    }
    return _topLabel;
}

- (UILabel *)linelabel
{
    if (!_linelabel) {
        _linelabel = [UILabel newAutoLayoutView];
        _linelabel.backgroundColor = kSeparateColor;
    }
    return _linelabel;
}

- (UserButton *)button1
{
    if (!_button1) {
        _button1 = [UserButton newAutoLayoutView];
//        QDFWeakSelf;
//        [_button1 addAction:^(UIButton *btn) {
//            if (weakself.didSelectedButton) {
//                weakself.didSelectedButton(11);
//            }
//        }];
    }
    return _button1;
}

- (UserButton *)button2
{
    if (!_button2) {
        _button2 = [UserButton newAutoLayoutView];
        _button2.label1.text = @"处理中";
//        QDFWeakSelf;
//        [_button2 addAction:^(UIButton *btn) {
//            if (weakself.didSelectedButton) {
//                weakself.didSelectedButton(12);
//            }
//        }];
    }
    return _button2;
}

- (UserButton *)button3
{
    if (!_button3) {
        _button3 = [UserButton newAutoLayoutView];
        _button3.label1.text = @"终止";
//        QDFWeakSelf;
//        [_button3 addAction:^(UIButton *btn) {
//            if (weakself.didSelectedButton) {
//                weakself.didSelectedButton(13);
//            }
//        }];
    }
    return _button3;
}

- (UserButton *)button4
{
    if (!_button4) {
        _button4 = [UserButton newAutoLayoutView];
        _button4.label1.text = @"结案";
//        QDFWeakSelf;
//        [_button4 addAction:^(UIButton *btn) {
//            if (weakself.didSelectedButton) {
//                weakself.didSelectedButton(14);
//            }
//        }];
    }
    return _button4;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
