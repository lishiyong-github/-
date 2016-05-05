//
//  MyStoreCell.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/29.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyStoreCell.h"

@implementation MyStoreCell


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"mySave";
    MyStoreCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[MyStoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self addSubview:self.imageView1];
        [self addSubview:self.label1];
        [self addSubview:self.label2];
        //        [self addSubview:self.label3];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

-(void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.imageView1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        [self.imageView1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
        [self.imageView1 autoSetDimensionsToSize:CGSizeMake(40, 18)];
        
        [self.label1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.imageView1 withOffset:10];
        [self.label1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        //        [self.label1 autoAlignAxis:ALAxisBaseline toSameAxisOfView:self.imageView1];
        
        [self.label2 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:18];
        [self.label2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIImageView *)imageView1
{
    if (!_imageView1) {
        _imageView1 = [UIImageView newAutoLayoutView];
        _imageView1.backgroundColor = kBlueColor;
    }
    return _imageView1;
}

- (UILabel *)label1
{
    if (!_label1) {
        _label1 = [UILabel newAutoLayoutView];
        _label1.textColor = kBlackColor;
        _label1.text = @"BF364757070077";
        _label1.font = kFirstFont;
    }
    return _label1;
}

- (UILabel *)label2
{
    if (!_label2) {
        _label2 = [UILabel newAutoLayoutView];
        _label2.text = @"2016-12-12 >";
        _label2.textColor = kLightGrayColor;
        _label2.font = kSecondFont;
        _label2.textAlignment = NSTextAlignmentRight;
    }
    return _label2;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
