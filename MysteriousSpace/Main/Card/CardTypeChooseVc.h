//
//  CardTypeChooseVc.h
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/24.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardChooseProtocol.h"

@interface CardTypeChooseVc : UIViewController
@property (nonatomic, weak) id <CardChooseProtocol> delegate;
@end
