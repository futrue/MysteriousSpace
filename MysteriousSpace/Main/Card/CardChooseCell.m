//
//  CardChooseCell.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/24.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "CardChooseCell.h"
#import "Card.h"

@interface CardChooseCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *englishNameLabel;

@end

@implementation CardChooseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.englishNameLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    [self.englishNameLabel sizeToFit];
    
    self.titleLabel.x = 20;
    self.titleLabel.y = 10;
    
    self.englishNameLabel.x = 20;
    self.englishNameLabel.y = self.titleLabel.maxY + 10;
 
}

- (void)setCard:(Card *)card {
    _card = card;
    self.titleLabel.text = [NSString stringWithFormat:@"%@[%@]",card.chianeseName,card.abbreviationName] ;
    self.englishNameLabel.text = card.englishName;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UIControlFastGet labelWithFont:FONT(16) textColor:[UIColor blackColor]];
    }
    return _titleLabel;
}

- (UILabel *)englishNameLabel {
    if (!_englishNameLabel) {
        _englishNameLabel = [UIControlFastGet labelWithFont:FONT(15) textColor:[UIColor lightGrayColor]];
    }
    return _englishNameLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
