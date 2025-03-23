
#import <Foundation/Foundation.h>

NSString *StringFromMediaData(Byte *data);


//: user_id
Byte str_sessionName[] = {56, 7, 5, 83, 119, 100, 105, 95, 114, 101, 115, 117, 121};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageView.m
//  NIM
//
//  Created by 彭爽 on 2021/9/28.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESContactGroupCell.h"
#import "MessageView.h"

//: @implementation NTESContactGroupCell
@implementation MessageView

//: - (void)initSubviews{
- (void)initChangeByWill{

    //: _iconImageView = [[UIImageView alloc] init];
    _iconImageView = [[UIImageView alloc] init];
    //: [self addSubview:_iconImageView];
    [self addSubview:_iconImageView];

    //: _avatar = [[BBBAvatarImageView alloc] init];
    _avatar = [[AvatarControl alloc] init];
    //: [self addSubview:_avatar];
    [self addSubview:_avatar];
    //: [_avatar mas_makeConstraints:^(MASConstraintMaker *make) {
    [_avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.centerY.mas_offset(0);
        make.centerY.mas_offset(0);
        //: make.left.mas_equalTo(10);
        make.left.mas_equalTo(10);
        //: make.width.mas_equalTo(40);
        make.width.mas_equalTo(40);
        //: make.height.mas_equalTo(40);
        make.height.mas_equalTo(40);
    //: }];
    }];

    //: _titleLabel = [[UILabel alloc] init];
    _titleLabel = [[UILabel alloc] init];
    //: _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.textColor = [UIColor blackColor];
    //: _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    //: [self addSubview:_titleLabel];
    [self addSubview:_titleLabel];
    //: [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.centerY.mas_offset(0);
        make.centerY.mas_offset(0);
        //: make.left.mas_offset(60);
        make.left.mas_offset(60);
        //: make.width.mas_equalTo(200);
        make.width.mas_equalTo(200);
        //: make.height.mas_equalTo(30);
        make.height.mas_equalTo(30);
    //: }];
    }];

}

//: -(void)reloadWithInformation:(NSDictionary *)information{
-(void)heritage:(NSDictionary *)information{
    //: NSString *user_id = [information newStringValueForKey:@"user_id"];
    NSString *user_id = [information cord:StringFromMediaData(str_sessionName)];

    //: NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:user_id];
    NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:user_id];
    //: CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:user_id option:nil];
    TitleInfo *info = [[Indicator reach] indoors:user_id harvest:nil];

    //: [_avatar nim_setImageWithURL:[NSURL URLWithString:info.avatarUrlString] placeholderImage:info.avatarImage options:SDWebImageRetryFailed];
    [_avatar ofOptions:[NSURL URLWithString:info.avatarUrlString] complete:info.avatarImage image:SDWebImageRetryFailed];

    //: _titleLabel.text = user.userInfo.nickName;
    _titleLabel.text = user.userInfo.nickName;


}

//: @end
@end

Byte * MediaDataToCache(Byte *data) {
    int that = data[0];
    int sendImage = data[1];
    int byMedia = data[2];
    if (!that) return data + byMedia;
    for (int i = 0; i < sendImage / 2; i++) {
        int begin = byMedia + i;
        int end = byMedia + sendImage - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[byMedia + sendImage] = 0;
    return data + byMedia;
}

NSString *StringFromMediaData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)MediaDataToCache(data)];
}  
