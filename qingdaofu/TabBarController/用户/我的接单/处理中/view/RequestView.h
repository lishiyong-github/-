//
//  RequestView.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestView : UIView<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UILabel *label;

@property (nonatomic,assign) BOOL didSetupConstraints;

@end
