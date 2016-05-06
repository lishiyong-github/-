//
//  MyScheduleViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/5.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyScheduleViewController.h"
#import "RequestTextView.h"
#import "AuthenBaseView.h"

@interface MyScheduleViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *scheduleTableView;
@property (nonatomic,strong) RequestTextView *cell0;
@property (nonatomic,strong) AuthenBaseView *cell1;

@end

@implementation MyScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"填写进度";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kFirstFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview:self.scheduleTableView];
}

- (void)save
{
    
}

- (UITableView *)scheduleTableView
{
    if (!_scheduleTableView) {
        _scheduleTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStylePlain];
        _scheduleTableView.delegate = self;
        _scheduleTableView.dataSource = self;
        _scheduleTableView.tableFooterView = [[UIView alloc] init];
    }
    return _scheduleTableView;
}

- (RequestTextView *)cell0
{
    if (!_cell0) {
        _cell0 = [[RequestTextView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
        _cell0.remindLabel.text = @"请填写进度";
    }
    return _cell0;
}

- (AuthenBaseView *)cell1
{
    if (!_cell1) {
        _cell1 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _cell1.label.text = @"选择处置类型";
        _cell1.textField.userInteractionEnabled = NO;
        [_cell1.button setTitle:@">" forState:0];
    }
    return _cell1;
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 200;
    }
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"schedule";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0) {
        [cell addSubview:self.cell0];
    }else{
        [cell addSubview:self.cell1];
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
