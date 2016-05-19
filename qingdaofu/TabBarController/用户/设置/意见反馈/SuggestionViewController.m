//
//  SuggestionViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/3.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "SuggestionViewController.h"

#import "EditDebtAddressCell.h"
#import "EditDebtCell.h"
#import "ReportFinanceCell.h"
#import "BaseCommitButton.h"

@interface SuggestionViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *suggestTableView;
@property (nonatomic,strong) BaseCommitButton *commitButton;

@end

@implementation SuggestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"意见反馈";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.suggestTableView];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.suggestTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)suggestTableView
{
    if (!_suggestTableView) {
        _suggestTableView = [UITableView newAutoLayoutView];
        _suggestTableView.translatesAutoresizingMaskIntoConstraints = YES;
        _suggestTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _suggestTableView.backgroundColor = kBackColor;
        _suggestTableView.delegate = self;
        _suggestTableView.dataSource = self;
        _suggestTableView.tableFooterView = [[UIView alloc] init];
    }
    return _suggestTableView;
}

- (BaseCommitButton *)commitButton
{
    if (!_commitButton) {
        _commitButton = [[BaseCommitButton alloc] initWithFrame:CGRectMake(kSmallPadding, kBigPadding, kScreenWidth-2*kBigPadding, 40)];
        [_commitButton setTitle:@"提交" forState:0];
        [_commitButton addAction:^(UIButton *btn) {
            NSLog(@"提交");
        }];
    }
    return _commitButton;
}

#pragma mark - tabelView delegate and dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80;
    }
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            identifier = @"suggest0";
            EditDebtAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cell) {
                cell = [[EditDebtAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftTextViewConstraints.constant = kBigPadding;
            cell.textHeightConstraint.constant = 70;
            cell.ediTextView.remindLabel.text = @"请详细描述您的问题或建议，您的反馈是我们前进最大的动力";
            
            return cell;
        }
        
        identifier = @"suggest01";
        EditDebtCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[EditDebtCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.editImageButton1.label setHidden:YES];
        [cell.editImageButton2.label setHidden:YES];

        return cell;
    }
    identifier = @"suggest1";
    ReportFinanceCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[ReportFinanceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.leftTextFieldConstraits.constant = kBigPadding;
    cell.fiTextField.placeholder = @"手机号码/邮箱（选填，方便我们联系您）";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return kBigPadding;
    }
    return 70;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 70)];
    footerView.backgroundColor = kBackColor;
    
    [footerView addSubview:self.commitButton];
    
    return footerView;
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
