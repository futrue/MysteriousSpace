//
//  CardManager.h
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Result)(BOOL success, NSString *errMsg);

@class Card;
@interface CardManager : NSObject

+ (CardManager *)sharedManager;
- (void)setInfo:(NSArray *)info compltion:(Result)result;
- (void)addCard:(Card *)card;

- (void)removeCard:(Card *)card;

- (NSArray<Card *> *)allCards;

@end
