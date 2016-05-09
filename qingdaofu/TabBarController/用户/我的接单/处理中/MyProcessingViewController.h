//
//  MyProcessingViewController.h
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

@interface MyProcessingViewController : BaseViewController

@property (nonatomic,strong) AuthenBaseView *secVie0;
@property (nonatomic,strong) BidCellView *secVie1;
@property (nonatomic,strong) BidSingleView *secVie2;
@property (nonatomic,strong) AuthenBaseView *secVie3;
@property (nonatomic,strong) MyOrderDetailView *secVie4;
@property (nonatomic,strong) AuthenBaseView *secVie5;

@end
