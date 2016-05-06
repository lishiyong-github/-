//
//  CompletView.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/29.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "CompletView.h"

@interface CompletView ()

@property (nonatomic,assign) CGFloat lH;

@end

@implementation CompletView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.cell1];
        [self addSubview:self.completeCell2];
        [self addSubview:self.cell3];
        [self addSubview:self.completeCell4];
        [self addSubview:self.completeCell5];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        NSArray *views = @[self.completeCell2,self.completeCell4,self.completeCell5];
        [views autoSetViewsDimensionsToSize:CGSizeMake(kScreenWidth, self.completeCell2.aH)];
        
        [self.cell1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
        [self.cell1 autoSetDimensionsToSize:CGSizeMake(kScreenWidth, self.cell1.aH)];
        
        [self.completeCell2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cell1];
        [self.completeCell2 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.cell3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.completeCell2];
        [self.cell3 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.cell3 autoSetDimensionsToSize:CGSizeMake(kScreenWidth, 70)];
        
        [self.completeCell4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cell3];
        [self.completeCell4 autoPinEdgeToSuperviewEdge:ALEdgeLeft];

        [self.completeCell5 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.completeCell4];
        [self.completeCell5 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (CompleteSingleView *)cell1
{
    if (!_cell1) {
        _cell1 = [CompleteSingleView newAutoLayoutView];
        _cell1.label1.text = @"姓名：";
        _cell1.imageView.image = [UIImage imageNamed:@"identification_label"];
    }
    return _cell1;
}

-(CompletCellView *)completeCell2
{
    if (!_completeCell2) {
        _completeCell2 = [CompletCellView newAutoLayoutView];
        _completeCell2.label1.text = @"身份证号码:";
    }
    return _completeCell2;
}
-(CompletePictureView *)cell3{
    if (!_cell3) {
        _cell3 = [CompletePictureView newAutoLayoutView];
        _cell3.label.text = @"身份照片:";
    }
    return _cell3;
}
-(CompletCellView *)completeCell4
{
    if (!_completeCell4) {
        _completeCell4 = [CompletCellView newAutoLayoutView];
        _completeCell4.label1.text = @"邮箱:";
    }
    return _completeCell4;
}

- (CompletCellView *)completeCell5
{
    if (!_completeCell5) {
        _completeCell5 = [CompletCellView newAutoLayoutView];
        _completeCell5.label1.text = @"经典案例:";
    }
    return _completeCell5;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
