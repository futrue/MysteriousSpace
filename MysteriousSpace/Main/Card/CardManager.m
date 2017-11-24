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

- (void)setInfo:(NSArray *)info compltion:(Result)result {
    if ([info count] == 0) {
        result(NO, @"信息不全");
        return;
    }
    if ([info[1] length] < 10) {
        if (result) {
            result(NO, @"卡号不全");
        }
    }
    // 顺序与propertyAarray对应
    Card *card = [[Card alloc] init];
    card.userName = info[0];
    card.number = info[1];
    card.type = [info[2] integerValue];
    card.phone = info[3];
    card.loginPassword = info[4];
    card.payPassword = info[5];
    card.imageUrl = info[6];
    card.ID_Num = info[7];
    [self addCard:card];
    if (result) {
        result(YES, @"添加成功");
    }
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

- (NSArray<Card *> *)allCardNames {
    NSMutableArray *array = [NSMutableArray array];
    for (CardType i = 0; i < CardTypeMAX - 1; i++) {
        Card *card = [[Card alloc] init];
        card.type = i;
        [array addObject:card];
    }
    return array;
}


- (NSMutableArray<Card *> *)cardArray {
    if (!_cardArray) {
        _cardArray = @[].mutableCopy;
    }
    return _cardArray;
}

@end
