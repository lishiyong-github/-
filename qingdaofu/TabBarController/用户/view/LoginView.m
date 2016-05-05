//
//  LoginView.m
//  qingdaofu
//
//  Created by zhixiang on 16/4/27.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *loginTableView;

@end

@implementation LoginView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.loginTableView];
    }
    return self;
}

- (UITableView *)loginTableView
{
    if (!_loginTableView) {
        _loginTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavHeight-kTabBarHeight) style:UITableViewStyleGrouped];
        _loginTableView.delegate = self;
        _loginTableView.dataSource = self;
        _loginTableView.tableFooterView = [[UIView alloc] init];
        _loginTableView.backgroundColor = kBackColor;
        _loginTableView.separatorColor = kSeparateColor;
    }
    return _loginTableView;
}

- (BaseLabel *)sectionView0
{
    if (!_sectionView0) {
        _sectionView0 = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, _sectionView0.aH)];
        _sectionView0.nameLabel.text = @"12345678900";
        _sectionView0.tagImageView.backgroundColor = kYellowColor;
        [_sectionView0.tButton setTitle:@"已认证公司  " forState:0];
    }
    return _sectionView0;
}

- (MineView *)sectionView1
{
    if (!_sectionView1) {
        _sectionView1 = [[MineView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, _sectionView1.aH)];
        _sectionView1.topLabel.nameLabel.text = @"我的发布";
        _sectionView1.button1.label1.text = @"已发布";
        QDFWeakSelf;
        [_sectionView1.topLabel.tButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedButton) {
                weakself.didSelectedButton(10);
            }
        }];
        [_sectionView1.button1 addAction:^(UIButton *btn) {
            if (weakself.didSelectedButton) {
                weakself.didSelectedButton(11);
            }
        }];
        [_sectionView1.button2 addAction:^(UIButton *btn) {
            if (weakself.didSelectedButton) {
                weakself.didSelectedButton(12);
            }
        }];
        [_sectionView1.button3 addAction:^(UIButton *btn) {
            if (weakself.didSelectedButton) {
                weakself.didSelectedButton(13);
            }
        }];
        [_sectionView1.button4 addAction:^(UIButton *btn) {
            if (weakself.didSelectedButton) {
                weakself.didSelectedButton(14);
            }
        }];
        
        }
    return _sectionView1;
}

- (MineView *)sectionView2
{
    if (!_sectionView2) {
        _sectionView2 = [[MineView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, _sectionView2.aH)];
        _sectionView2.topLabel.nameLabel.text = @"我的接单";
        _sectionView2.button1.label1.text = @"申请中";
        
        QDFWeakSelf;
        [_sectionView2.topLabel.tButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedButton) {
                weakself.didSelectedButton(20);
            }
        }];
        [_sectionView2.button1 addAction:^(UIButton *btn) {
            if (weakself.didSelectedButton) {
                weakself.didSelectedButton(21);
            }
        }];
        [_sectionView2.button2 addAction:^(UIButton *btn) {
            if (weakself.didSelectedButton) {
                weakself.didSelectedButton(22);
            }
        }];
        [_sectionView2.button3 addAction:^(UIButton *btn) {
            if (weakself.didSelectedButton) {
                weakself.didSelectedButton(23);
            }
        }];
        [_sectionView2.button4 addAction:^(UIButton *btn) {
            if (weakself.didSelectedButton) {
                weakself.didSelectedButton(24);
            }
        }];
    }
    return _sectionView2;
}

#pragma mark - tableView delegate and dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3) {
        return 2;
    }
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 || indexPath.section == 2) {
        return self.sectionView1.aH;
    }
    return self.sectionView0.aH;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"login";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = kBigFont;
    cell.imageView.frame = CGRectMake(0, 0, 21, 21);
    [cell setSeparatorInset:UIEdgeInsetsMake(0, kBigPadding, 0, 0)];
    
    if (indexPath.section == 0) {//认证
        [cell addSubview:self.sectionView0];
    }else if(indexPath.section == 1){//我的发布
        [cell addSubview:self.sectionView1];
    }else if (indexPath.section == 2){//我的接单
        [cell addSubview:self.sectionView2];
    }else if (indexPath.section == 3){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        NSArray *imageArr = @[@"list_icon_preservation",@"list_icon_collection"];
        NSArray *textArr = @[@"我的保存",@"我的收藏"];
        cell.imageView.image = [UIImage imageNamed:imageArr[indexPath.row]];

        cell.textLabel.text = textArr[indexPath.row];
    }else{//设置
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        cell.imageView.image = [UIImage imageNamed:@"list_icon_setting"];
        cell.textLabel.text = @"设置";
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kBigPadding;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = kBackColor;
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didSelectedIndex) {
        self.didSelectedIndex(indexPath);
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
