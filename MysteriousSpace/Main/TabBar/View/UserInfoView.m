//
//  UserInfoView.m
//  MysteriousSpace
//
//  Created by SongGuoxing on 2017/11/2.
//  Copyright © 2017年 SongGuoxing. All rights reserved.
//

#import "UserInfoView.h"

@interface UserInfoView ()
@property (nonatomic, strong) UIImageView *avatar;
@property (nonatomic, strong) UIImageView *genderIcon;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *signLabel;

@end

@implementation UserInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.avatar];
    [self addSubview:self.genderIcon];
    [self addSubview:self.nameLabel];
    [self addSubview:self.signLabel];
    
    [self makeConstraints];
    [self setInfo];
}

- (void)makeConstraints {
    [self.avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.offset(15.f);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.bottom.lessThanOrEqualTo(self).offset(-15.f);
    }];
    
    [self.genderIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.trailing.equalTo(self.avatar);
    }];

    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatar).offset(2.f);
        make.leading.equalTo(self.avatar.mas_trailing).offset(10.f);
    }];
    
    [self.signLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.avatar);
        make.leading.equalTo(self.nameLabel);
    }];
}

- (void)setInfo {
    self.avatar.image = [UIImage imageNamed:@"default_head"];
    self.genderIcon.image = [UIImage imageNamed:@"icon_male"];
    self.nameLabel.text = @"帅帅阿兴";
    self.signLabel.text = @"骚是本色，色是本性";
}

- (UIImageView *)avatar {
    if (!_avatar) {
        _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default_head"]];
        _avatar.layer.cornerRadius = 25.f;
        _avatar.layer.masksToBounds = YES;
    }
    return _avatar;
}

- (UIImageView *)genderIcon {
    if (!_genderIcon) {
        _genderIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_male"]];
    }
    return _genderIcon;
}

- (UILabel *)nameLabel {
    if (!_nameLabel ) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGB(51, 51, 51);
    }
    return _nameLabel;
}

- (UILabel *)signLabel {
    if (!_signLabel ) {
        _signLabel = [[UILabel alloc] init];
        _signLabel.textColor = RGB(51, 51, 51);
        _signLabel.font = FONT(13);
    }
    return _signLabel;
}
@end
