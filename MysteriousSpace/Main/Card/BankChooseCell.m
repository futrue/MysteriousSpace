//
//  BankChooseCell.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/24.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "BankChooseCell.h"
#import "BankEntity.h"

@interface BankChooseCell ()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *englishNameLabel;

@end

@implementation BankChooseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.englishNameLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    [self.englishNameLabel sizeToFit];
    
    self.icon.x = 10;
    self.icon.y = 10;
    
    self.titleLabel.x = self.icon.maxX + 5;
    self.titleLabel.centerY = self.icon.centerY;
    
    self.englishNameLabel.x = self.titleLabel.x;
    self.englishNameLabel.y = self.titleLabel.maxY + 10;
 
}
- (void)setBank:(BankEntity *)bank {
    _bank = bank;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:bank.logo_image_url]];
    self.titleLabel.text = [NSString stringWithFormat:@"%@[%@]",bank.bank_name,bank.bank_ename] ;
    self.englishNameLabel.text = bank._description;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"b14_icon_card"]];
        _icon.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _icon;
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
