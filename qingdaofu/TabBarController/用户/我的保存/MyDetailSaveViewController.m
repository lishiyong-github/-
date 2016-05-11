//
//  MyDetailSaveViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/3.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyDetailSaveViewController.h"

#import "AuthenBaseView.h"
#import "CompletCellView.h"
#import "DetailView.h"
#import "DetailBaseView.h"
#import "BaseCommitButton.h"

#import "BidZeroCell.h"
#import "BidCell.h"
#import "BidSingleCell.h"

@interface MyDetailSaveViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UITableView *detailSaveTableView;
//@property (nonatomic,strong) AuthenBaseView *sectionView0;
//@property (nonatomic,strong) BidCellView *sectionView1;
//@property (nonatomic,strong) BidSingleView *sectionView2;

@property (nonatomic,strong) BaseCommitButton *footerView;

@end

@implementation MyDetailSaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit)];
    
    [self.view addSubview:self.detailSaveTableView];
    [self.view addSubview:self.footerView];
}

- (void)edit
{
    
}

- (UITableView *)detailSaveTableView
{
    if (!_detailSaveTableView) {
        _detailSaveTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStyleGrouped];
        _detailSaveTableView.delegate = self;
        _detailSaveTableView.dataSource = self;
        _detailSaveTableView.tableFooterView = [[UIView alloc] init];
        _detailSaveTableView.separatorColor = kSeparateColor;
    }
    return _detailSaveTableView;
}

- (BaseCommitButton *)footerView
{
    if (!_footerView) {
        _footerView = [[BaseCommitButton alloc] initWithFrame:CGRectMake(0, kScreenHeight-kNavHeight-kTabBarHeight, kScreenWidth, kTabBarHeight)];
        [_footerView setTitle:@"立即发布" forState:0];
    }
    return _footerView;
}

#pragma mark - tableView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return kCellHeight;
    }else if (indexPath.section == 1){
        return 5*kCellHeight + 2;
    }
    return 2*kCellHeight + 135 + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    
    if (indexPath.section == 0) {
        identifier = @"mmm";
        
        BidZeroCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[BidZeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]; 
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.bigProView.backgroundColor = kBlueColor;
        cell.bigProView.label.text = @"产品编号:";
        cell.bigProView.label.textColor = kNavColor;
        cell.bigProView.textField.text = @"RZ201605030001";
        cell.bigProView.textField.userInteractionEnabled = NO;
        cell.bigProView.textField.textColor = kNavColor;
        [cell.bigProView.button setTitle:@"待发布" forState:0];
        [cell.bigProView.button setTitleColor:kNavColor forState:0];
        
        return cell;
        
    }else if (indexPath.section == 1){
        identifier = @"nnn";
        BidCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[BidCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    identifier = @"ppp";
    BidSingleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[BidSingleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kBigPadding;
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
