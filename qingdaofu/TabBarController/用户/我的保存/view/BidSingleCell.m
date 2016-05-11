//
//  BidSingleCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/11.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "BidSingleCell.h"

@implementation BidSingleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.cellView6];
        [self addSubview:self.lineLabel6];
        [self addSubview:self.cellView7];
        [self addSubview:self.lineLabel7];
        [self addSubview:self.cellView8];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.cellView6 autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.cellView6 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.cellView6 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.cellView6 autoSetDimension:ALDimensionHeight toSize:kCellHeight];
        
        [self.lineLabel6 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cellView6];
        [self.lineLabel6 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.lineLabel6 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.lineLabel6 autoSetDimension:ALDimensionHeight toSize:kLineWidth];
        
        [self.cellView7 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel6];
        [self.cellView7 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.cellView7 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.cellView7 autoSetDimension:ALDimensionHeight toSize:135];
        
        [self.lineLabel7 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cellView7];
        [self.lineLabel7 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.lineLabel7 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.lineLabel7 autoSetDimension:ALDimensionHeight toSize:kLineWidth];
        
        [self.cellView8 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel7 withOffset:13];
        [self.cellView8 autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.cellView8 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:13];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (AuthenBaseView *)cellView6
{
    if (!_cellView6) {
        _cellView6 = [AuthenBaseView newAutoLayoutView];
        _cellView6.label.text = @"|  基本信息";
        _cellView6.label.textColor = kBlueColor;
        _cellView6.textField.userInteractionEnabled = NO;
    }
    return _cellView6;
}
- (LineLabel *)lineLabel6
{
    if (!_lineLabel6) {
        _lineLabel6 = [LineLabel newAutoLayoutView];
    }
    return _lineLabel6;
}

- (DetailView *)cellView7
{
    if (!_cellView7) {
        _cellView7 = [DetailView newAutoLayoutView];
    }
    return _cellView7;
}
- (LineLabel *)lineLabel7
{
    if (!_lineLabel7) {
        _lineLabel7 = [LineLabel newAutoLayoutView];
        _lineLabel7.backgroundColor = kSeparateColor;
    }
    return _lineLabel7;
}
- (UIButton *)cellView8
{
    if (!_cellView8) {
        _cellView8 = [UIButton newAutoLayoutView];
        _cellView8.backgroundColor = kNavColor;
        [_cellView8 setTitle:@"查看补充信息" forState:0];
        [_cellView8 setTitleColor:kBlueColor forState:0];
        _cellView8.titleLabel.font = kBigFont;
    }
    return _cellView8;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
