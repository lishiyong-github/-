//
//  BidMessageCell.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/19.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BidMessageCell : UITableViewCell

@property (nonatomic,strong) UILabel *deadlineLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *areaLabel;
@property (nonatomic,strong) UILabel *addressLabel;

@property (nonatomic,assign) BOOL didSetupConstraints;

@end
