//
//  NewsCell.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/6.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell

@property (nonatomic,strong) UILabel *seperateLabel;
@property (nonatomic,strong) UIImageView *flagImageView;
@property (nonatomic,strong) UILabel *typeLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *contextLabel;
@property (nonatomic,strong) UIButton *goTobutton;

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) NSLayoutConstraint *leftWidthConstraints;

@end
