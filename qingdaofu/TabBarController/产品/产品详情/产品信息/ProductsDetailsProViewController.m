//
//  ProductsDetailsProViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/16.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "ProductsDetailsProViewController.h"

#import "DebtDocumnetsViewController.h"    //债权文件

#import "EvaTopSwitchView.h"
#import "ProdLeftView.h"
#import "ProdRightView.h"

@interface ProductsDetailsProViewController ()

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) EvaTopSwitchView *productsDeTopView;
@property (nonatomic,strong) ProdLeftView *leftTableView;
@property (nonatomic,strong) ProdRightView *rightTableView;


@end

@implementation ProductsDetailsProViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"产品信息";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"information_nav_remind"] style:UIBarButtonItemStylePlain target:self action:@selector(remindPublisher)];
    
    [self.view addSubview:self.productsDeTopView];
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];
    [self.rightTableView setHidden:YES];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)remindPublisher
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"是否提醒发布方晚上信息" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *act2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:act1];
    [alertController addAction:act2];
    
    [self.navigationController presentViewController:alertController animated:YES completion:nil];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        
        [self.productsDeTopView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
        [self.productsDeTopView autoSetDimension:ALDimensionHeight toSize:40];
        
        [self.leftTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.productsDeTopView];
        [self.leftTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
        
        [self.rightTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.productsDeTopView];
        [self.rightTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
        
        self.didSetupConstraints = YES;
    }
    
    [super updateViewConstraints];
}

- (EvaTopSwitchView *)productsDeTopView
{
    if (!_productsDeTopView) {
        _productsDeTopView = [EvaTopSwitchView newAutoLayoutView];
        _productsDeTopView.backgroundColor = kNavColor;
        
        [_productsDeTopView.getbutton setTitle:@"基本信息" forState:0];
        [_productsDeTopView.sendButton setTitle:@"补充信息" forState:0];
        
        QDFWeakSelf;
        [_productsDeTopView setDidSelectedButton:^(NSInteger btnTag) {
            if (btnTag ==33) {//基本信息
                
                [weakself.leftTableView setHidden:NO];
                [weakself.rightTableView setHidden:YES];
                [weakself.view bringSubviewToFront:weakself.leftTableView];
                
                
            }else{//补充信息
                
                [weakself.leftTableView setHidden:YES];
                [weakself.rightTableView setHidden:NO];
                [weakself.view bringSubviewToFront:weakself.rightTableView];
            }
        }];
        
    }
    return _productsDeTopView;
}

- (ProdLeftView *)leftTableView
{
    if (!_leftTableView) {
        _leftTableView = [ProdLeftView newAutoLayoutView];
//    _leftTableView.dataList =
//        [_leftTableView reloadData];
    }
    return _leftTableView;
}

- (ProdRightView *)rightTableView
{
    if (!_rightTableView) {
        _rightTableView = [ProdRightView newAutoLayoutView];
        QDFWeakSelf;
        [_rightTableView setDidSelectedRow:^(NSInteger row) {
            switch (row) {
                case 9:{//债权文件
                    DebtDocumnetsViewController *debtDocumnetsVC = [[DebtDocumnetsViewController alloc] init];
                    [weakself.navigationController pushViewController:debtDocumnetsVC animated:YES];
                }
                    break;
                case 10:{//债权人信息
                    
                }
                    break;
                case 11:{//债务人信息
                    
                }
                    break;
                default:
                    break;
            }
            
        }];
    }
    return _rightTableView;
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
