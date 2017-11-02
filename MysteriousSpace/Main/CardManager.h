//
//  CardManager.h
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Result)(BOOL success, NSString *errMsg);

@interface CardManager : NSObject

+ (CardManager *)sharedManager;


@end
