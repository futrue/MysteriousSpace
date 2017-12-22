//
//  AddCardCell.h
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/12/21.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Card;
@interface AddCardCell : UITableViewCell
@property (nonatomic, strong) Card *card;
- (void)setTitle:(NSString *)title desc:(NSString *)desc;

@property (nonatomic, strong, readonly) NSString *currentText;
@property (nonatomic, strong, readonly) NSString *placeholder;
@end
