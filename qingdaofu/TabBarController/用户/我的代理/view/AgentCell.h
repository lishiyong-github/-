//
//  AgentCell.h
//  qingdaofu
//
//  Created by zhixiang on 16/5/17.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgentCell : UITableViewCell

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UILabel *agentLabel;
@property (nonatomic,strong) UITextField *agentTextField;

@property (nonatomic,strong) NSLayoutConstraint *leftAgentContraints;

@end
