//
//  PaceViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/5.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "PaceViewController.h"
#import "PaceCell.h"

@interface PaceViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *paceTableView;

@end

@implementation PaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"处理进度";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.paceTableView];
}

- (UITableView *)paceTableView
{
    if (!_paceTableView) {
        _paceTableView = [[UITableView alloc] initWithFrame:CGRectMake(kSmallPadding, kSmallPadding, kScreenWidth-kSmallPadding*2, kScreenHeight-kNavHeight-kSmallPadding) style:UITableViewStylePlain];
        _paceTableView.delegate = self;
        _paceTableView.dataSource = self;
        _paceTableView.backgroundColor = kBackColor;
        _paceTableView.tableFooterView = [[UIView alloc] init];
    }
    return _paceTableView;
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"pace";
    PaceCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[PaceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

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
