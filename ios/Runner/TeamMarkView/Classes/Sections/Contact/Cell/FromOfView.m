
#import <Foundation/Foundation.h>
typedef struct {
    Byte searSorry;
    Byte *henSlat;
    unsigned int battleBuck;
    bool seaIconOpenly;
} CedeGainData;

NSString *StringFromCedeGainData(CedeGainData *data);


//: head_default
CedeGainData str_inputAltogetherName = (CedeGainData){211, (Byte []){187, 182, 178, 183, 140, 183, 182, 181, 178, 166, 191, 167, 53}, 12, false};


//: btn_video
CedeGainData str_sessionMoleEasyTitle = (CedeGainData){66, (Byte []){32, 54, 44, 29, 52, 43, 38, 39, 45, 244}, 9, false};


//: btn_message
CedeGainData str_closeLeaderAnimalData = (CedeGainData){246, (Byte []){148, 130, 152, 169, 155, 147, 133, 133, 151, 145, 147, 25}, 11, false};


//: icon_accessory_selected
CedeGainData str_wipeName = (CedeGainData){221, (Byte []){180, 190, 178, 179, 130, 188, 190, 190, 184, 174, 174, 178, 175, 164, 130, 174, 184, 177, 184, 190, 169, 184, 185, 74}, 23, false};


//: icon_accessory_normal
CedeGainData str_franchiseHareData = (CedeGainData){111, (Byte []){6, 12, 0, 1, 48, 14, 12, 12, 10, 28, 28, 0, 29, 22, 48, 1, 0, 29, 2, 14, 3, 253}, 21, false};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESContactInfoCell.m
//  NIM
//
//  Created by chris on 15/2/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAContactDataCell.h"
#import "FromOfView.h"
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"

//: @interface AAAContactDataCell()
@interface FromOfView()

//: @end
@end

//: @implementation AAAContactDataCell
@implementation FromOfView

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if (self) {
    if (self) {
        //: _avatarImageView = [[BBBAvatarImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _avatarImageView = [[AvatarControl alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        //: [_avatarImageView addTarget:self action:@selector(onPressAvatar:) forControlEvents:UIControlEventTouchUpInside];
        [_avatarImageView addTarget:self action:@selector(withed:) forControlEvents:UIControlEventTouchUpInside];
        //: [self.contentView addSubview:_avatarImageView];
        [self.contentView addSubview:_avatarImageView];
        //: _accessoryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _accessoryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_accessoryBtn setImage:[UIImage imageNamed:@"icon_accessory_normal"] forState:UIControlStateNormal];
        [_accessoryBtn setImage:[UIImage imageNamed:StringFromCedeGainData(&str_franchiseHareData)] forState:UIControlStateNormal];
        //: [_accessoryBtn setImage:[UIImage imageNamed:@"icon_accessory_selected"] forState:UIControlStateSelected];
        [_accessoryBtn setImage:[UIImage imageNamed:StringFromCedeGainData(&str_wipeName)] forState:UIControlStateSelected];
        //: [_accessoryBtn sizeToFit];
        [_accessoryBtn sizeToFit];
        //: _accessoryBtn.hidden = YES;
        _accessoryBtn.hidden = YES;
        //: _accessoryBtn.userInteractionEnabled = NO;
        _accessoryBtn.userInteractionEnabled = NO;
        //: [self.contentView addSubview:_accessoryBtn];
        [self.contentView addSubview:_accessoryBtn];

        //: [self.contentView addSubview:self.messageBtn];
        [self.contentView addSubview:self.messageBtn];
        //: [self.contentView addSubview:self.videoBtn];
        [self.contentView addSubview:self.videoBtn];

        //: self.textLabel.textColor = [UIColor blackColor];
        self.textLabel.textColor = [UIColor blackColor];
        //: self.textLabel.font = [UIFont boldSystemFontOfSize:16];
        self.textLabel.font = [UIFont boldSystemFontOfSize:16];

        //: self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        //: self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    //: return self;
    return self;
}

//: - (void)refreshItem:(id<NIMGroupMemberProtocol>)member {
- (void)queryed:(id<UpProtocol>)member {
    //: [self refreshTitle:member.showName];
    [self tap:member.showTitle];
    //: self.memberId = member.memberId;
    self.memberId = member.memberId;
    //: NSURL *url = member.avatarUrlString ? [NSURL URLWithString:member.avatarUrlString] : nil;
    NSURL *url = member.cornerLikeSnapLine ? [NSURL URLWithString:member.cornerLikeSnapLine] : nil;
    //: [_avatarImageView nim_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"head_default"] options:SDWebImageRetryFailed];
    [_avatarImageView ofOptions:url complete:[UIImage imageNamed:StringFromCedeGainData(&str_inputAltogetherName)] image:SDWebImageRetryFailed];
}

//: - (void)refreshUser:(id<NIMGroupMemberProtocol>)member{
- (void)lastName:(id<UpProtocol>)member{
    //: [self refreshTitle:member.showName];
    [self tap:member.showTitle];
    //: self.memberId = [member memberId];
    self.memberId = [member memberId];
    //: CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:self.memberId option:nil];
    TitleInfo *info = [[Indicator reach] indoors:self.memberId harvest:nil];
    //: [self refreshAvatar:info];
    [self beAt:info];
}

//: - (void)refreshTeam:(NIMTeam *)team; {
- (void)cell:(NIMTeam *)team; {
    //: [self refreshTitle:team.teamName];
    [self tap:team.teamName];
    //: self.memberId = [team teamId];
    self.memberId = [team teamId];
    //: CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByTeam:self.memberId option:nil];
    TitleInfo *info = [[Indicator reach] text:self.memberId byLabel:nil];
    //: [self refreshAvatar:info];
    [self beAt:info];
}

//: - (void)refreshTitle:(NSString *)title{
- (void)tap:(NSString *)title{
    //: self.textLabel.text = title;
    self.textLabel.text = title;
}

//: - (void)refreshAvatar:(CCCKitInfo *)info{
- (void)beAt:(TitleInfo *)info{
    //: NSURL *url = info.avatarUrlString ? [NSURL URLWithString:info.avatarUrlString] : nil;
    NSURL *url = info.avatarUrlString ? [NSURL URLWithString:info.avatarUrlString] : nil;
    //: [_avatarImageView nim_setImageWithURL:url placeholderImage:info.avatarImage options:SDWebImageRetryFailed];
    [_avatarImageView ofOptions:url complete:info.avatarImage image:SDWebImageRetryFailed];
}

//: - (void)onPressAvatar:(id)sender{
- (void)withed:(id)sender{
    //: if ([self.delegate respondsToSelector:@selector(onPressAvatar:)]) {
    if ([self.delegate respondsToSelector:@selector(withed:)]) {
        //: [self.delegate onPressAvatar:self.memberId];
        [self.delegate withed:self.memberId];
    }
}

//: - (void)addDelegate:(id)delegate{
- (void)name:(id)delegate{
    //: self.delegate = delegate;
    self.delegate = delegate;
}

//: - (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    //: [self.accessoryBtn setHighlighted:highlighted];
    [self.accessoryBtn setHighlighted:highlighted];
}


