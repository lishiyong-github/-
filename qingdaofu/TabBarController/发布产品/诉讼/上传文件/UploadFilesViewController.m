//
//  UploadFilesViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/11.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "UploadFilesViewController.h"

#import "UIButton+Addition.h"

@interface UploadFilesViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *uploadTableView;
@property (nonatomic,assign) BOOL didSetupConstraints;

@end

@implementation UploadFilesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"上传债权文件";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    [self.view addSubview:self.uploadTableView];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.uploadTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)uploadTableView
{
    if (!_uploadTableView) {
        _uploadTableView = [UITableView newAutoLayoutView];
        _uploadTableView.delegate = self;
        _uploadTableView.dataSource = self;
        _uploadTableView.tableFooterView = [[UIView alloc] init];
        _uploadTableView.separatorColor = kSeparateColor;
        _uploadTableView.backgroundColor = kBackColor;
        _uploadTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
        _uploadTableView.separatorInset = UIEdgeInsetsMake(0, kBigPadding, 0, 0);
    }
    return _uploadTableView;
}

#pragma makr - tableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"upload";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *arr1 = @[@"bond_icon_certificate",@"bond_icon_contract",@"bond_icon_warrants",@"bond_icon_voucher",@"bond_icon_receipt",@"bond_icon_repayment"];
    NSArray *arr2 = @[@"公证书",@"借款合同",@"他项权证",@"收款凭证",@"收据",@"还款凭证"];
    cell.imageView.image = [UIImage imageNamed:arr1[indexPath.row]];
    cell.textLabel.text = arr2[indexPath.row];
    cell.textLabel.font = kBigFont;
    cell.textLabel.textColor = kBlackColor;
    
    UIButton *actButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, kCellHeight)];
    [actButton swapImage];
    [actButton setTitle:@"上传" forState:0];
    [actButton setTitleColor:kBlueColor forState:0];
    [actButton setImage:[UIImage imageNamed:@"list_more"] forState:0];
    actButton.titleLabel.font = kSecondFont;
    cell.accessoryView = actButton;
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
