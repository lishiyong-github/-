//
//  CompleteViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/28.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "CompleteViewController.h"
#import "AuthenPersonViewController.h"  //认证个人

#import "MineUserCell.h"
#import "CompleteCell.h"
#import "AuthenBaseView.h"
#import "BaseCommitButton.h"

#import "UIView+UITextColor.h"

#define string @"不得不崩更多活动活动吧动荡不定活动和很多很多是实话实说会实话实说我咕咚咕咚沟通"

@interface CompleteViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *completeTableView;
@property (nonatomic,strong) BaseCommitButton *completeCommitButton;
@property (nonatomic,strong) AuthenBaseView *comFootView;

@end

@implementation CompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人信息";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_tip"] style:UIBarButtonItemStylePlain target:self action:@selector(showRemindMessage)];
    
    [self.view addSubview:self.completeTableView];
    [self.view addSubview:self.completeCommitButton];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.completeTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.completeTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTabBarHeight];
        
        [self.completeCommitButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.completeCommitButton autoSetDimension:ALDimensionHeight toSize:kTabBarHeight];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)completeTableView
{
    if (!_completeTableView) {
        _completeTableView = [UITableView newAutoLayoutView];
        _completeTableView.delegate = self;
        _completeTableView.dataSource = self;
        _completeTableView.backgroundColor = kBackColor;
        _completeTableView.separatorInset = UIEdgeInsetsZero;
        _completeTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
        _completeTableView.tableFooterView = self.comFootView;
    }
    return _completeTableView;
}

- (BaseCommitButton *)completeCommitButton
{
    if (!_completeCommitButton) {
        _completeCommitButton = [BaseCommitButton newAutoLayoutView];
        [_completeCommitButton setTitle:@"修改认证" forState:0];
    }
    return _completeCommitButton;
}

- (AuthenBaseView *)comFootView
{
    if (!_comFootView) {
        _comFootView = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
        _comFootView.label.text = @"在您未发布及未接单前，您可以根据实际需要，修改您的身份认证";
        _comFootView.label.textColor = kLightGrayColor;
        _comFootView.label.font = kSecondFont;
    }
    return _comFootView;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return kCellHeight;
    }
    
    CGSize titleSize = [string boundingRectWithSize:CGSizeMake(kScreenWidth*0.5, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kFirstFont} context:nil].size;

    return 195 + titleSize.height ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    if (indexPath.row == 0) {
        identifier = @"complete0";
        MineUserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[MineUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell.userNameButton setTitle:@"|  认证信息" forState:0];
        [cell.userNameButton setTitleColor:kBlueColor forState:0];
        
        [cell.userActionButton setTitle:@"编辑" forState:0];
        [cell.userActionButton setTitleColor:kBlueColor forState:0];
        cell.userActionButton .titleLabel.font = kFirstFont;
        
        return cell;
    }
    identifier = @"complete1";
    CompleteCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[CompleteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSMutableAttributedString *nameString = [cell.comNameLabel setAttributeString:@"姓名：            " withColor:kBlackColor andSecond:@"潘潘潘" withColor:kLightGrayColor withFont:14];
    [cell.comNameLabel setAttributedText:nameString];
    
    NSMutableAttributedString *IDString = [cell.comIDLabel setAttributeString:@"身份证号码：" withColor:kBlackColor andSecond:@"1234567777777777777" withColor:kLightGrayColor withFont:14];
    [cell.comIDLabel setAttributedText:IDString];

    NSMutableAttributedString *mailString = [cell.comMailLabel setAttributeString:@"邮箱：            " withColor:kBlackColor andSecond:@"1234444444@qq.com" withColor:kLightGrayColor withFont:14];
    [cell.comMailLabel setAttributedText:mailString];

    cell.comExampleLabel.text = @"经典案例：   ";
    cell.comExampleLabel2.text = string;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}


#pragma mark - method
- (void)showRemindMessage
{
    NSLog(@"可发布融资催收诉讼");

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
