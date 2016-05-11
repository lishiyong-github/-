//
//  BidSingleCell.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/11.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AuthenBaseView.h"
#import "DetailView.h"
#import "LineLabel.h"

@interface BidSingleCell : UITableViewCell

@property (nonatomic,strong) AuthenBaseView *cellView6;
@property (nonatomic,strong) LineLabel *lineLabel6;
@property (nonatomic,strong) DetailView *cellView7;
@property (nonatomic,strong) LineLabel *lineLabel7;
@property (nonatomic,strong) UIButton *cellView8;

@property (nonatomic,assign) BOOL didSetupConstraints;

@end
