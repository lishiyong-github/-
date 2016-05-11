//
//  LoginView.h
//  qingdaofu
//
//  Created by zhixiang on 16/4/27.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthenBaseView.h"
#import "BaseLabel.h"



@interface LoginView : UIView

@property (nonatomic,strong) BaseLabel *sectionView0;
//@property (nonatomic,strong) MineView *sectionView1;
//@property (nonatomic,strong) MineView *sectionView2;

@property (nonatomic,strong) void (^didSelectedIndex)(NSIndexPath*);
@property (nonatomic,strong) void (^didSelectedButton)(NSInteger);

@end
