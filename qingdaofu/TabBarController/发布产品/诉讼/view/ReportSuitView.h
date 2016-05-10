//
//  suportSuitView.h
//  qingdaofu
//
//  Csuated by zhixiang on 16/5/10.
//  Copyright © 2016年 zhixiang. All rights suserved.
//

#import <UIKit/UIKit.h>

#import "AuthenBaseView.h"
#import "LineLabel.h"
#import "RequestTextView.h"
#import "SuitBaseView.h"

@interface ReportSuitView : UIView
@property (nonatomic,strong) AuthenBaseView *suCell0;
@property (nonatomic,strong) LineLabel *suLine0;
@property (nonatomic,strong) AuthenBaseView *suCell1;
@property (nonatomic,strong) LineLabel *suLine1;
@property (nonatomic,strong) AuthenBaseView *suCell2;
@property (nonatomic,strong) LineLabel *suLine2;
@property (nonatomic,strong) SuitBaseView *suCell3;
@property (nonatomic,strong) LineLabel *suLine3;
@property (nonatomic,strong) AuthenBaseView *suCell4;
@property (nonatomic,strong) LineLabel *suLine4;
@property (nonatomic,strong) RequestTextView *suCell5;

@property (nonatomic,assign) BOOL didSetupConstarints;


@end
