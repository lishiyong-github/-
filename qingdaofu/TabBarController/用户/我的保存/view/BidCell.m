//
//  BidCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/11.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "BidCell.h"

@implementation BidCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cellView1];
        [self.contentView addSubview:self.lineLabel1];
        [self.contentView addSubview:self.cellView2];
        [self.contentView addSubview:self.lineLabel2];
        [self.contentView addSubview:self.cellView3];
        [self.contentView addSubview:self.lineLabel3];
        [self.contentView addSubview:self.cellView4];
        [self.contentView addSubview:self.lineLabel4];
        [self.contentView addSubview:self.cellView5];

        [self.contentView setNeedsUpdateConstraints];
    }
    return  self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.cellView1,self.cellView2,self.cellView3,self.cellView4,self.cellView5];
        [views autoSetViewsDimensionsToSize:CGSizeMake(kScreenWidth, kCellHeight)];
        [views autoAlignViewsToAxis:ALAxisVertical];
        
        NSArray *views2 = @[self.lineLabel1,self.lineLabel2,self.lineLabel3,self.lineLabel4];
        [views2 autoSetViewsDimension:ALDimensionHeight toSize:kLineWidth];
        
        [self.cellView1 autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.cellView1 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.lineLabel1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cellView1];
        [self.lineLabel1 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.cellView2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel1];
        [self.cellView2 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.lineLabel2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cellView2];
        [self.lineLabel2 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.lineLabel2 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.cellView3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel2];
        [self.cellView3 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.lineLabel3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cellView3];
        [self.lineLabel3 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.lineLabel3 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.cellView4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel3];
        [self.cellView4 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        [self.lineLabel4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cellView4];
        [self.lineLabel4 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.lineLabel4 autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.cellView5 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel4];
        [self.cellView5 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}


- (AuthenBaseView *)cellView1
{
    if (!_cellView1) {
        _cellView1 = [AuthenBaseView newAutoLayoutView];
        _cellView1.label.text = @"|  展示信息";
        _cellView1.label.textColor = kBlueColor;
        _cellView1.textField.userInteractionEnabled = NO;
    }
    return _cellView1;
}

- (LineLabel *)lineLabel1
{
    if (!_lineLabel1) {
        _lineLabel1 = [LineLabel newAutoLayoutView];
    }
    return _lineLabel1;
}

- (DetailBaseView *)cellView2
{
    if (!_cellView2) {
        _cellView2 = [DetailBaseView newAutoLayoutView];
        _cellView2.label1.text = @"投资类型";
        [_cellView2.button1 setTitle:@"融资" forState:0];
    }
    return _cellView2;
}
- (LineLabel *)lineLabel2
{
    if (!_lineLabel2) {
        _lineLabel2 = [LineLabel newAutoLayoutView];
    }
    return _lineLabel2;
}

- (DetailBaseView *)cellView3
{
    if (!_cellView3) {
        _cellView3 = [DetailBaseView newAutoLayoutView];
        _cellView3.label1.text = @"借款金额";
        [_cellView3.button1 setTitle:@"10000000万" forState:0];
    }
    return _cellView3;
}
- (LineLabel *)lineLabel3
{
    if (!_lineLabel3) {
        _lineLabel3 = [LineLabel newAutoLayoutView];
    }
    return _lineLabel3;
}

- (DetailBaseView *)cellView4
{
    if (!_cellView4) {
        _cellView4 = [DetailBaseView newAutoLayoutView];
        _cellView4.label1.text = @"借款利率";
        [_cellView4.button1 setTitle:@"7.0%" forState:0];
    }
    return _cellView4;
}
- (LineLabel *)lineLabel4
{
    if (!_lineLabel4) {
        _lineLabel4 = [LineLabel newAutoLayoutView];
    }
    return _lineLabel4;
}

- (DetailBaseView *)cellView5
{
    if (!_cellView5) {
        _cellView5 = [DetailBaseView newAutoLayoutView];
        _cellView5.label1.text = @"返点";
        [_cellView5.button1 setTitle:@"3%" forState:0];
    }
    return _cellView5;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
