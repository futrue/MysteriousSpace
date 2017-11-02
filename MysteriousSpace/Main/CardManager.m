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
@property (nonatomic, strong) NSArray <Card *> *cardArray;

@end


@implementation CardManager

+ (CardManager *)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CardManager alloc] init];
    });
    return manager;
}

- (void)saveCard:(Card *)card completion:(Result)result {
    
}


- (Card *)getCard {
    
    return nil;
}

@end
