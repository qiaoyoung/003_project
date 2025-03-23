
#import <Foundation/Foundation.h>
typedef struct {
    Byte anal;
    Byte *animalia;
    unsigned int ovenBare;
    bool investorPost;
	int anchorageGround;
	int unimportant;
	int increase;
} CredibilityData;

NSString *StringFromCredibilityData(CredibilityData *data);


//: NTESMessageRefusedTag
CredibilityData str_scapePointName = (CredibilityData){134, (Byte []){200, 210, 195, 213, 203, 227, 245, 245, 231, 225, 227, 212, 227, 224, 243, 245, 227, 226, 210, 231, 225, 100}, 21, false, 18, 121, 119};


//: chatroom_role_manager
CredibilityData str_auraTitle = (CredibilityData){240, (Byte []){147, 152, 145, 132, 130, 159, 159, 157, 175, 130, 159, 156, 149, 175, 157, 145, 158, 145, 151, 149, 130, 3}, 21, false, 102, 205, 222};


//: chatroom_role_master
CredibilityData str_administrativeText = (CredibilityData){214, (Byte []){181, 190, 183, 162, 164, 185, 185, 187, 137, 164, 185, 186, 179, 137, 187, 183, 165, 162, 179, 164, 242}, 20, false, 134, 78, 189};


//: type
CredibilityData str_equalHandleTitle = (CredibilityData){117, (Byte []){1, 12, 5, 16, 106}, 4, false, 134, 81, 129};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TitleLayoutConfig.m
//  NIM
//
//  Created by amao on 2016/11/22.
//  Copyright © 2016年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESCellLayoutConfig.h"
#import "TitleLayoutConfig.h"
//: #import "NTESSessionCustomContentConfig.h"
#import "AggregationFrom.h"
//: #import "NTESChatroomTextContentConfig.h"
#import "NameTeam.h"
//: #import "NTESWhiteboardAttachment.h"
#import "ToContainer.h"
//: #import "NTESRedPacketTipAttachment.h"
#import "LightNameAttachment.h"

//: @interface NTESCellLayoutConfig ()
@interface TitleLayoutConfig ()
//: @property (nonatomic,strong) NSArray *types;
@property (nonatomic,strong) NSArray *types;
//: @property (nonatomic,strong) NTESSessionCustomContentConfig *sessionCustomconfig;
@property (nonatomic,strong) AggregationFrom *sessionCustomconfig;
//: @property (nonatomic,strong) NTESChatroomTextContentConfig *chatroomTextConfig;
@property (nonatomic,strong) NameTeam *chatroomTextConfig;
//: @end
@end

//: @implementation NTESCellLayoutConfig
@implementation TitleLayoutConfig

//: - (instancetype)init
- (instancetype)init
{
    //: if (self = [super init])
    if (self = [super init])
    {
        //: _types = @[
        _types = @[
                   //: @"NTESJanKenPonAttachment",
                   @"MaxOnStatusAttachment",
                   //: @"NTESSnapchatAttachment",
                   @"TopOfTap",
                   //: @"NTESWhiteboardAttachment",
                   @"ToContainer",
                   //: @"NTESRedPacketAttachment",
                   @"MarkTing",
                   //: @"NTESRedPacketTipAttachment",
                   @"LightNameAttachment",
                   //: @"NTESMultiRetweetAttachment",
                   @"AttachmentHide",
                   //: @"NTESShareCardAttachment"
                   @"ViewTitleAttachment"
                   //: ];
                   ];
        //: _sessionCustomconfig = [[NTESSessionCustomContentConfig alloc] init];
        _sessionCustomconfig = [[AggregationFrom alloc] init];
        //: _chatroomTextConfig = [[NTESChatroomTextContentConfig alloc] init];
        _chatroomTextConfig = [[NameTeam alloc] init];
    }
    //: return self;
    return self;
}
//: #pragma mark - CCCCellLayoutConfig
#pragma mark - OffConfig
//: - (CGSize)contentSize:(BBBMessageModel *)model cellWidth:(CGFloat)width{
- (CGSize)sendWidth:(AccumulationCenter *)model showFloat:(CGFloat)width{

    //: NIMMessage *message = model.message;
    NIMMessage *message = model.message;
    //检查是不是当前支持的自定义消息类型
    //: if ([self isSupportedCustomMessage:message])
    if ([self shadow:message])
    {
        //: return [_sessionCustomconfig contentSize:width message:message];
        return [_sessionCustomconfig offMessage:width view:message];
    }

    //检查是不是聊天室文本消息
    //: if ([self isChatroomTextMessage:message])
    if ([self accumulationOrDedication:message])
    {
        //: return [_chatroomTextConfig contentSize:width message:message];
        return [_chatroomTextConfig offMessage:width view:message];
    }

    //如果没有特殊需求，就走默认处理流程
    //: return [super contentSize:model
    return [super sendWidth:model
                    //: cellWidth:width];
                    showFloat:width];

}

