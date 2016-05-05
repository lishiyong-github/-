//
//  BidCellView.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/3.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthenBaseView.h"
#import "DetailBaseView.h"
#import "DetailView.h"

@interface BidCellView : UIView

@property (nonatomic,strong) AuthenBaseView *cellView1;
@property (nonatomic,strong) UILabel *lineLabel1;
@property (nonatomic,strong) DetailBaseView *cellView2;
@property (nonatomic,strong) UILabel *lineLabel2;
@property (nonatomic,strong) DetailBaseView *cellView3;
@property (nonatomic,strong) UILabel *lineLabel3;
@property (nonatomic,strong) DetailBaseView *cellView4;
@property (nonatomic,strong) UILabel *lineLabel4;
@property (nonatomic,strong) DetailBaseView *cellView5;

@property (nonatomic,assign) CGFloat aH;

@end
