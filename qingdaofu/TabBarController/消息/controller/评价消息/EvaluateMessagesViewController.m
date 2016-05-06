//
//  EvaluateMessagesViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/6.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "EvaluateMessagesViewController.h"

#import "EvaTopSwitchView.h"

@interface EvaluateMessagesViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) EvaTopSwitchView *evaTopSwitchView;

@property (nonatomic,strong) UITableView *evaluateTableView;

@end

@implementation EvaluateMessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"评价消息";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.evaTopSwitchView];
//    [self.view addSubview:self.evaluateTableView];
}

- (EvaTopSwitchView *)evaTopSwitchView
{
    if (!_evaTopSwitchView) {
        _evaTopSwitchView = [[EvaTopSwitchView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        _evaTopSwitchView.backgroundColor = kNavColor;
        [_evaTopSwitchView.getbutton setTitle:@"收到的评价" forState:0];
        [_evaTopSwitchView.sendButton setTitle:@"发出的评价" forState:0];
    }
    return _evaTopSwitchView;
}

- (UITableView *)evaluateTableView
{
    if (!_evaluateTableView) {
        _evaluateTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.evaTopSwitchView.bottom, kScreenWidth, kScreenHeight-kNavHeight-kCellHeight) style:UITableViewStylePlain];
        _evaluateTableView.delegate = self;
        _evaluateTableView.dataSource = self;
        _evaluateTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _evaluateTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    }
    return _evaluateTableView;
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *identifier;
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