//: - (NSString *)cellContent:(BBBMessageModel *)model{
- (NSString *)total:(AccumulationCenter *)model{

    //: NIMMessage *message = model.message;
    NIMMessage *message = model.message;
    //检查是不是当前支持的自定义消息类型
    //: if ([self isSupportedCustomMessage:message]) {
    if ([self shadow:message]) {
        //: return [_sessionCustomconfig cellContent:message];
        return [_sessionCustomconfig text:message];
    }

    //检查是不是聊天室文本消息
    //: if ([self isChatroomTextMessage:message]) {
    if ([self accumulationOrDedication:message]) {
        //: return [_chatroomTextConfig cellContent:message];
        return [_chatroomTextConfig text:message];
    }

    //如果没有特殊需求，就走默认处理流程
    //: return [super cellContent:model];
    return [super total:model];
}

//: - (UIEdgeInsets)contentViewInsets:(BBBMessageModel *)model
- (UIEdgeInsets)handicapped:(AccumulationCenter *)model
{
    //: NIMMessage *message = model.message;
    NIMMessage *message = model.message;
    //检查是不是当前支持的自定义消息类型
    //: if ([self isSupportedCustomMessage:message]) {
    if ([self shadow:message]) {
        //: return [_sessionCustomconfig contentViewInsets:message];
        return [_sessionCustomconfig pressedView:message];
    }

    //检查是不是聊天室文本消息
    //: if ([self isChatroomTextMessage:message]) {
    if ([self accumulationOrDedication:message]) {
        //: return [_chatroomTextConfig contentViewInsets:message];
        return [_chatroomTextConfig pressedView:message];
    }

    //如果没有特殊需求，就走默认处理流程
    //: return [super contentViewInsets:model];
    return [super handicapped:model];
}

//: - (UIEdgeInsets)cellInsets:(BBBMessageModel *)model
- (UIEdgeInsets)top:(AccumulationCenter *)model
{
    //: NIMMessage *message = model.message;
    NIMMessage *message = model.message;

    //检查是不是聊天室消息
    //: if (message.session.sessionType == NIMSessionTypeChatroom)
    if (message.session.sessionType == NIMSessionTypeChatroom)
    {
        //: return UIEdgeInsetsZero;
        return UIEdgeInsetsZero;
    }

    //如果没有特殊需求，就走默认处理流程
    //: return [super cellInsets:model];
    return [super top:model];
}




//: - (BOOL)shouldShowAvatar:(BBBMessageModel *)model
- (BOOL)box:(AccumulationCenter *)model
{
    //: if ([self isSupportedChatroomMessage:model.message]) {
    if ([self chatroom:model.message]) {
        //: return NO;
        return NO;
    }
    //: if ([self isWhiteboardCloseNotificationMessage:model.message]){
    if ([self bar:model.message]){
        //: return NO;
        return NO;
    }
    //: if ([self isRedpacketTip:model.message]) {
    if ([self dataTip:model.message]) {
        //: return NO;
        return NO;
    }
    //: return [super shouldShowAvatar:model];
    return [super box:model];
}

//: - (BOOL)shouldShowLeft:(BBBMessageModel *)model{
- (BOOL)reason:(AccumulationCenter *)model{
    //: if ([self isSupportedChatroomMessage:model.message]) {
    if ([self chatroom:model.message]) {
        //: return YES;
        return YES;
    }
    //: return [super shouldShowLeft:model];
    return [super reason:model];
}


//: - (BOOL)shouldShowNickName:(BBBMessageModel *)model{
- (BOOL)nickToInput:(AccumulationCenter *)model{
    //: if ([self isSupportedChatroomMessage:model.message]) {
    if ([self chatroom:model.message]) {
        //: return YES;
        return YES;
    }
    //: if ([self isRedpacketTip:model.message]) {
    if ([self dataTip:model.message]) {
        //: return NO;
        return NO;
    }
    //: return [super shouldShowNickName:model];
    return [super nickToInput:model];
}

