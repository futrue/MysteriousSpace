//
//  BankEntity.h
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/12/15.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankEntity : NSObject
/**银行标识cid*/
@property (nonatomic,copy) NSString *cid;
/** 银行中文名称*/
@property (nonatomic,copy) NSString *bank_name;
/**银行英文名称 */
@property (nonatomic,copy) NSString *bank_ename;
/** 银行介绍*/
@property (nonatomic,copy) NSString *_description;
/** 银行logo图片url*/
@property (nonatomic,copy) NSString *logo_image_url;

@end
