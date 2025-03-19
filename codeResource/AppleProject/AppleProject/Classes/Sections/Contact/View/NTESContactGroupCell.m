//
//  NTESContactGroupCell.m
//  NIM
//
//  Created by 彭爽 on 2021/9/28.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESContactGroupCell.h"

@implementation NTESContactGroupCell

- (void)initSubviews{
    
    _iconImageView = [[UIImageView alloc] init];
    [self addSubview:_iconImageView];
    
    _avatar = [[BBBAvatarImageView alloc] init];
    [self addSubview:_avatar];
    [_avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_offset(0);
        make.left.mas_offset(60);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
    
}

-(void)reloadWithInformation:(NSDictionary *)information{
    NSString *user_id = [information newStringValueForKey:@"user_id"];
    
    NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:user_id];
    CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:user_id option:nil];

    [_avatar nim_setImageWithURL:[NSURL URLWithString:info.avatarUrlString] placeholderImage:info.avatarImage options:SDWebImageRetryFailed];
    
    _titleLabel.text = user.userInfo.nickName;
    
    
}

@end