//: - (void)setSelected:(BOOL)selected animated:(BOOL)animated{
- (void)setSelected:(BOOL)selected animated:(BOOL)animated{

}


//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: CGFloat scale = self.nim_width / 320;
    CGFloat scale = self.nim_width / 320;
    //: CGFloat maxTextLabelWidth = 210 * scale;
    CGFloat maxTextLabelWidth = 210 * scale;
    //: self.textLabel.nim_width = ((self.textLabel.nim_width) < (maxTextLabelWidth) ? (self.textLabel.nim_width) : (maxTextLabelWidth));
    self.textLabel.nim_width = ((self.textLabel.nim_width) < (maxTextLabelWidth) ? (self.textLabel.nim_width) : (maxTextLabelWidth));
    //: self.accessoryBtn.nim_left = NIMContactAccessoryLeft;
    self.accessoryBtn.nim_left = k_imageVideoCardValue;
    //: self.accessoryBtn.nim_centerY = self.nim_height * .5f;
    self.accessoryBtn.nim_centerY = self.nim_height * .5f;
    //: self.avatarImageView.nim_left = self.accessoryBtn.hidden ? NIMContactAvatarLeft : NIMContactAvatarAndAccessorySpacing + self.accessoryBtn.nim_right;
    self.avatarImageView.nim_left = self.accessoryBtn.hidden ? k_tapData : k_touchViewValue + self.accessoryBtn.nim_right;
    //: self.avatarImageView.nim_centerY = self.nim_height * .5f;
    self.avatarImageView.nim_centerY = self.nim_height * .5f;
    //: self.textLabel.nim_left = self.avatarImageView.nim_right + NIMContactAvatarAndTitleSpacing;
    self.textLabel.nim_left = self.avatarImageView.nim_right + k_fromValue;

}

//: - (UIButton *)messageBtn {
- (UIButton *)messageBtn {
    //: if (!_messageBtn) {
    if (!_messageBtn) {
        //: _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_messageBtn addTarget:self action:@selector(animationClose) forControlEvents:UIControlEventTouchUpInside];
        //: [_messageBtn setImage:[UIImage imageNamed:@"btn_message"] forState:UIControlStateNormal];
        [_messageBtn setImage:[UIImage imageNamed:StringFromCedeGainData(&str_closeLeaderAnimalData)] forState:UIControlStateNormal];
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
        [_videoBtn setImage:[UIImage imageNamed:StringFromCedeGainData(&str_sessionMoleEasyTitle)] forState:UIControlStateNormal];
//        [_videoBtn addTarget:self action:@selector(updateTheNickname) forControlEvents:UIControlEventTouchUpInside];
    }
    //: return _videoBtn;
    return _videoBtn;
}

//: @end
@end

Byte *CedeGainDataToByte(CedeGainData *data) {
    if (data->seaIconOpenly) return data->henSlat;
    for (int i = 0; i < data->battleBuck; i++) {
        data->henSlat[i] ^= data->searSorry;
    }
    data->henSlat[data->battleBuck] = 0;
    data->seaIconOpenly = true;
    return data->henSlat;
}

NSString *StringFromCedeGainData(CedeGainData *data) {
    return [NSString stringWithUTF8String:(char *)CedeGainDataToByte(data)];
}
