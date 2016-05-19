//
//  TakePictureCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/18.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "TakePictureCell.h"

@implementation TakePictureCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.pictureButton1];
        [self.contentView addSubview:self.pictureButton2];
        
        [self.contentView setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.pictureButton1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kBigPadding];
        [self.pictureButton1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kBigPadding];
        [self.pictureButton1 autoSetDimensionsToSize:CGSizeMake(50, 50)];
        
        [self.pictureButton2 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kBigPadding];
        [self.pictureButton2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.pictureButton1 withOffset:kBigPadding];
        [self.pictureButton2 autoSetDimensionsToSize:CGSizeMake(50, 50)];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)pictureButton1
{
    if (!_pictureButton1) {
        _pictureButton1 = [UIButton newAutoLayoutView];
        _pictureButton1.layer.cornerRadius = corner;
    }
    return _pictureButton1;
}

- (UIButton *)pictureButton2
{
    if (!_pictureButton2) {
        _pictureButton2 = [UIButton newAutoLayoutView];
        _pictureButton2.layer.cornerRadius = corner;
    }
    return _pictureButton2;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
