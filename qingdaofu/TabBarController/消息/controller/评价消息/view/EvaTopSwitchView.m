//
//  EvaTopSwitchView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/6.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "EvaTopSwitchView.h"

@interface EvaTopSwitchView ()

@property (nonatomic,strong) UILabel *shortLineLabel;
@property (nonatomic,strong) UILabel *longLineLabel;

@end

@implementation EvaTopSwitchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubview:self.getbutton];
        [self addSubview:self.sendButton];
        [self addSubview:self.shortLineLabel];
        [self addSubview:self.blueLabel];
        [self addSubview:self.longLineLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.getbutton,self.shortLineLabel,self.sendButton];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
        [self.getbutton autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.getbutton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.getbutton autoSetDimensionsToSize:CGSizeMake(kScreenWidth/2, 40)];
        
        [self.sendButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.sendButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.sendButton autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.getbutton];
        [self.sendButton autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.getbutton];
        
        [self.shortLineLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.getbutton];
        [self.shortLineLabel autoSetDimensionsToSize:CGSizeMake(1, 25)];
        
        [self.longLineLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.getbutton];
        [self.longLineLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.longLineLabel autoSetDimensionsToSize:CGSizeMake(kScreenWidth, 1)];
        
        self.didSetupConstraints = YES;
    }
    
    [super updateConstraints];
}

- (UIButton *)getbutton
{
    if (!_getbutton) {
        _getbutton = [UIButton newAutoLayoutView];
        [_getbutton setTitle:@"收到的评价" forState:0];
        [_getbutton setTitleColor:[UIColor blackColor] forState:0];
        _getbutton.titleLabel.font = kFirstFont;
        
        QDFWeakSelf;
        [_getbutton addAction:^(UIButton *btn) {
            [UIView animateWithDuration:0.3 animations:^{
                weakself.blueLabel.frame = CGRectMake(_getbutton.left+kScreenWidth/8,38, kScreenWidth/4, 2);
            }];
        }];
    }
    return _getbutton;
}

- (UIButton *)sendButton
{
    if (!_sendButton) {
        _sendButton = [UIButton newAutoLayoutView];
        [_sendButton setTitle:@"发出的评价" forState:0];
        [_sendButton setTitleColor:[UIColor blackColor] forState:0];
        _sendButton.titleLabel.font = kFirstFont;
        
        QDFWeakSelf;
        [_sendButton addAction:^(UIButton *btn) {
            [UIView animateWithDuration:0.3 animations:^{
                weakself.blueLabel.frame = CGRectMake(_sendButton.left+kScreenWidth/8,38, kScreenWidth/4, 2);
            }];
        }];
    }
    return _sendButton;
}

- (UILabel *)shortLineLabel
{
    if (!_shortLineLabel) {
        _shortLineLabel = [UILabel newAutoLayoutView];
        _shortLineLabel.backgroundColor = kSeparateColor;
    }
    return _shortLineLabel;
}

- (UILabel *)blueLabel
{
    if (!_blueLabel) {
        _blueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/8,38, kScreenWidth/4, 2)];
        _blueLabel.backgroundColor = kBlueColor;
    }
    
    return _blueLabel;
}

- (UILabel *)longLineLabel
{
    if (!_longLineLabel) {
        _longLineLabel = [UILabel newAutoLayoutView];
        _longLineLabel.backgroundColor = kSeparateColor;
    }
    return _longLineLabel;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
