//
//  CompletView.h
//  qingdaofu
//
//  Created by zhixiang on 16/4/29.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CompletCellView.h"
#import "CompleteSingleView.h"
#import "CompletePictureView.h"

@interface CompletView : UIView

@property (nonatomic,assign) CGFloat aH;

@property (nonatomic,strong) CompleteSingleView *cell1;
@property (nonatomic,strong) CompletCellView *completeCell2;
@property (nonatomic,strong) CompletePictureView *cell3;
@property (nonatomic,strong) CompletCellView *completeCell4;
@property (nonatomic,strong) CompletCellView *completeCell5;

@property (nonatomic,assign) BOOL didSetupConstraints;

@end
