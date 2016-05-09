//
//  AuthenPersonViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/28.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "AuthenPersonViewController.h"

#import "AuthenBaseView.h"
#import "TakePictureView.h"

@interface AuthenPersonViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (nonatomic,strong) UITableView *personAuTableView;

@property (nonatomic,strong) TakePictureView *pictureButton1;
@property (nonatomic,strong) TakePictureView *pictureButton2;
@property (nonatomic,strong) AuthenBaseView *baseView1;
@property (nonatomic,strong) AuthenBaseView *baseView2;
@property (nonatomic,strong) AuthenBaseView *baseView3;
@property (nonatomic,strong) AuthenBaseView *baseView4;
@property (nonatomic,strong) AuthenBaseView *baseView5;
@property (nonatomic,strong) AuthenBaseView *baseView6;
@property (nonatomic,strong) AuthenBaseView *baseView7;

@end

@implementation AuthenPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"认证个人";
    self.navigationItem.leftBarButtonItem = self.leftItem;

    [self.view addSubview:self.personAuTableView];
}

- (UITableView *)personAuTableView
{
    if (!_personAuTableView) {
        _personAuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStyleGrouped];
        _personAuTableView.delegate = self;
        _personAuTableView.dataSource = self;
        _personAuTableView.tableFooterView = [[UIView alloc] init];
        _personAuTableView.separatorColor = kSeparateColor;
    }
    return _personAuTableView;
}

- (TakePictureView *)pictureButton1
{
    if (!_pictureButton1) {
        _pictureButton1 = [[TakePictureView alloc] initWithFrame:CGRectMake(kBigPadding, kBigPadding, 50, 50)];
        [_pictureButton1.button setImage:[UIImage imageNamed:@"btn_camera"] forState:0];
        [_pictureButton1.button addTarget:self action:@selector(showActionSheet) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pictureButton1;
}

- (TakePictureView *)pictureButton2
{
    if (!_pictureButton2) {
        _pictureButton2 = [[TakePictureView alloc] initWithFrame:CGRectMake(self.pictureButton1.right + kBigPadding, self.pictureButton1.top, self.pictureButton1.width, self.pictureButton1.height)];
        [_pictureButton2.button setImage:[UIImage imageNamed:@"btn_camera"] forState:0];
        [_pictureButton2.button addTarget:self action:@selector(showActionSheet) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pictureButton2;
}

- (AuthenBaseView *)baseView1
{
    if (!_baseView1) {
        _baseView1 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, _baseView1.aH)];
        
        _baseView1.label.text = @"|  基本信息";
        _baseView1.label.textColor = kBlueColor;
        _baseView1.textField.userInteractionEnabled = NO;
    }
    return _baseView1;
}

- (AuthenBaseView *)baseView2
{
    if (!_baseView2) {
        _baseView2 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _baseView2.label.text = @"姓名";
        _baseView2.textField.placeholder = @"请输入您的姓名";
    }
    return _baseView2;
}
- (AuthenBaseView *)baseView3
{
    if (!_baseView3) {
        _baseView3 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
       _baseView3.label.text = @"身份证";
        _baseView3.textField.placeholder = @"请输入您的身份证号码";
    }
    return _baseView3;
}
- (AuthenBaseView *)baseView4
{
    if (!_baseView4) {
        _baseView4 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _baseView4.label.text = @"联系方式";
        _baseView4.textField.placeholder = @"12345678900";
    }
    return _baseView4;
}
- (AuthenBaseView *)baseView5
{
    if (!_baseView5) {
        _baseView5 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _baseView5.label.textColor = kBlueColor;
        NSString *str1 = @"|  补充信息";
        NSString *str2 = @"（选填）";
        NSString *str = [NSString stringWithFormat:@"%@%@",str1,str2];
        
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:str];
        
        [attributeStr addAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor,NSFontAttributeName:kBigFont} range:NSMakeRange(0, str1.length)];
        [attributeStr addAttributes:@{NSForegroundColorAttributeName:kBlackColor,NSFontAttributeName:kSecondFont} range:NSMakeRange(str1.length, str2.length)];
        [_baseView5.label setAttributedText:attributeStr];
        
        _baseView5.textField.placeholder = @"";
        _baseView5.textField.userInteractionEnabled = NO;
    }
    return _baseView5;
}
- (AuthenBaseView *)baseView6
{
    if (!_baseView6) {
        _baseView6 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
       _baseView6.label.text = @"邮箱";
        _baseView6.textField.placeholder = @"请输入您的常用邮箱";
    }
    return _baseView6;
}
- (AuthenBaseView *)baseView7
{
    if (!_baseView7) {
        _baseView7 = [[AuthenBaseView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCellHeight)];
        _baseView7.label.text = @"经典案例";
        _baseView7.textField.placeholder = @"关于个人在融资等方面的成功案例，有利于";
    }
    return _baseView7;
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
    }
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"personAu";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        [cell addSubview:self.pictureButton1];
        [cell addSubview:self.pictureButton2];
    }else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [cell addSubview:self.baseView1];
        }else if (indexPath.row == 1){
            [cell addSubview:self.baseView2];
        }else if (indexPath.row == 2){
            [cell addSubview:self.baseView3];
        }else{
            [cell addSubview:self.baseView4];
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            [cell addSubview:self.baseView5];
        }else if (indexPath.row == 1){
            [cell addSubview:self.baseView6];
        }else{
            [cell addSubview:self.baseView7];
        }
    }
    
    return cell;
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
