//
//  MyApplyingViewController.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "BaseViewController.h"
#import "AuthenBaseView.h"
#import "BidSingleView.h"
#import "BidCellView.h"

@interface MyApplyingViewController : BaseViewController

@property (nonatomic,strong) UITableView *myApplyingTableView;
@property (nonatomic,strong) AuthenBaseView *secView0;
@property (nonatomic,strong) BidCellView *secView1;
@property (nonatomic,strong) BidSingleView *secView2;

@end
