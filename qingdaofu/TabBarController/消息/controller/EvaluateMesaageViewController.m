//
//  EvaluateMesaageViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/27.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "EvaluateMesaageViewController.h"

#import "TopSwitchView.h"

@interface EvaluateMesaageViewController ()

@property (nonatomic,assign) BOOL didSetupconstraints;
@property (nonatomic,strong) TopSwitchView *topSwitchView;

@end

@implementation EvaluateMesaageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"评价消息";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.view.backgroundColor = kBackColor;
    
    [self.view addSubview:self.topSwitchView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupconstraints) {
        [self.topSwitchView autoPinEdgeToSuperviewMargin:ALEdgeTop];
        [self.topSwitchView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.topSwitchView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.topSwitchView autoSetDimension:ALDimensionHeight toSize:50];
        
        self.didSetupconstraints = YES;
    }
    
    [super updateViewConstraints];
}

- (TopSwitchView *)topSwitchView
{
    if (!_topSwitchView) {
        _topSwitchView = [TopSwitchView newAutoLayoutView];
        _topSwitchView.backgroundColor = [UIColor whiteColor];
    }
    return _topSwitchView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
