//
//  CompleteCell.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/19.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompletePhotoView.h"
#import "EditDebtAddressCell.h"

@interface CompleteCell : UITableViewCell

@property (nonatomic,strong) UILabel *comNameLabel;
@property (nonatomic,strong) UILabel *comIDLabel;
@property (nonatomic,strong) CompletePhotoView *comPhotoView;
@property (nonatomic,strong) UILabel *comMailLabel;
@property (nonatomic,strong) UILabel *comExampleLabel;
@property (nonatomic,strong) UILabel *comExampleLabel2;

@property (nonatomic,strong) UIButton *comImageButton;

@property (nonatomic,assign) BOOL didSetupConstraints;

@end
