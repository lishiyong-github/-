//
//  NSMutableAttributedString+UIColor.m
//  qingdaofu
//
//  Created by zhixiang on 16/5/17.
//  Copyright © 2016年 zhixiang. All rights reserved.
//

#import "NSMutableAttributedString+UIColor.h"

@implementation NSMutableAttributedString (UIColor)

+ (NSMutableAttributedString *)setAttributeString:(NSString *)firstString andSecond:(NSString *)secondString
{
    NSString *str = [NSString stringWithFormat:@"%@%@",firstString,secondString];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:str];
    [attributeString setAttributes:@{NSFontAttributeName:kBigFont,NSForegroundColorAttributeName:kBlackColor} range:NSMakeRange(0, firstString.length)];
    [attributeString setAttributes:@{NSFontAttributeName:kSecondFont,NSForegroundColorAttributeName:kLightGrayColor} range:NSMakeRange(firstString.length, secondString.length)];
    return attributeString;
}

@end
