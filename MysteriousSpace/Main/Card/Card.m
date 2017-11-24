//
//  Card.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "Card.h"
#import "MJExtension.h"


//定义成宏 方便下面使用 也可以减少出错
#define kUserName @"userName"
#define kNumber @"number"
#define kType @"type"
#define kPhone @"phone"
#define kLoginPassword @"loginPassword"
#define kPayPassword @"payPassword"
#define kImageUrl @"imageUrl"
#define kID_Num @"ID_Num"

@implementation Card

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_userName forKey:kUserName];
    [aCoder encodeObject:_number forKey:kNumber];
    [aCoder encodeInteger:_type forKey:kType];
    [aCoder encodeObject:_phone forKey:kPhone];
    [aCoder encodeObject:_loginPassword forKey:kLoginPassword];
    [aCoder encodeObject:_payPassword forKey:kPayPassword];
    [aCoder encodeObject:_imageUrl forKey:kImageUrl];
    [aCoder encodeObject:_ID_Num forKey:kID_Num];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _userName = [aDecoder decodeObjectForKey:kUserName];
        _number = [aDecoder decodeObjectForKey:kNumber];
        _type = [aDecoder decodeIntegerForKey:kType];
        _phone = [aDecoder decodeObjectForKey:kPhone];
        _loginPassword = [aDecoder decodeObjectForKey:kLoginPassword];
        _payPassword = [aDecoder decodeObjectForKey:kPayPassword];
        _imageUrl = [aDecoder decodeObjectForKey:kImageUrl];
        _ID_Num = [aDecoder decodeObjectForKey:kID_Num];
    }
    return self;
}

- (NSString *)number {
    self.type = self.type;
    return _number;
}

- (void)setType:(CardType)type {
    _type = type;
    NSString *name = nil;
    NSString *englishName = nil;
    NSString *englishAbbvName = nil;
    switch (type) {
        case CardTypeNone:
            name = @"未知类型";
            englishName = @"none";
            englishAbbvName = @"None";
            break;
        case CardTypeABC:
            name = @"中国农业银行";
            englishName = @"The Agricultural Bank of China";
            englishAbbvName = @"ABC";

            break;
        case CardTypeCCB:
            name = @"中国建设银行";
            englishName = @"China Construction Bank";
            englishAbbvName = @"CCB";

            break;
        case CardTypeICBC:
            name = @"中国工商银行";
            englishName = @"Industrial and Commercial Bank of China";
            englishAbbvName = @"ICBC";

            break;
        case CardTypeCMB:
            name = @"中国招商银行";
            englishName = @"China Merchants Bank";
            englishAbbvName = @"CMB";

            break;
        case CardTypeBCM:
            name = @"中国交通银行";
            englishName = @"Bank of Communications";
            englishAbbvName = @"BCM";

            break;
        case CardTypeBOC:
            name = @"中国银行";
            englishName = @"Bank of China";
            englishAbbvName = @"BOC";

            break;
        case CardTypeBOB:
            name = @"北京银行";
            englishName = @"Bank of Beijing";
            englishAbbvName = @"BOB";

            break;
        case CardTypeGYB:
            name = @"贵阳银行";
            englishName = @"Bank of Guiyang";
            englishAbbvName = @"GYB";

            break;
        case CardTypeGZNX:
            name = @"贵州省农村信用社";
            englishName = @"GuiZhou Rural Credit Union";
            englishAbbvName = @"GZNX";

            break;
            
        default:
            name = @"其他";
            englishName = @"other";
            englishAbbvName = @"other";
            break;
    }
    _chianeseName = name;
    _englishName = englishName;
    _abbreviationName = englishAbbvName;
}

- (CardType)typeForName:(NSString *)name {
    for (NSString *str in [Card nameAarray]) {
        if ([name containsString:str]) {
            return [[Card nameAarray] indexOfObject:str] + 1;
        }
    }
    return CardTypeNone;
}

+ (NSArray *)nameAarray {
    return @[@"中国农业银行",@"中国建设银行",@"中国工商银行",@"中国招商银行",@"中国交通银行",@"中国银行",@"北京银行",@"贵阳银行",@"贵州省农村信用社"];
}

+ (NSArray *)propertyAarray {
    return @[@"姓名",@"卡号",@"卡类型",@"绑定手机号",@"登录密码",@"支付密码",@"图片",@"身份证号"];
}


@end
