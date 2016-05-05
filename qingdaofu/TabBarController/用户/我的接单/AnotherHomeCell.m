//
//  AnotherHomeCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AnotherHomeCell.h"

@implementation AnotherHomeCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"product";
    
    AnotherHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[AnotherHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self addSubview:self.lineLabel];
        [self addSubview:self.cellView];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.actionView];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.lineLabel,self.cellView,self.lineLabel2,self.actionView];
        [views autoSetViewsDimension:ALDimensionWidth toSize:kScreenWidth];
        
        [self.lineLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.lineLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.lineLabel autoSetDimension:ALDimensionHeight toSize:kBigPadding];
        
        [self.cellView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel];
        [self.cellView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.cellView autoSetDimension:ALDimensionHeight toSize:self.cellView.aH];
        
        [self.lineLabel2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.cellView];
        [self.lineLabel2 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.lineLabel2 autoSetDimension:ALDimensionHeight toSize:0.5];
        
        [self.actionView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineLabel2];
        [self.actionView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.actionView autoSetDimension:ALDimensionHeight toSize:kCellHeight];

        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)lineLabel
{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
        _lineLabel.backgroundColor = kBackColor;
    }
    return _lineLabel;
}
-(NewProView *)cellView
{
    if (!_cellView) {
        _cellView = [[NewProView alloc] initWithFrame:CGRectMake(0, self.lineLabel.bottom, kScreenWidth, _cellView.aH)];
        [_cellView.recommendimageView setHidden:YES];
    }
    return _cellView;
}

- (UILabel *)lineLabel2
{
    if (!_lineLabel2) {
        _lineLabel2 = [UILabel newAutoLayoutView];
        _lineLabel2.backgroundColor = kSeparateColor;
    }
    return _lineLabel2;
}

- (AuthenBaseView *)actionView
{
    if (!_actionView) {
        _actionView = [AuthenBaseView newAutoLayoutView];
        
        _actionView.label.text = @"截止日期：2016-01-01";
        _actionView.label.font = kSecondFont;
        _actionView.label.textColor = kLightGrayColor;
        
        _actionView.textField.placeholder = @"";
        _actionView.textField.userInteractionEnabled = NO;
        
        _actionView.button.layer.borderWidth = 1;
        _actionView.button.layer.borderColor = kBlueColor.CGColor;
        _actionView.button.layer.cornerRadius = corner;
        _actionView.button.layer.masksToBounds = YES;
        _actionView.button.titleLabel.font = kSecondFont;
    }
    return _actionView;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