//: - (CGPoint)nickNameMargin:(BBBMessageModel *)model{
- (CGPoint)contentImage:(AccumulationCenter *)model{

    //: if ([self isSupportedChatroomMessage:model.message]) {
    if ([self chatroom:model.message]) {
        //: NSDictionary *ext = model.message.remoteExt;
        NSDictionary *ext = model.message.remoteExt;
        //: NIMChatroomMemberType type = [ext[@"type"] integerValue];
        NIMChatroomMemberType type = [ext[StringFromCredibilityData(&str_equalHandleTitle)] integerValue];
        //: switch (type) {
        switch (type) {
            //: case NIMChatroomMemberTypeManager:
            case NIMChatroomMemberTypeManager:
            //: case NIMChatroomMemberTypeCreator:
            case NIMChatroomMemberTypeCreator:
                //: return CGPointMake(50.f, -3.f);
                return CGPointMake(50.f, -3.f);
            //: default:
            default:
                //: break;
                break;
        }
        //: return CGPointMake(15.f, -3.f);;
        return CGPointMake(15.f, -3.f);;

    }
    //: return [super nickNameMargin:model];
    return [super contentImage:model];
}

//: - (NSArray *)customViews:(BBBMessageModel *)model
- (NSArray *)rubric:(AccumulationCenter *)model
{
    //: if ([self isSupportedChatroomMessage:model.message]) {
    if ([self chatroom:model.message]) {
        //: NSDictionary *ext = model.message.remoteExt;
        NSDictionary *ext = model.message.remoteExt;
        //: NIMChatroomMemberType type = [ext[@"type"] integerValue];
        NIMChatroomMemberType type = [ext[StringFromCredibilityData(&str_equalHandleTitle)] integerValue];
        //: NSString *imageName;
        NSString *imageName;

        //: switch (type)
        switch (type)
        {
            //: case NIMChatroomMemberTypeManager:
            case NIMChatroomMemberTypeManager:
                //: imageName = @"chatroom_role_manager";
                imageName = StringFromCredibilityData(&str_auraTitle);
                //: break;
                break;
            //: case NIMChatroomMemberTypeCreator:
            case NIMChatroomMemberTypeCreator:
                //: imageName = @"chatroom_role_master";
                imageName = StringFromCredibilityData(&str_administrativeText);
                //: break;
                break;
            //: default:
            default:
                //: break;
                break;
        }

        //: UIImageView *imageView;
        UIImageView *imageView;
        //: if (imageName.length) {
        if (imageName.length) {
            //: UIImage *image = [UIImage imageNamed:imageName];
            UIImage *image = [UIImage imageNamed:imageName];
            //: imageView = [[UIImageView alloc] initWithImage:image];
            imageView = [[UIImageView alloc] initWithImage:image];
            //: CGFloat leftMargin = 15.f;
            CGFloat leftMargin = 15.f;
            //: CGFloat topMatgin = 0.f;
            CGFloat topMatgin = 0.f;
            //: CGRect frame = imageView.frame;
            CGRect frame = imageView.frame;
            //: frame.origin = CGPointMake(leftMargin, topMatgin);
            frame.origin = CGPointMake(leftMargin, topMatgin);
            //: imageView.frame = frame;
            imageView.frame = frame;
        }
        //: return imageView ? @[imageView] : nil;
        return imageView ? @[imageView] : nil;
    }
    //: return [super customViews:model];
    return [super rubric:model];
}


//: - (BOOL)disableRetryButton:(BBBMessageModel *)model
- (BOOL)ats:(AccumulationCenter *)model
{
    //: if ([model.message.localExt.allKeys containsObject:@"NTESMessageRefusedTag"])
    if ([model.message.localExt.allKeys containsObject:StringFromCredibilityData(&str_scapePointName)])
    {
        //: return [[model.message.localExt objectForKey:@"NTESMessageRefusedTag"] boolValue];
        return [[model.message.localExt objectForKey:StringFromCredibilityData(&str_scapePointName)] boolValue];
    }
    //: return [super disableRetryButton:model];
    return [super ats:model];
}



//: #pragma mark - misc
#pragma mark - misc
//: - (BOOL)isSupportedCustomMessage:(NIMMessage *)message
- (BOOL)shadow:(NIMMessage *)message
{
    //: NIMCustomObject *object = message.messageObject;
    NIMCustomObject *object = message.messageObject;
    //: return [object isKindOfClass:[NIMCustomObject class]] &&
    return [object isKindOfClass:[NIMCustomObject class]] &&
    //: [_types indexOfObject:NSStringFromClass([object.attachment class])] != NSNotFound;
    [_types indexOfObject:NSStringFromClass([object.attachment class])] != NSNotFound;
}


