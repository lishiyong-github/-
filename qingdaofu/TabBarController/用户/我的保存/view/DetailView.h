//
//  DetailView.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/3.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompletCellView.h"

@interface DetailView : UIView

@property (nonatomic,strong) CompletCellView *complete1;
@property (nonatomic,strong) CompletCellView *complete2;
@property (nonatomic,strong) CompletCellView *complete3;
@property (nonatomic,strong) CompletCellView *complete4;

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,assign) CGFloat aH;
@end
