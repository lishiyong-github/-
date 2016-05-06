//
//  MyClosingViewController.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "BaseViewController.h"
#import "AuthenBaseView.h"
#import "BidSingleView.h"
#import "BidCellView.h"
#import "MyOrderDetailView.h"
#import "BaseCommitButton.h"

@interface MyClosingViewController : BaseViewController

@property (nonatomic,strong) AuthenBaseView *secView0;
@property (nonatomic,strong) BidCellView *secView1;
@property (nonatomic,strong) BidSingleView *secView2;
@property (nonatomic,strong) MyOrderDetailView *secView3;
@property (nonatomic,strong) UIView *secView4;

@property (nonatomic,strong) BaseCommitButton *additionalEvalateButton;

@end
