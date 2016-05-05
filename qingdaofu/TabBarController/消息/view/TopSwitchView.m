//
//  TopSwitchView.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/27.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "TopSwitchView.h"

@interface TopSwitchView ()

@property (nonatomic,strong) UIButton *getbutton;
@property (nonatomic,strong) UIButton *sendButton;
@property (nonatomic,strong) UILabel *blueLabel;
@property (nonatomic,strong) UILabel *lineLabel;

@end

@implementation TopSwitchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubview:self.getbutton];
        [self addSubview:self.sendButton];
        [self addSubview:self.lineLabel];
        [self addSubview:self.blueLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.getbutton autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.getbutton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.getbutton autoSetDimensionsToSize:CGSizeMake(kScreenWidth/2, 50)];
        
        [self.sendButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.sendButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.sendButton autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.getbutton];
        [self.sendButton autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.getbutton];
        
        [self.lineLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.getbutton];
        [self.lineLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.lineLabel autoSetDimensionsToSize:CGSizeMake(kScreenWidth, 1)];
        
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
                weakself.blueLabel.frame = CGRectMake(_getbutton.left+kScreenWidth/8,49, kScreenWidth/4, 2);
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
                weakself.blueLabel.frame = CGRectMake(_sendButton.left+kScreenWidth/8,49, kScreenWidth/4, 2);
            }];
        }];
    }
    return _sendButton;
}

- (UILabel *)lineLabel
{
    if (!_lineLabel) {
        _lineLabel = [UILabel newAutoLayoutView];
        _lineLabel.backgroundColor = kGrayColor;
    }
    return _lineLabel;
}

- (UILabel *)blueLabel
{
    if (!_blueLabel) {
        _blueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/8,49, kScreenWidth/4, 2)];
        _blueLabel.backgroundColor = kBlueColor;
    }
    
    return _blueLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
