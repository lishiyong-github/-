//
//  StarSingleView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "StarSingleView.h"

#define cW 25

@implementation StarSingleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.textLabel];
        [self addSubview:self.starBtn1];
        [self addSubview:self.starBtn2];
        [self addSubview:self.starBtn3];
        [self addSubview:self.starBtn4];
        [self addSubview:self.starBtn5];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.textLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kBigPadding];
        [self.textLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        
        NSArray *views = @[self.starBtn1,self.starBtn2,self.starBtn3,self.starBtn4,self.starBtn5];
        [views autoSetViewsDimensionsToSize:CGSizeMake(cW, cW)];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
        [self.starBtn1 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:4*kSmallPadding+kBigPadding+4*cW];
        [self.starBtn1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kSmallPadding];
        
        [self.starBtn2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.starBtn1 withOffset:kSmallPadding];
    
        [self.starBtn3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.starBtn2 withOffset:kSmallPadding];
        
        [self.starBtn4 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.starBtn3 withOffset:kSmallPadding];
        [self.starBtn5 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.starBtn4 withOffset:kSmallPadding];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [UILabel newAutoLayoutView];
        _textLabel.font = kFirstFont;
        _textLabel.textColor = kGrayColor;
    }
    return _textLabel;
}

- (UIButton *)starBtn1
{
    if (!_starBtn1) {
        _starBtn1 = [UIButton newAutoLayoutView];
        _starBtn1.tag = 11;
//        [_starBtn1 setTitle:@"星" forState:0];
//        [_starBtn1 setTitleColor:kLightGrayColor forState:0];
//        [_starBtn1 setTitleColor:kRedColor forState:UIControlStateSelected];
//        _starBtn1.titleLabel.font = kBigFont;
        [_starBtn1 setImage:[UIImage imageNamed:@"publish_star_s"] forState:UIControlStateSelected];
        [_starBtn1 setImage:[UIImage imageNamed:@"publish_star"] forState:0];
        [_starBtn1 addTarget:self action:@selector(starResult:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _starBtn1;
}

- (UIButton *)starBtn2
{
    if (!_starBtn2) {
        _starBtn2 = [UIButton newAutoLayoutView];
        _starBtn2.tag = 12;
        [_starBtn2 setImage:[UIImage imageNamed:@"publish_star_s"] forState:UIControlStateSelected];
        [_starBtn2 setImage:[UIImage imageNamed:@"publish_star"] forState:0];
//        _starBtn2.titleLabel.font = kBigFont;
        [_starBtn2 addTarget:self action:@selector(starResult:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _starBtn2;
}

- (UIButton *)starBtn3
{
    if (!_starBtn3) {
        _starBtn3 = [UIButton newAutoLayoutView];
        _starBtn3.tag = 13;
        [_starBtn3 setImage:[UIImage imageNamed:@"publish_star_s"] forState:UIControlStateSelected];
        [_starBtn3 setImage:[UIImage imageNamed:@"publish_star"] forState:0];
//        _starBtn3.titleLabel.font = kBigFont;
        [_starBtn3 addTarget:self action:@selector(starResult:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _starBtn3;
}

- (UIButton *)starBtn4
{
    if (!_starBtn4) {
        _starBtn4 = [UIButton newAutoLayoutView];
        _starBtn4.tag = 14;
        [_starBtn4 setImage:[UIImage imageNamed:@"publish_star_s"] forState:UIControlStateSelected];
        [_starBtn4 setImage:[UIImage imageNamed:@"publish_star"] forState:0];
//        _starBtn4.titleLabel.font = kBigFont;
        [_starBtn4 addTarget:self action:@selector(starResult:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _starBtn4;
}

- (UIButton *)starBtn5
{
    if (!_starBtn5) {
        _starBtn5 = [UIButton newAutoLayoutView];
        _starBtn5.tag = 15;
        [_starBtn5 setImage:[UIImage imageNamed:@"publish_star_s"] forState:UIControlStateSelected];
        [_starBtn5 setImage:[UIImage imageNamed:@"publish_star"] forState:0];
//        _starBtn5.titleLabel.font = kBigFont;
        [_starBtn5 addTarget:self action:@selector(starResult:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _starBtn5;
}

- (void)starResult:(UIButton *)btn
{
    for (int k = btn.tag; k>=11; k--) {
        UIButton *selectedBtn = [self viewWithTag:k];
        selectedBtn.selected = YES;
    }
    
    for (int p = btn.tag+1; p<16; p++) {
        UIButton *noSelectedBtn = [self viewWithTag:p];
        noSelectedBtn.selected = NO;
    }
    
    if (self.didSelectedStar) {
        self.didSelectedStar(btn.tag-10);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
