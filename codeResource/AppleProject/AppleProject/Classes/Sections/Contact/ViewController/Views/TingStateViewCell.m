
#import <Foundation/Foundation.h>

NSString *StringFromOriginCornerData(Byte *data);


//: btn_video
Byte str_sharedText[] = {96, 9, 8, 117, 144, 248, 91, 52, 111, 101, 100, 105, 118, 95, 110, 116, 98, 68};


//: btn_message
Byte str_areaData[] = {30, 11, 13, 1, 171, 246, 167, 69, 111, 86, 157, 178, 6, 101, 103, 97, 115, 115, 101, 109, 95, 110, 116, 98, 93};


//: 222222
Byte str_iconValue[] = {10, 6, 8, 108, 48, 254, 74, 205, 50, 50, 50, 50, 50, 50, 120};


//: _UITableViewCellSeparatorView
Byte str_keyIndexData[] = {96, 29, 12, 244, 184, 11, 85, 248, 208, 143, 78, 202, 119, 101, 105, 86, 114, 111, 116, 97, 114, 97, 112, 101, 83, 108, 108, 101, 67, 119, 101, 105, 86, 101, 108, 98, 97, 84, 73, 85, 95, 100};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TingStateViewCell.m
//  NIM
//
//  Created by Yan Wang on 2024/7/27.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESFriendListTableViewCell.h"
#import "TingStateViewCell.h"
//: #import "NTESSessionUtil.h"
#import "ChildMark.h"
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"

//: @implementation NTESFriendListTableViewCell
@implementation TingStateViewCell


//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if (self) {
    if (self) {

        //: self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        //: self.contentView.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
//        self.selectionStyle = UITableViewCellSelectionStyleGray;
        //: self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryType = UITableViewCellAccessoryNone;

        //: [self initSubviews];
        [self initTing];
    }
    //: return self;
    return self;
}

//: + (instancetype)cellWithTableView:(UITableView *)tableView
+ (instancetype)call:(UITableView *)tableView
{
    //: static NSString *identifier = @"NTESFriendListTableViewCell";
    static NSString *identifier = @"TingStateViewCell";
    //: NTESFriendListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    TingStateViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //: if (!cell)
    if (!cell)
    {
        //: cell = [[NTESFriendListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell = [[TingStateViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        cell.backgroundColor = [UIColor colorWithRed:247/255.0 green:249/255.0 blue:250/255.0 alpha:1.0];
//        cell.layer.cornerRadius = 12;
//        cell.backgroundColor = [UIColor clearColor];

    }
    //: return cell;
    return cell;
}

//: - (void)initSubviews {
- (void)initTing {
    //: [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.iconImageView];
    //: [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.titleLabel];
    //: [self.contentView addSubview:self.messageBtn];
    [self.contentView addSubview:self.messageBtn];
    //: [self.contentView addSubview:self.videoBtn];
    [self.contentView addSubview:self.videoBtn];

    //: self.iconImageView.frame = CGRectMake(15, 8, 40, 40);
    self.iconImageView.frame = CGRectMake(15, 8, 40, 40);
    //: self.titleLabel.frame = CGRectMake(70, 0, 150, 56);
    self.titleLabel.frame = CGRectMake(70, 0, 150, 56);

    //: self.messageBtn.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-24, 16, 24, 24);
    self.messageBtn.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-24, 16, 24, 24);
//    self.videoBtn.frame = CGRectMake(SCREEN_WIDTH-15-24, 16, 24, 24);

}


//: - (void)refreshUser:(id<NIMGroupMemberProtocol>)member{
- (void)image:(id<UpProtocol>)member{
    //: self.titleLabel.text = member.showName;
    self.titleLabel.text = member.showTitle;
    //: self.memberId = [member memberId];
    self.memberId = [member video];
    //: CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:self.memberId option:nil];
    TitleInfo *info = [[Indicator reach] indoors:self.memberId harvest:nil];
    //: NSURL *url = info.avatarUrlString ? [NSURL URLWithString:info.avatarUrlString] : nil;
    NSURL *url = info.avatarUrlString ? [NSURL URLWithString:info.avatarUrlString] : nil;

//    [self.iconImageView nim_setImageWithURL:url placeholderImage:info.avatarImage options:SDWebImageRetryFailed];
    //: [self.iconImageView sd_setImageWithURL:url placeholderImage:info.avatarImage];
    [self.iconImageView sd_setImageWithURL:url placeholderImage:info.avatarImage];
}

