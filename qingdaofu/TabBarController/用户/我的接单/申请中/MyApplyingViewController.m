//
//  MyApplyingViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/4.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyApplyingViewController.h"
#import "CheckDetailPublishViewController.h"  //查看发布方

//#import "BidZeroCell.h"
//#import "BidCell.h"
//#import "BidSingleCell.h"

@interface MyApplyingViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyApplyingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"查看发布方" style:UIBarButtonItemStylePlain target:self action:@selector(checkDetail)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview:self.myApplyingTableView];
}

- (void)checkDetail
{
    CheckDetailPublishViewController *checkDetailPublishVC = [[CheckDetailPublishViewController alloc] init];
    [self.navigationController pushViewController:checkDetailPublishVC animated:YES];
}

#pragma mark - setter and getter
- (UITableView *)myApplyingTableView
{
    if (!_myApplyingTableView) {
        _myApplyingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStyleGrouped];
        _myApplyingTableView.delegate = self;
        _myApplyingTableView.dataSource = self;
    }
    return _myApplyingTableView;
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

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"sess0";
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
        identifier = @"sess1";
        BidCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = [[BidCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSArray *secImageArray = @[@"conserve_investment_icon",@"conserve_loan_icon",@"conserve_interest_icon",@"conserve_rebate_icon"];
        cell.cellView2.imageView1.image = [UIImage imageNamed:secImageArray[0]];
        cell.cellView3.imageView1.image = [UIImage imageNamed:secImageArray[1]];
        cell.cellView4.imageView1.image = [UIImage imageNamed:secImageArray[2]];
        cell.cellView5.imageView1.image = [UIImage imageNamed:secImageArray[3]];
        
        return cell;
    }
    identifier = @"sess2";
    
    BidSingleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[BidSingleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
 
 */

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kSmallPadding;
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
