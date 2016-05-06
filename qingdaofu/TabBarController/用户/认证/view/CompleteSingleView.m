//
//  CompleteSingleView.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/29.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "CompleteSingleView.h"

@interface CompleteSingleView ()

@property (nonatomic,assign) CGFloat lH;
@property (nonatomic,assign) BOOL didSetupConstraints;

@end

@implementation CompleteSingleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.label1];
        [self addSubview:self.label2];
        [self addSubview:self.imageView];
        
        [self setNeedsUpdateConstraints];
        _aH = _lH + 30;
    }
    return self;
}

-(void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.label1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        [self.label1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
        
        [self.label2 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:105];
        [self.label2 autoAlignAxis:ALAxisBaseline toSameAxisOfView:self.label1];
        
        [self.imageView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.imageView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.imageView autoSetDimensionsToSize:CGSizeMake(35, 35)];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)label1
{
    if (!_label1) {
        _label1 = [UILabel newAutoLayoutView];
        _label1.textColor = kBlackColor;
        _label1.font = kBigFont;
        _label1.text = @"姓名:";
        
        CGSize size = [_label1.text sizeWithAttributes:@{NSFontAttributeName:kBigFont}];
        _lH = size.height;
    }
    return _label1;
}

-(UILabel *)label2
{
    if (!_label2) {
        _label2 = [UILabel newAutoLayoutView];
        _label2.textColor = kLightGrayColor;
        _label2.text = @"文案文案";
        _label2.font = kFirstFont;
    }
    return _label2;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [UIImageView newAutoLayoutView];
    }
    return _imageView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
