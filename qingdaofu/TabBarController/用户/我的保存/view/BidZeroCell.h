//
//  BidZeroCell.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/11.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthenBaseView.h"

@interface BidZeroCell : UITableViewCell

@property (nonatomic,strong) AuthenBaseView *bigProView;

@property (nonatomic,assign) BOOL didSetupConstraints;

@end
