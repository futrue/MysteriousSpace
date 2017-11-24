//
//  CardInfoCell.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/24.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "CardInfoCell.h"
#import "Card.h"

@interface CardInfoCell ()
@property (nonatomic, strong) UIImageView *cardImg;
@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UILabel *numLabel;


@end

@implementation CardInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.cardImg];
        [self.contentView addSubview:self.typeLabel];
        [self.contentView addSubview:self.numLabel];
        
        [self makeConstraints];
    }
    return self;
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    [self.typeLabel sizeToFit];
//    [self.numLabel sizeToFit];
//
//    self.typeLabel.x = 20;
//    self.typeLabel.y = 10;
//
//    self.numLabel.x = 20;
//    self.numLabel.y = self.typeLabel.maxY + 10;
//
//}

- (void)makeConstraints {
    [self.cardImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.offset(10);
        make.bottom.offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 60));
    }];
    
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.cardImg.mas_trailing).offset(15);
        make.top.equalTo(self.cardImg).offset(5);
    }];
    
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.typeLabel);
        make.bottom.equalTo(self.cardImg).offset(-5);
    }];

}

- (void)setCard:(Card *)card {
    _card = card;
    self.typeLabel.text = [NSString stringWithFormat:@"%@[%@]",card.chianeseName,card.abbreviationName] ;
    self.numLabel.text = card.number;
}

- (UIImageView *)cardImg {
    if (!_cardImg) {
        _cardImg = [[UIImageView alloc] initWithImage:[UIImage imageWithColor:COLOR_PLACEHOLDER size:CGSizeMake(100, 60)]];
        _cardImg.layer.cornerRadius = 4;
        _cardImg.layer.masksToBounds = YES;
    }
    return _cardImg;
}

- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [UIControlFastGet labelWithFont:FONT(16) textColor:[UIColor blackColor]];
    }
    return _typeLabel;
}

- (UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel = [UIControlFastGet labelWithFont:FONT(15) textColor:[UIColor lightGrayColor]];
    }
    return _numLabel;
}


@end
