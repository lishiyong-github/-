//
//  UserButton.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/28.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "UserButton.h"

@interface UserButton ()

@property (nonatomic,assign) CGFloat lH;
@property (nonatomic,assign) CGFloat lW;

@end

@implementation UserButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        [self addSubview:self.imageView1];
        [self addSubview:self.label1];
        
        [self setNeedsUpdateConstraints];
        _aH = 66 + _lH;
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.imageView1 autoSetDimensionsToSize:CGSizeMake(21, 21)];
        [self.imageView1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kBigPadding];
        [self.imageView1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(kScreenWidth/4-21)/2];
        
        [self.label1 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.imageView1];
        [self.label1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.imageView1 withOffset:kSmallPadding];
        
        self.didSetupConstraints = YES;
    }
    
    [super updateConstraints];
}

-(UIImageView *)imageView1
{
    if (!_imageView1) {
        _imageView1 = [UIImageView newAutoLayoutView];
        _imageView1.backgroundColor = kBlueColor;
    }
    return _imageView1;
}

- (UILabel *)label1
{
    if (!_label1) {
        _label1 = [UILabel newAutoLayoutView];
        _label1.textColor = kGrayColor;
        _label1.text = @"申请中";
        _label1.font = kSecondFont;
        _label1.textAlignment = NSTextAlignmentCenter;
        _label1.userInteractionEnabled = YES;
        CGSize size = [_label1.text sizeWithAttributes:@{NSFontAttributeName:kSecondFont}];
        _lH = size.height;
    }
    return _label1;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
