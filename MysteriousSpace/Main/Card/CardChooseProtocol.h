//
//  CardChooseProtocol.h
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/24.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;
@protocol CardChooseProtocol <NSObject>

- (void)didChooseCard:(Card *)card;

@end
