//
//  NewPublishView.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/27.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "NewPublishView.h"

#import "SingleButton.h"

@interface NewPublishView ()

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) SingleButton *financeButton;
@property (nonatomic,strong) SingleButton *collectionButton;
@property (nonatomic,strong) SingleButton *suitButton;

@end

@implementation NewPublishView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.financeButton];
        [self addSubview:self.collectionButton];
        [self addSubview:self.suitButton];
        
        [self setNeedsUpdateConstraints];
        
        _tH = 95+self.financeButton.textH;
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        NSArray *views = @[self.financeButton,self.collectionButton,self.suitButton];
        [views autoSetViewsDimensionsToSize:CGSizeMake(95, 95+self.financeButton.textH)];
        
        [self.financeButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.financeButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.collectionButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.collectionButton autoAlignAxisToSuperviewAxis:ALAxisVertical];

        [self.suitButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.suitButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (SingleButton *)financeButton
{
    if (!_financeButton) {
        _financeButton = [SingleButton newAutoLayoutView];
        _financeButton.label.text = @"发布融资";
    }
    return _financeButton;
}

- (SingleButton *)collectionButton
{
    if (!_collectionButton) {
        _collectionButton = [SingleButton newAutoLayoutView];
        _collectionButton.center = self.center;
        _collectionButton.label.text = @"发布催收";
    }
    return _collectionButton;
}

- (SingleButton *)suitButton
{
    if (!_suitButton) {
        _suitButton = [SingleButton newAutoLayoutView];
        _suitButton.label.text = @"发布诉讼";
    }
    return _suitButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