//: - (BOOL)isSupportedChatroomMessage:(NIMMessage *)message
- (BOOL)chatroom:(NIMMessage *)message
{
    //: return message.session.sessionType == NIMSessionTypeChatroom &&
    return message.session.sessionType == NIMSessionTypeChatroom &&
    //: (message.messageType == NIMMessageTypeText || [self isSupportedCustomMessage:message]);
    (message.messageType == NIMMessageTypeText || [self shadow:message]);
}

//: - (BOOL)isChatroomTextMessage:(NIMMessage *)message
- (BOOL)accumulationOrDedication:(NIMMessage *)message
{
    //: return message.session.sessionType == NIMSessionTypeChatroom &&
    return message.session.sessionType == NIMSessionTypeChatroom &&
    //: message.messageType == NIMMessageTypeText;
    message.messageType == NIMMessageTypeText;
}

//: - (BOOL)isWhiteboardCloseNotificationMessage:(NIMMessage *)message
- (BOOL)bar:(NIMMessage *)message
{
    //: if (message.messageType == NIMMessageTypeCustom) {
    if (message.messageType == NIMMessageTypeCustom) {
        //: NIMCustomObject *object = message.messageObject;
        NIMCustomObject *object = message.messageObject;
        //: if ([object.attachment isKindOfClass:[NTESWhiteboardAttachment class]]) {
        if ([object.attachment isKindOfClass:[ToContainer class]]) {
            //: return [(NTESWhiteboardAttachment *)object.attachment flag] == CustomWhiteboardFlagClose;
            return [(ToContainer *)object.attachment flag] == CustomWhiteboardFlagClose;
        }
    }
    //: return NO;
    return NO;
}

//: - (BOOL)isRedpacketTip:(NIMMessage *)message
- (BOOL)dataTip:(NIMMessage *)message
{
    //: if (message.messageType == NIMMessageTypeCustom) {
    if (message.messageType == NIMMessageTypeCustom) {
        //: NIMCustomObject *object = message.messageObject;
        NIMCustomObject *object = message.messageObject;
        //: if ([object.attachment isKindOfClass:[NTESRedPacketTipAttachment class]]) {
        if ([object.attachment isKindOfClass:[LightNameAttachment class]]) {
            //: return YES;
            return YES;
        }
    }
    //: return NO;
    return NO;
}

//: - (BOOL)shouldDisplayBubbleBackground:(BBBMessageModel *)model
- (BOOL)cellBackground:(AccumulationCenter *)model
{
    //: NIMMessage *message = model.message;
    NIMMessage *message = model.message;
    //: if (!message)
    if (!message)
    {
        //: return NO;
        return NO;
    }

    //: if ([self isSupportedCustomMessage:message])
    if ([self shadow:message])
    {
        //: return [_sessionCustomconfig enableBackgroundBubbleView:message];
        return [_sessionCustomconfig backgrounded:message];
    }

    //检查是不是聊天室文本消息
    //: if (message.session.sessionType == NIMSessionTypeChatroom)
    if (message.session.sessionType == NIMSessionTypeChatroom)
    {
        //: if ([_chatroomTextConfig respondsToSelector:@selector(enableBackgroundBubbleView:)])
        if ([_chatroomTextConfig respondsToSelector:@selector(backgrounded:)])
        {
            //: return [_chatroomTextConfig enableBackgroundBubbleView:message];
            return [_chatroomTextConfig backgrounded:message];
        }
        //: return NO;
        return NO;
    }

    //: return [super shouldDisplayBubbleBackground:model];
    return [super cellBackground:model];
}
//: @end
@end

Byte *CredibilityDataToByte(CredibilityData *data) {
    if (data->investorPost) return data->animalia;
    for (int i = 0; i < data->ovenBare; i++) {
        data->animalia[i] ^= data->anal;
    }
    data->animalia[data->ovenBare] = 0;
    data->investorPost = true;
	if (data->ovenBare >= 3) {
		data->anchorageGround = data->animalia[0];
		data->unimportant = data->animalia[1];
		data->increase = data->animalia[2];
	}
    return data->animalia;
}

NSString *StringFromCredibilityData(CredibilityData *data) {
    return [NSString stringWithUTF8String:(char *)CredibilityDataToByte(data)];
}
