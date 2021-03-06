//
//  Card.h
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "BankEntity.h"

typedef NS_ENUM (NSInteger,CardType) {
    CardTypeNone,//未知类型
    CardTypeABC, //The Agricultural Bank of China           农业银行
    CardTypeCCB, //China Construction Bank                  建设银行
    CardTypeICBC,//Industrial and Commercial Bank of China  工商银行
    CardTypeCMB, //China Merchants Bank                     招商银行
    CardTypeBCM, //Bank of Communications                   交通银行
    CardTypeBOC, //Bank of China                            中国银行
    CardTypeBOB, //Bank of Beijing                          北京银行
    CardTypeGYB, //BANK OF GUIYANG                          贵阳银行
    CardTypeGZNX,//GuiZhou Rural Credit Union               贵州省农村信用社
    CardTypeMAX,// MAX              
};

@class BankEntity;
@interface Card : NSObject<NSCoding>

/** 名字 */
@property (nonatomic, copy) NSString *userName;
/** 卡号 */
@property (nonatomic, copy) NSString *number;
///** 卡类型 */
//@property (nonatomic, assign) CardType type;
/** 电话 */
@property (nonatomic, copy) NSString *phone;
/** 登录密码 */
@property (nonatomic, copy) NSString *loginPassword;
/** 支付密码 */
@property (nonatomic, copy) NSString *payPassword;
/** 图片 */
@property (nonatomic, copy) NSString *imageUrl;
/** 身份证号 */
@property (nonatomic, copy) NSString *ID_Num;

@property (nonatomic, strong) BankEntity *bankEntity;

//+ (NSArray *)nameAarray;
+ (NSArray *)propertyAarray;
//- (CardType)typeForName:(NSString *)name;
@end
