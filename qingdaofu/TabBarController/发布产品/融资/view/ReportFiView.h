//
//  ReportFiView.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/9.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseLabel.h"
#import "AuthenBaseView.h"
#import "LineLabel.h"
#import "RequestTextView.h"

@interface ReportFiView : UIView

@property (nonatomic,strong) AuthenBaseView *reCell0;
@property (nonatomic,strong) LineLabel *reLine0;
@property (nonatomic,strong) AuthenBaseView *reCell1;
@property (nonatomic,strong) LineLabel *reLine1;
@property (nonatomic,strong) AuthenBaseView *reCell2;
@property (nonatomic,strong) LineLabel *reLine2;
@property (nonatomic,strong) AuthenBaseView *reCell3;
@property (nonatomic,strong) LineLabel *reLine3;
@property (nonatomic,strong) AuthenBaseView *reCell4;
@property (nonatomic,strong) LineLabel *reLine4;
@property (nonatomic,strong) RequestTextView *reCell5;

@property (nonatomic,assign) BOOL didSetupConstarints;

@end
