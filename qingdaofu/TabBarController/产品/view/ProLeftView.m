//
//  ProLeftView.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/13.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ProLeftView.h"



@implementation ProLeftView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
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
    return 9;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"left";
    MyStoreCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MyStoreCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *titleArr = @[@"还款方式",@"担保方式",@"担保物所在地",@"司法现状",@"债务人主体",@"委托事项",@"委托期限",@"代理费用",@"付款方式"];
    [cell.sButton1 setTitle:titleArr[indexPath.row] forState:0];
    [cell.sButton2 setTitle:@"服务器数据" forState:0];
    [cell.sButton2 setTitleColor:kBlueColor forState:0];
    
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
