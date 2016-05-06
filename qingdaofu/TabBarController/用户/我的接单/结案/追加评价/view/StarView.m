//
//  StarView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "StarView.h"

@implementation StarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.starView1];
        [self addSubview:self.starView2];
        [self addSubview:self.starView3];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.starView1,self.starView2,self.starView3];
        [views autoSetViewsDimensionsToSize:CGSizeMake(kScreenWidth, kCellHeight)];
        
        [self.starView1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
        
        [self.starView2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.starView1];
        [self.starView2 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.starView3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.starView2];
        [self.starView3 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (StarSingleView *)starView1
{
    if (!_starView1) {
        _starView1 = [[StarSingleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _starView1.textLabel.text = @"真实性";
    }
    return _starView1;
}

- (StarSingleView *)starView2
{
    if (!_starView2) {
        _starView2 = [[StarSingleView alloc] initWithFrame:CGRectMake(0, self.starView1.bottom, kScreenWidth, kCellHeight)];
        _starView2.textLabel.text = @"配合度";
    }
    return _starView2;
}

- (StarSingleView *)starView3
{
    if (!_starView3) {
        _starView3 = [[StarSingleView alloc] initWithFrame:CGRectMake(0, self.starView2.bottom, kScreenWidth, kCellHeight)];
        _starView3.textLabel.text = @"响应度";
    }
    return _starView3;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
