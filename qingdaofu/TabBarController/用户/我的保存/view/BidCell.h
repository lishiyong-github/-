//
//  BidCell.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/11.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AuthenBaseView.h"
#import "DetailBaseView.h"
#import "DetailView.h"
#import "LineLabel.h"

@interface BidCell : UITableViewCell


@property (nonatomic,strong) AuthenBaseView *cellView1;
@property (nonatomic,strong) LineLabel *lineLabel1;
@property (nonatomic,strong) DetailBaseView *cellView2;
@property (nonatomic,strong) LineLabel *lineLabel2;
@property (nonatomic,strong) DetailBaseView *cellView3;
@property (nonatomic,strong) LineLabel *lineLabel3;
@property (nonatomic,strong) DetailBaseView *cellView4;
@property (nonatomic,strong) LineLabel *lineLabel4;
@property (nonatomic,strong) DetailBaseView *cellView5;

@property (nonatomic,assign) CGFloat aH;

@property (nonatomic,assign) BOOL didSetupConstraints;

@end
