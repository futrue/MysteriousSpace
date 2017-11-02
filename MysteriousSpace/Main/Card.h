//
//  Card.h
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import <Foundation/Foundation.h>


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

};

@interface Card : NSObject

/** 图片 */
@property (nonatomic, copy) NSString *imageUrl;
/** 卡类型 */
@property (nonatomic, assign) CardType type;
/** 卡类型对应的名字 */
@property (nonatomic, copy, readonly) NSString *cardName;
/** 名字 */
@property (nonatomic, copy) NSString *userName;
/** 电话 */
@property (nonatomic, copy) NSString *phone;
/** 卡号 */
@property (nonatomic, copy) NSString *number;
/** 登录密码 */
@property (nonatomic, copy) NSString *loginPassword;
/** 支付密码 */
@property (nonatomic, copy) NSString *payPassword;


@end
