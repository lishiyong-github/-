//
//  AdditionMessageViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/5.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AdditionMessageViewController.h"
#import "BaseLabel.h"
#import "AuthenBaseView.h"

#import "MyStoreCell.h"

@interface AdditionMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *addMessageTableView;

@end

@implementation AdditionMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"补充信息";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveMessage)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kFirstFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview:self.addMessageTableView];
    [self.view setNeedsUpdateConstraints];
}

- (void)saveMessage
{
    
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.addMessageTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)addMessageTableView
{
    if (!_addMessageTableView) {
        _addMessageTableView = [UITableView newAutoLayoutView];
        _addMessageTableView.backgroundColor = kBackColor;
        _addMessageTableView.delegate = self;
        _addMessageTableView.dataSource = self;
        _addMessageTableView.tableFooterView = [[UIView alloc] init];
        _addMessageTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kSmallPadding)];
    }
    return _addMessageTableView;
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"additionMessage";
    
    MyStoreCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[MyStoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSArray *tArray = @[@"抵押物类型",@"状态",@"抵押状况",@"借款人年龄",@"权利人年龄"];
    [cell.sButton1 setTitle:tArray[indexPath.row] forState:0];
    [cell.sButton2 setImage:[UIImage imageNamed:@"list_more"] forState:0];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
