//
//  AuthenPersonViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/28.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AuthenPersonViewController.h"

#import "TakePictureCell.h"
#import "ReportFinanceCell.h"
#import "EditDebtAddressCell.h"
#import "BaseCommitButton.h"

#import "UIView+UITextColor.h"


@interface AuthenPersonViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UITableView *personAuTableView;
@property (nonatomic,strong) BaseCommitButton *personAuCommitButton;

@end

@implementation AuthenPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"认证个人";
    self.navigationItem.leftBarButtonItem = self.leftItem;

    [self.view addSubview:self.personAuTableView];
    [self.view addSubview:self.personAuCommitButton];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.personAuTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.personAuTableView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kTabBarHeight];
        
        [self.personAuCommitButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.personAuCommitButton autoSetDimension:ALDimensionHeight toSize:kTabBarHeight];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)personAuTableView
{
    if (!_personAuTableView) {
        _personAuTableView = [UITableView newAutoLayoutView];
        _personAuTableView.translatesAutoresizingMaskIntoConstraints = YES;
        _personAuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        _personAuTableView.delegate = self;
        _personAuTableView.dataSource = self;
        _personAuTableView.tableFooterView = [[UIView alloc] init];
        _personAuTableView.separatorColor = kSeparateColor;
    }
    return _personAuTableView;
}

- (BaseCommitButton *)personAuCommitButton
{
    if (!_personAuCommitButton) {
        _personAuCommitButton = [BaseCommitButton newAutoLayoutView];
        [_personAuCommitButton setTitle:@"立即认证" forState:0];
    }
    return _personAuCommitButton;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 4;
    }
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80;
    }else if (indexPath.section == 2){
        if (indexPath.row == 2) {
            return 70;
        }
    }
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    
    if (indexPath.section ==0) {
        identifier = @"authenPer0";
        TakePictureCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[TakePictureCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.pictureButton1 setImage:[UIImage imageNamed:@"btn_camera"] forState:0];
        [cell.pictureButton1 addTarget:self action:@selector(showActionSheet) forControlEvents:UIControlEventTouchUpInside];
        [cell.pictureButton2 setImage:[UIImage imageNamed:@"btn_camera"] forState:0];
        [cell.pictureButton2 addTarget:self action:@selector(showActionSheet) forControlEvents:UIControlEventTouchUpInside];
        return cell;
        
    }else if (indexPath.section == 1){
        identifier = @"authenPer1";
        ReportFinanceCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[ReportFinanceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSArray *perTextArray = @[@"|  基本信息",@"姓名",@"身份证",@"联系方式"];
        NSArray *perPlacaTextArray = @[@"",@"请输入您的姓名",@"请输入您的身份证号码",@"请输入您常用的手机号码"];
        
        cell.leftTextFieldConstraits.constant = 100;
        cell.fiLabel.text = perTextArray[indexPath.row];
        cell.fiTextField.placeholder = perPlacaTextArray[indexPath.row];
        cell.fiTextField.font = kFirstFont;
        
        if (indexPath.row == 0) {
            cell.fiLabel.textColor = kBlueColor;
            cell.fiTextField.userInteractionEnabled = NO;
        }
        
        return cell;
    }else{
    
        if (indexPath.row <2) {
            identifier = @"authenPer2";
            
            ReportFinanceCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (!cell) {
                cell = [[ReportFinanceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            NSArray *perTesArray = @[@"补充信息",@"邮箱"];
            NSArray *perHolderArray = @[@"",@"请输入您常用邮箱"];
            
            cell.leftTextFieldConstraits.constant = 95;
            cell.fiLabel.text = perTesArray[indexPath.row];
            cell.fiTextField.placeholder = perHolderArray[indexPath.row];
            cell.fiTextField.font = kFirstFont;
            
            if (indexPath.row == 0) {
                cell.fiTextField.userInteractionEnabled = NO;
                NSMutableAttributedString *ttt = [cell.fiTextField setAttributeString:@"|  补充信息  " withColor:kBlueColor andSecond:@"(选填)" withColor:kLightGrayColor withFont:12];
                [cell.fiLabel setAttributedText:ttt];
            }
            
            return cell;
        }
        
        identifier = @"authenPer3";
        
        EditDebtAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[EditDebtAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.ediLabel.text = @"经典案例";
        cell.ediTextView.placeholder = @"关于个人在融资等方面的成功案例，有利于发布方更加青睐你";
        cell.ediTextView.font = kFirstFont;
        return cell;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 25;
    }
    
    return kBigPadding;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section > 1) {
        return kBigPadding;
    }
    return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UILabel *headerView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 25)];
        headerView.textAlignment = NSTextAlignmentCenter;

        NSString *str1 = @"上传验证身份证件照或名片图片";
        NSString *str2 = @"（选填）";
        NSString *str3 = [NSString stringWithFormat:@"%@%@",str1,str2];
        
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:str3];
        
        [attributeStr setAttributes:@{NSForegroundColorAttributeName:kGrayColor} range:NSMakeRange(0, str1.length)];
        [attributeStr setAttributes:@{NSForegroundColorAttributeName:kBlackColor} range:NSMakeRange(str1.length, str2.length)];
        
        [headerView setAttributedText:attributeStr];
        headerView.font = kSecondFont;
        return headerView;
    }
    return nil;
}

#pragma mark - alertView
- (void)showActionSheet
{
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"拍照");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"相册");
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [actionSheetController addAction:action1];
    [actionSheetController addAction:action2];
    [actionSheetController addAction:action3];
    
    [self presentViewController:actionSheetController animated:YES completion:nil];
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
