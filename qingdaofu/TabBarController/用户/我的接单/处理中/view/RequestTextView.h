//
//  RequestTextView.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestTextView : UIView<UITextViewDelegate>

@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UILabel *remindLabel;

@property (nonatomic,assign) BOOL didSetupConstraits;

@end
