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

- (instancetype)initWithdiC:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        Card *c = [Card mj_objectArrayWithKeyValuesArray:dic];
    }
    return self;
}


- (NSString *)cardName {
    NSString *name = nil;
    switch (self.type) {
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
            name = @"未知类型";
            break;
    }
    return name;
}

@end
