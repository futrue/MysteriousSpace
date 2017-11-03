//
//  CardManager.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "CardManager.h"
#import "Card.h"

static CardManager *manager = nil;

@interface CardManager ()
@property (nonatomic, strong) NSMutableArray <Card *> *cardArray;

@end


@implementation CardManager

+ (CardManager *)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CardManager alloc] init];
    });
    return manager;
}

- (void)addCard:(Card *)card {
    [self.cardArray addObject:card];
}

- (void)removeCard:(Card *)card {
    [self.cardArray removeObject:card];
}

//- (void)removeCard:(Card *)card completion:(Result)result {
//    [self.cardArray removeObject:card];
//}

- (NSArray<Card *> *)allCards {
    return self.cardArray;
}

- (NSMutableArray<Card *> *)cardArray {
    if (!_cardArray) {
        _cardArray = @[].mutableCopy;
    }
    return _cardArray;
}

@end
