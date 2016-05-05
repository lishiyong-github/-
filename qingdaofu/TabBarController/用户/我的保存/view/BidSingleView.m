//
//  BidSingleView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/3.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "BidSingleView.h"

@implementation BidSingleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.cellView6];
        [self addSubview:self.lineLabel6];
        [self addSubview:self.cellView7];
        [self addSubview:self.lineLabel7];
        [self addSubview:self.cellView8];
    }
    return self;
}

- (AuthenBaseView *)cellView6
{
    if (!_cellView6) {
        _cellView6 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _cellView6.label.text = @"| 基本信息";
        _cellView6.label.textColor = kBlueColor;
        _cellView6.textField.placeholder = @"";
        _cellView6.textField.userInteractionEnabled = NO;
    }
    return _cellView6;
}
- (UILabel *)lineLabel6
{
    if (!_lineLabel6) {
        _lineLabel6 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.cellView6.bottom, kScreenWidth, 0.5)];
        _lineLabel6.backgroundColor = kSeparateColor;
    }
    return _lineLabel6;
}

- (DetailView *)cellView7
{
    if (!_cellView7) {
        _cellView7 = [[DetailView alloc] initWithFrame:CGRectMake(0, self.lineLabel6.bottom, kScreenWidth, _cellView7.aH)];
    }
    return _cellView7;
}
- (UILabel *)lineLabel7
{
    if (!_lineLabel7) {
        _lineLabel7 = [[UILabel alloc] initWithFrame:CGRectMake(kBigPadding, self.lineLabel6.bottom + 135, kScreenWidth-kBigPadding, 0.5)];
        _lineLabel7.backgroundColor = kSeparateColor;
    }
    return _lineLabel7;
}
- (UIButton *)cellView8
{
    if (!_cellView8) {
        _cellView8 = [UIButton buttonWithType:0];
        _cellView8.frame = CGRectMake(0, self.lineLabel7.bottom, kScreenWidth, kCellHeight);
        _cellView8.backgroundColor = kNavColor;
        [_cellView8 setTitle:@"查看补充信息" forState:0];
        [_cellView8 setTitleColor:kBlueColor forState:0];
        _cellView8.titleLabel.font = kBigFont;
    }
    return _cellView8;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
