//
//  ReportFinanceCell.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/17.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportFinanceCell : UITableViewCell

@property (nonatomic,strong) UILabel *fiLabel;
@property (nonatomic,strong) UITextField *fiTextField;
@property (nonatomic,strong) UIButton *fiButton;

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) NSLayoutConstraint *leftTextFieldConstraits;
@end
