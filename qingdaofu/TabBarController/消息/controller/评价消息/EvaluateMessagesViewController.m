//
//  EvaluateMessagesViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/6.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "EvaluateMessagesViewController.h"
#import "MyClosingViewController.h"   //产品详情

#import "EvaTopSwitchView.h"
#import "EvaluateCell.h"
#import "EvaluatePhotoCell.h"

#import "EvaluateSendCell.h"  //发出评价

@interface EvaluateMessagesViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) EvaTopSwitchView *evaTopSwitchView;
@property (nonatomic,strong) UITableView *evaluateTableView;

@property (nonatomic,strong) NSString *tagString;
@property (nonatomic,strong) NSMutableArray *dataList;

@end

@implementation EvaluateMessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"评价消息";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.evaTopSwitchView];
    [self.view addSubview:self.evaluateTableView];
    
    _tagString = @"get";
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.evaTopSwitchView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.evaTopSwitchView autoSetDimension:ALDimensionHeight toSize:40];
        
        [self.evaluateTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.evaluateTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.evaTopSwitchView];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (EvaTopSwitchView *)evaTopSwitchView
{
    if (!_evaTopSwitchView) {
        _evaTopSwitchView = [EvaTopSwitchView newAutoLayoutView];
        _evaTopSwitchView.backgroundColor = kNavColor;
        [_evaTopSwitchView.getbutton setTitle:@"收到的评价" forState:0];
        [_evaTopSwitchView.sendButton setTitle:@"发出的评价" forState:0];
        
        QDFWeakSelf;
        [_evaTopSwitchView setDidSelectedButton:^(NSInteger buttonTag) {
            if (buttonTag == 33) {//收到的
                _tagString = @"get";
                [weakself.evaluateTableView reloadData];
                
            }else{//发出的
                _tagString = @"send";
                [weakself.evaluateTableView reloadData];

            }
        }];
    }
    return _evaTopSwitchView;
}

- (UITableView *)evaluateTableView
{
    if (!_evaluateTableView) {
        _evaluateTableView = [UITableView newAutoLayoutView];
        _evaluateTableView.translatesAutoresizingMaskIntoConstraints = YES;
        _evaluateTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _evaluateTableView.delegate = self;
        _evaluateTableView.dataSource = self;
        _evaluateTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
        _evaluateTableView.backgroundColor = kBackColor;
    }
    return _evaluateTableView;
}

- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"", nil];
    }
    return _dataList;
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([_tagString isEqualToString:@"get"]) {
        return 10;
    }
    return self.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_tagString isEqualToString:@"send"]) {
        return 265;
    }
    
    return 165;
    
    //（收到）
//    return 165;//无image
//    return 225;//有image
    
    //（ 发出）
//    return 205;   //无image
//    return 265;   //有image
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    if ([_tagString isEqualToString:@"get"]) {
        identifier = @"get";
        EvaluateCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[EvaluateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.evaNameLabel.text = @"12345678900";
        cell.evaTimeLabel.text = @"2016-10-10";
        [cell.evaStarImageView setBackgroundColor:kBlueColor];
        cell.evaTextLabel.text = @"还行，还行，还行";
        [cell.evaInnnerButton setImage:[UIImage imageNamed:@"list_financing"] forState:0];
        [cell.evaInnnerButton setTitle:@"RZ201605200001" forState:0];
        
        return cell;
    }
    
    identifier = @"send";
    EvaluateSendCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[EvaluateSendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.evaNameLabel.text = @"12345678900";
    cell.evaTimeLabel.text = @"2016-09-09";
    [cell.evaStarImageView setBackgroundColor:kBlueColor];
    cell.evaTextLabel.text = @"还行，还不错，挺满意的";
    [cell.evaProImageView1 setBackgroundColor:kLightGrayColor];
    [cell.evaProImageView2 setBackgroundColor:kLightGrayColor];
    [cell.evaInnnerButton setImage:[UIImage imageNamed:@"list_financing"] forState:0];
    [cell.evaInnnerButton setTitle:@"RZ201605200001" forState:0];
    
    QDFWeakSelf;
    [cell.evaProductButton addAction:^(UIButton *btn) {
        MyClosingViewController *myClosingVc = [[MyClosingViewController alloc] init];
        [weakself.navigationController pushViewController:myClosingVc animated:YES];
    }];
    
    [cell.evaDeleteButton addAction:^(UIButton *btn) {
        
        NSIndexSet *deleteIndexSet = [NSIndexSet indexSetWithIndex:indexPath.section];
        [weakself.dataList removeObjectAtIndex:indexPath.section];
        [weakself deleteSections:deleteIndexSet withRowAnimation:UITableViewRowAnimationFade];
        
//        [self.dataList removeObjectAtIndex:indexPath.section];
//         [self.evaluateTableView reloadData];
        
        
//        NSIndexSet *deleteIndexSet = [NSIndexSet indexSetWithIndex:indexPath.section];
//        [self.dataList removeObjectAtIndex:indexPath.section];
//        [self.evaluateTableView beginUpdates];
//        [self.evaluateTableView deleteSections:deleteIndexSet withRowAnimation:UITableViewRowAnimationFade];
//        [self.evaluateTableView endUpdates];
        }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kBigPadding;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (void)deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    [self.evaluateTableView reloadData];
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
