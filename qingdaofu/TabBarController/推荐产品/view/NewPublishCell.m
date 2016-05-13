//
//  NewPublishCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/13.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "NewPublishCell.h"

@implementation NewPublishCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.financeButton];
        [self addSubview:self.collectionButton];
        [self addSubview:self.suitButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        NSArray *views = @[self.financeButton,self.collectionButton,self.suitButton];
        [views autoSetViewsDimensionsToSize:CGSizeMake(95, 95+18)];
        
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

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
