//
//  MyPublishingViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/6.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "MyPublishingViewController.h"
#import "AdditionMessageViewController.h"  //补充信息

#import "BidZeroCell.h"
#import "BidCell.h"
#import "BidSingleCell.h"

@interface MyPublishingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *publishingTableView;
//@property (nonatomic,strong) AuthenBaseView *sec0;
//@property (nonatomic,strong) BidCellView *sec1;
//@property (nonatomic,strong) BidSingleView *sec2;

@end

@implementation MyPublishingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品详情";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"申请记录" style:UIBarButtonItemStylePlain target:self action:@selector(showRecordList)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlueColor} forState:0];
    
    [self.view addSubview: self.publishingTableView];
}

- (void)showRecordList
{
    
}

- (UITableView *)publishingTableView
{
    if (!_publishingTableView) {
        _publishingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight) style:UITableViewStyleGrouped];
        _publishingTableView.delegate = self;
        _publishingTableView.dataSource = self;
        _publishingTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
    }
    return _publishingTableView;
}

#pragma mark -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
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
        identifier = @"sec0";
        BidZeroCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[BidZeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        cell.bigProView.backgroundColor = kBlueColor;
        
        cell.bigProView.label.text = @"产品编号：RZ201605030001";
        cell.bigProView.label.textColor = kNavColor;
        
        cell.bigProView.textField.userInteractionEnabled = NO;
        
        [cell.bigProView.button setTitle:@"发布中" forState:0];
        [cell.bigProView.button setTitleColor:[UIColor whiteColor] forState:0];
        
        return cell;
        
    }else if (indexPath.section == 1){
        identifier = @"sec1";
        BidCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[BidCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSArray *secImageArray = @[@"conserve_investment_icon",@"conserve_loan_icon",@"conserve_fixed_icon",@"conserve_rights_icon"];
        
        [cell.cellView2.imageView1 setImage:[UIImage imageNamed:secImageArray[0]]];
        [cell.cellView3.imageView1 setImage:[UIImage imageNamed:secImageArray[1]]];
        [cell.cellView4.imageView1 setImage:[UIImage imageNamed:secImageArray[2]]];
        [cell.cellView5.imageView1 setImage:[UIImage imageNamed:secImageArray[3]]];
        
        return cell;
    }
    
    identifier = @"sec2";
    BidSingleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[BidSingleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    QDFWeakSelf;
    [cell.cellView8 addAction:^(UIButton *btn) {
        AdditionMessageViewController *addtionMessageVC = [[AdditionMessageViewController alloc] init];
        [weakself.navigationController pushViewController:addtionMessageVC animated:YES];
    }];
    
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