//: - (void)reloadUserItem:(NIMUser *)user
- (void)option:(NIMUser *)user
{
    //: self.titleLabel.text = user.userInfo.nickName;
    self.titleLabel.text = user.userInfo.nickName;
    //: [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:user.userInfo.avatarUrl] placeholderImage:nil];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:user.userInfo.avatarUrl] placeholderImage:nil];
}

//: + (CGFloat)getCellHeight:(NSDictionary *)information {
+ (CGFloat)secretPlan:(NSDictionary *)information {
    //: return 56.f;
    return 56.f;
}

//: - (void)addSubview:(UIView *)view
- (void)addSubview:(UIView *)view
{
    //: if (![view isKindOfClass:[NSClassFromString(@"_UITableViewCellSeparatorView") class]] && view)
    if (![view isKindOfClass:[NSClassFromString(StringFromOriginCornerData(str_keyIndexData)) class]] && view)
        //: [super addSubview:view];
        [super addSubview:view];
}

//: - (void)onTouchmessageButton {
- (void)tableIn {
    //: if ([self.delegate respondsToSelector:@selector(didTouchMessageButton:)]) {
    if ([self.delegate respondsToSelector:@selector(sharedRead:)]) {
        //: [self.delegate didTouchMessageButton:self.memberId];
        [self.delegate sharedRead:self.memberId];
    }
}


//: - (UIImageView *)iconImageView {
- (UIImageView *)iconImageView {
    //: if (!_iconImageView) {
    if (!_iconImageView) {
        //: _iconImageView = [[UIImageView alloc] init];
        _iconImageView = [[UIImageView alloc] init];
        //: _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.masksToBounds = YES;
        //: _iconImageView.layer.cornerRadius = 20;
        _iconImageView.layer.cornerRadius = 20;
        //: _iconImageView.contentMode = UIViewContentModeScaleToFill;
        _iconImageView.contentMode = UIViewContentModeScaleToFill;
    }
    //: return _iconImageView;
    return _iconImageView;
}

//: - (UILabel *)titleLabel {
- (UILabel *)titleLabel {
    //: if (!_titleLabel) {
    if (!_titleLabel) {
        //: _titleLabel = [[UILabel alloc] init];
        _titleLabel = [[UILabel alloc] init];
        //: _titleLabel.font = [UIFont systemFontOfSize:15.f];
        _titleLabel.font = [UIFont systemFontOfSize:15.f];
        //: _titleLabel.textColor = [UIColor colorWithHexString:@"222222"];
        _titleLabel.textColor = [UIColor direction:StringFromOriginCornerData(str_iconValue)];
        //: _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        //: _titleLabel.numberOfLines = 1;
        _titleLabel.numberOfLines = 1;
        //: _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    //: return _titleLabel;
    return _titleLabel;
}

//: - (UIButton *)messageBtn {
- (UIButton *)messageBtn {
    //: if (!_messageBtn) {
    if (!_messageBtn) {
        //: _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_messageBtn addTarget:self action:@selector(onTouchmessageButton) forControlEvents:UIControlEventTouchUpInside];
        [_messageBtn addTarget:self action:@selector(tableIn) forControlEvents:UIControlEventTouchUpInside];
        //: [_messageBtn setImage:[UIImage imageNamed:@"btn_message"] forState:UIControlStateNormal];
        [_messageBtn setImage:[UIImage imageNamed:StringFromOriginCornerData(str_areaData)] forState:UIControlStateNormal];
    }
    //: return _messageBtn;
    return _messageBtn;
}

//: - (UIButton *)videoBtn {
- (UIButton *)videoBtn {
    //: if (!_videoBtn) {
    if (!_videoBtn) {
        //: _videoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _videoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_videoBtn setImage:[UIImage imageNamed:@"btn_video"] forState:UIControlStateNormal];
        [_videoBtn setImage:[UIImage imageNamed:StringFromOriginCornerData(str_sharedText)] forState:UIControlStateNormal];
//        [_videoBtn addTarget:self action:@selector(onTouchVideoButton) forControlEvents:UIControlEventTouchUpInside];
    }
    //: return _videoBtn;
    return _videoBtn;
}


//: @end
@end

Byte * OriginCornerDataToCache(Byte *data) {
    int imageOrigin = data[0];
    int text = data[1];
    int workflow = data[2];
    if (!imageOrigin) return data + workflow;
    for (int i = 0; i < text / 2; i++) {
        int begin = workflow + i;
        int end = workflow + text - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[workflow + text] = 0;
    return data + workflow;
}

NSString *StringFromOriginCornerData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)OriginCornerDataToCache(data)];
}  
