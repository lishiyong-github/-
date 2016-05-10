//
//  ReportSuccessView.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/10.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LineLabel.h"

@interface ReportSuccessView : UIView

@property (nonatomic,strong) UILabel *tiLabel;
@property (nonatomic,strong) UILabel *tyLabel;
@property (nonatomic,strong) UILabel *stLabel;

@property (nonatomic,strong) LineLabel *stLineLabel;
@property (nonatomic,strong) UIButton *toButton;

@property (nonatomic,assign) BOOL didSetupConstraints;

@end
