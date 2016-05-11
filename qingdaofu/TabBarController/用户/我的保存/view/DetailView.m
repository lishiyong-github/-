//
//  DetailView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/3.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.complete1];
        [self addSubview:self.complete2];
        [self addSubview:self.complete3];
        [self addSubview:self.complete4];
        
        [self setNeedsUpdateConstraints];
        
        _aH = 15 + self.complete1.aH * 4;
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.complete1,self.complete2,self.complete3,self.complete4];
        [views autoSetViewsDimension:ALDimensionWidth toSize:kScreenWidth];
        
        [self.complete1 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.complete1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        
        [self.complete2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.complete1 withOffset:30];
        
        [self.complete3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.complete2 withOffset:30];
        
        [self.complete4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.complete3 withOffset:30];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (CompletCellView *)complete1
{
    if (!_complete1) {
        _complete1 = [CompletCellView newAutoLayoutView];
        _complete1.label1.text = @"借款期限:";
        _complete1.label2.text = @"12个月";
    }
    return _complete1;
}

- (CompletCellView *)complete2
{
    if (!_complete2) {
        _complete2 = [CompletCellView newAutoLayoutView];
        _complete2.label1.text = @"资金到账日:";
        _complete2.label2.text = @"2个月";
    }
    return _complete2;
}

-(CompletCellView *)complete3
{
    if (!_complete3) {
        _complete3 = [CompletCellView newAutoLayoutView];
        _complete3.label1.text = @"抵押物面积:";
        _complete3.label2.text = @"90平方";
    }
    return _complete3;
}

- (CompletCellView *)complete4
{
    if (!_complete4) {
        _complete4 = [CompletCellView newAutoLayoutView];
        _complete4.label1.text = @"抵押物地址:";
        _complete4.label2.text = @"上海市浦东新区浦东南路855号世界广场35楼";
    }
    return _complete4;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
