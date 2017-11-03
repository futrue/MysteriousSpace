//
//  Card.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "Card.h"
#import "MJExtension.h"

@implementation Card

- (NSString *)cardName {
    NSString *name = nil;
    switch (self.type) {
        case CardTypeNone:
            name = @"未知类型";
            break;
        case CardTypeABC:
            name = @"中国农业银行";
            break;
        case CardTypeCCB:
            name = @"中国建设银行";
            break;
        case CardTypeICBC:
            name = @"中国工商银行";
            break;
        case CardTypeCMB:
            name = @"中国招商银行";
            break;
        case CardTypeBCM:
            name = @"中国交通银行";
            break;
        case CardTypeBOC:
            name = @"中国银行";
            break;
        case CardTypeBOB:
            name = @"北京银行";
            break;
        case CardTypeGYB:
            name = @"贵阳银行";
            break;
        case CardTypeGZNX:
            name = @"贵州省农村信用社";
            break;

        default:
            name = @"其他";
            break;
    }
    return name;
}

+ (NSArray *)nameAarray {
    return @[@"中国农业银行",@"中国建设银行",@"中国工商银行",@"中国招商银行",@"中国交通银行",@"中国银行",@"北京银行",@"贵阳银行",@"贵州省农村信用社",@"贵州省农村信用社"];
}

+ (NSArray *)propertyAarray {
    return @[@"姓名",@"卡号",@"卡类型",@"绑定手机号",@"登录密码",@"支付密码",@"图片",@"身份证号"];
}

- (void)setInfo:(NSArray *)info {
    // 顺序与propertyAarray对应
    
    self.userName = info[0];
    self.number = info[1];
    self.type = [info[2] integerValue];
    self.phone = info[3];
    self.loginPassword = info[4];
    self.payPassword = info[5];
    self.imageUrl = info[6];
    self.ID_Num = info[7];
}

@end
