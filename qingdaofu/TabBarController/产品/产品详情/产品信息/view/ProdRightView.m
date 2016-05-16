//
//  ProdRightView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/16.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ProdRightView.h"
#import "MyStoreCell.h"


@implementation ProdRightView


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = kBackColor;
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kBigPadding)];
        self.tableFooterView = [[UIView alloc] init];
    }
    return self;
}

#pragma mark - delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"proRight";
    MyStoreCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[MyStoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *tiArray = @[@"借款期限",@"还款方式",@"债务人主体",@"委托事项",@"委托代理期限",@"已付本金",@"已付利息",@"合同履行地",@"付款方式",@"债权文件",@"债权人信息",@"债务人信息"];
    [cell.sButton1 setTitle:tiArray[indexPath.row] forState:0];
    [cell.sButton2 setTitleColor:kBlueColor forState:0];
    [cell.sButton2 setTitle:@"服务器数据" forState:0];
    cell.sButton2.userInteractionEnabled = NO;
    
    if (indexPath.row > 8) {
        [cell.sButton2 setTitle:@"查看" forState:0];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 9) {
        if (self.didSelectedRow) {
            self.didSelectedRow(9);
        }
    }else if (indexPath.row == 10){
        if (self.didSelectedRow) {
            self.didSelectedRow(10);
        }
    }else if (indexPath.row == 11){
        if (self.didSelectedRow) {
            self.didSelectedRow(11);
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
