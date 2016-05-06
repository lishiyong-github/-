//
//  EvaBaseView.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/6.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthenBaseView.h"

@interface EvaBaseView : UIView

@property (nonatomic,strong) AuthenBaseView *userTimeLabel;
@property (nonatomic,strong) UILabel *starView;

@property (nonatomic,strong) UILabel *evaLabel;
@property (nonatomic,strong) UIButton *proLabel;
@property (nonatomic,strong) UIButton *AddEvaButton;

@property (nonatomic,assign) BOOL didSetupConstraints;

@end
