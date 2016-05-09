//
//  BidCellView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/3.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "BidCellView.h"

@interface BidCellView ()

@end

@implementation BidCellView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.cellView1];
        [self addSubview:self.lineLabel1];
        [self addSubview:self.cellView2];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.cellView3];
        [self addSubview:self.lineLabel3];
        [self addSubview:self.cellView4];
        [self addSubview:self.lineLabel4];
        [self addSubview:self.cellView5];
    }
    return self;
}

- (AuthenBaseView *)cellView1
{
    if (!_cellView1) {
        _cellView1 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _cellView1.label.text = @"|  展示信息";
        _cellView1.label.textColor = kBlueColor;
        
        _cellView1.textField.userInteractionEnabled = NO;
    }
    return _cellView1;
}

- (UILabel *)lineLabel1
{
    if (!_lineLabel1) {
        _lineLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.cellView1.bottom, kScreenWidth, 0.5)];
        _lineLabel1.backgroundColor = kSeparateColor;
    }
    return _lineLabel1;
}

- (DetailBaseView *)cellView2
{
    if (!_cellView2) {
        _cellView2 = [[DetailBaseView alloc] initWithFrame:CGRectMake(0, self.lineLabel1.bottom, kScreenWidth, kCellHeight)];
        _cellView2.label1.text = @"投资类型";
        [_cellView2.button1 setTitle:@"融资" forState:0];
    }
    return _cellView2;
}
- (UILabel *)lineLabel2
{
    if (!_lineLabel2) {
        _lineLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(kBigPadding, self.cellView2.bottom, kScreenWidth-kBigPadding, 0.5)];
        _lineLabel2.backgroundColor = kSeparateColor;
    }
    return _lineLabel2;
}

- (DetailBaseView *)cellView3
{
    if (!_cellView3) {
        _cellView3 = [[DetailBaseView alloc] initWithFrame:CGRectMake(0, self.lineLabel2.bottom, kScreenWidth, kCellHeight)];
        _cellView3.label1.text = @"借款金额";
        [_cellView3.button1 setTitle:@"10000000万" forState:0];
    }
    return _cellView3;
}
- (UILabel *)lineLabel3
{
    if (!_lineLabel3) {
        _lineLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(kBigPadding, self.cellView3.bottom, kScreenWidth-kBigPadding, 0.5)];
        _lineLabel3.backgroundColor = kSeparateColor;
    }
    return _lineLabel3;
}

- (DetailBaseView *)cellView4
{
    if (!_cellView4) {
        _cellView4 = [[DetailBaseView alloc] initWithFrame:CGRectMake(0, self.lineLabel3.bottom, kScreenWidth, kCellHeight)];
        _cellView4.label1.text = @"借款利率";
        [_cellView4.button1 setTitle:@"7.0%" forState:0];
    }
    return _cellView4;
}
- (UILabel *)lineLabel4
{
    if (!_lineLabel4) {
        _lineLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(kBigPadding, self.cellView4.bottom, kScreenWidth-kBigPadding, 0.5)];
        _lineLabel4.backgroundColor = kSeparateColor;
    }
    return _lineLabel4;
}

- (DetailBaseView *)cellView5
{
    if (!_cellView5) {
        _cellView5 = [[DetailBaseView alloc] initWithFrame:CGRectMake(0, self.lineLabel4.bottom, kScreenWidth, kCellHeight)];
        _cellView5.label1.text = @"返点";
        [_cellView5.button1 setTitle:@"3%" forState:0];
    }
    return _cellView5;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
