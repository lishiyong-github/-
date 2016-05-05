//
//  HomeCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/28.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"product";
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
    }
    return self;
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
    }
    return _cellView;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
