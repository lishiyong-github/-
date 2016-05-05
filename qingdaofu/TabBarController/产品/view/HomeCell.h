//
//  HomeCell.h
//  qingdaofu
//
//  Created by zhixiang on 16/4/28.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewProView.h"

@interface HomeCell : UITableViewCell

@property (nonatomic,strong) UILabel *lineLabel;
@property (nonatomic,strong) NewProView *cellView;

+(instancetype)cellWithTableView:(UITableView *)tableView;


@end
