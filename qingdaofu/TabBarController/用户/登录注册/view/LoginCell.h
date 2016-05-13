//
//  LoginCell.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/11.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginCell : UITableViewCell

@property (nonatomic,strong) UITextField *loginTextField;
@property (nonatomic,strong) UIButton *loginButton;

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) NSLayoutConstraint *topConstraint;

- (void)changePlaceholderColor:(NSString *)placeholder;

@end
