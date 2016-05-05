//
//  NetworkViewController.m
//  qingdaofu
//
//  Created by zhixiang on 16/1/29.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "NetworkViewController.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"

@interface NetworkViewController ()

@end

@implementation NetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)requestDataGetWithString:(NSString *)string params:(NSDictionary *)params successBlock:(id)successBlock andFailBlock:(id)failBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
   [manager GET:string parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {

       
   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
   }];
    
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
