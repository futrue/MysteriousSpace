//
//  CardManager.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/1.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "CardManager.h"
#import "Card.h"

static NSString * const kCardSuffix = @"my_card";
/*  const只修饰其后的变量，至于const放在类型前还是类型后并没有区别。
 NSString  const *raven = @"raven";//const修饰*raven
 const NSString *raven = @"raven";//const修饰*raven
 NSString *const raven = @"raven";//const修饰raven,即*raven可变,raven不可变
 */


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

- (void)addCard:(Card *)card compltion:(Result)result {
    [self addCard:card];
    if (result) {
        result(YES, @"添加成功");
    }
}

- (void)addCard:(Card *)card {
    [self.cardArray addObject:card];
    [self update];
}

- (void)update {
    NSMutableData *data =[NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self.cardArray forKey:kCardSuffix];// 开始归档
    [archiver finishEncoding];// 完成归档
    [data writeToFile:[self path] atomically:YES];// 写入文件
}

- (void)removeCard:(Card *)card {
    [self.cardArray removeObject:card];
    [self update];
}

//- (void)removeCard:(Card *)card completion:(Result)result {
//    [self.cardArray removeObject:card];
//}

- (NSArray<Card *> *)allCards {
    // 反归档
    NSData *_data = [NSData dataWithContentsOfFile:[self path]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:_data];
    NSArray *cards = [unarchiver decodeObjectForKey:kCardSuffix];
    [unarchiver finishDecoding];
//    for (Card *cd in cards) {
//        [cd setType:cd.type];
//    }
//    NSLog(@"%@",cards);
    return cards;
}

//- (NSArray<Card *> *)allCardNames {
//    NSMutableArray *array = [NSMutableArray array];
//    for (CardType i = 0; i < CardTypeMAX - 1; i++) {
//        Card *card = [[Card alloc] init];
//        card.type = i;
//        [array addObject:card];
//    }
//    return array;
//}

- (NSString *)path {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"cardInfo.table"];
    return path;
}

- (NSArray *)bankList {
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"bankList" ofType:nil];
//    NSArray *array0 = [BankEntity mj_objectArrayWithFile:path];
    NSArray *array = [BankEntity mj_objectArrayWithFilename:@"bankList"];
    return array;
}

- (NSMutableArray<Card *> *)cardArray {
    if (!_cardArray) {
        _cardArray = @[].mutableCopy;
    }
    return _cardArray;
}

@end
