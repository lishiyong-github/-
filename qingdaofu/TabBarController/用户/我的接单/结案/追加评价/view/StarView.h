//
//  StarView.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarSingleView.h"

@interface StarView : UIView

@property (nonatomic,strong) StarSingleView *starView1;
@property (nonatomic,strong) StarSingleView *starView2;
@property (nonatomic,strong) StarSingleView *starView3;

@property (nonatomic,assign) BOOL didSetupConstraints;
@end
