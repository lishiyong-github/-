//
//  AnotherHomeCell.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewProView.h"
#import "AuthenBaseView.h"
#import "AnotherView.h"

@interface AnotherHomeCell : UITableViewCell

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UILabel *lineLabel;
@property (nonatomic,strong) NewProView *cellView;
@property (nonatomic,strong) UILabel *lineLabel2;
@property (nonatomic,strong) AnotherView *actionView;

@end
