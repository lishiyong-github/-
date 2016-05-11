//
//  CheckDetailUserCell.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/11.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AuthenBaseView.h"
#import "LineLabel.h"
#import "BaseLabel.h"

@interface CheckDetailUserCell : UITableViewCell

@property (nonatomic,strong) AuthenBaseView *cellV1;
@property (nonatomic,strong) LineLabel *line1;
@property (nonatomic,strong) AuthenBaseView *cellV2;
@property (nonatomic,strong) LineLabel *line2;
@property (nonatomic,strong) AuthenBaseView *cellV3;
@property (nonatomic,strong) LineLabel *line3;
@property (nonatomic,strong) AuthenBaseView *cellV4;
@property (nonatomic,strong) LineLabel *line4;
@property (nonatomic,strong) AuthenBaseView *cellV5;
@property (nonatomic,strong) LineLabel *line5;
@property (nonatomic,strong) BaseLabel *cellV6;

@property (nonatomic,assign) BOOL didSetupConstraints;

@end
