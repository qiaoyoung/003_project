// __DEBUG__
// __CLOSE_PRINT__
//
//  CCCBaseSessionContentConfig.m
// Indicator
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCBaseSessionContentConfig.h"
#import "CCCBaseSessionContentConfig.h"
//: #import "CCCTextContentConfig.h"
#import "TingMessage.h"
//: #import "CCCImageContentConfig.h"
#import "BubbleConfig.h"
//: #import "CCCAudioContentConfig.h"
#import "PhaseOfTheMoonOff.h"
//: #import "CCCVideoContentConfig.h"
#import "ImageConfig.h"
//: #import "CCCFileContentConfig.h"
#import "SelectedConfig.h"
//: #import "CCCNotificationContentConfig.h"
#import "OnShow.h"
//: #import "CCCLocationContentConfig.h"
#import "LanguageCenter.h"
//: #import "CCCUnsupportContentConfig.h"
#import "TitleConfig.h"
//: #import "CCCTipContentConfig.h"
#import "MessageReload.h"
//: #import "CCCReplyedTextContentConfig.h"
#import "SearchedBubble.h"
//: #import "CCCRtcCallRecordContentConfig.h"
#import "AddConfig.h"

//: @interface CCCSessionContentConfigFactory ()
@interface NameFactory ()
//: @property (nonatomic,strong) NSDictionary *dict;
@property (nonatomic,strong) NSDictionary *dict;
//: @property (nonatomic,strong) NSDictionary *replyDict;
@property (nonatomic,strong) NSDictionary *replyDict;
//: @property (nonatomic,strong) CCCUnsupportContentConfig *unsupportConfig;
@property (nonatomic,strong) TitleConfig *unsupportConfig;
//: @end
@end

//: @implementation CCCSessionContentConfigFactory
@implementation NameFactory

//: + (instancetype)sharedFacotry
+ (instancetype)quick
{
    //: static CCCSessionContentConfigFactory *instance = nil;
    static NameFactory *instance = nil;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: instance = [[CCCSessionContentConfigFactory alloc] init];
        instance = [[NameFactory alloc] init];
    //: });
    });
    //: return instance;
    return instance;
}

//: - (instancetype)init
- (instancetype)init
{
    //: if (self = [super init])
    if (self = [super init])
    {
        //: _dict = @{@(NIMMessageTypeText) : [CCCTextContentConfig new],
        _dict = @{@(NIMMessageTypeText) : [TingMessage new],
                  //: @(NIMMessageTypeImage) : [CCCImageContentConfig new],
                  @(NIMMessageTypeImage) : [BubbleConfig new],
                  //: @(NIMMessageTypeAudio) : [CCCAudioContentConfig new],
                  @(NIMMessageTypeAudio) : [PhaseOfTheMoonOff new],
                  //: @(NIMMessageTypeVideo) : [CCCVideoContentConfig new],
                  @(NIMMessageTypeVideo) : [ImageConfig new],
                  //: @(NIMMessageTypeFile) : [CCCFileContentConfig new],
                  @(NIMMessageTypeFile) : [SelectedConfig new],
                  //: @(NIMMessageTypeLocation) : [CCCLocationContentConfig new],
                  @(NIMMessageTypeLocation) : [LanguageCenter new],
                  //: @(NIMMessageTypeNotification) : [CCCNotificationContentConfig new],
                  @(NIMMessageTypeNotification) : [OnShow new],
                  //: @(NIMMessageTypeTip) : [CCCTipContentConfig new],
                  @(NIMMessageTypeTip) : [MessageReload new],
                  //: @(NIMMessageTypeRtcCallRecord): [CCCRtcCallRecordContentConfig new],
                  @(NIMMessageTypeRtcCallRecord): [AddConfig new],
        //: };
        };

        //: CCCReplyedTextContentConfig *replyedTextConfig = [CCCReplyedTextContentConfig new];
        SearchedBubble *replyedTextConfig = [SearchedBubble new];
        //: _replyDict = @{
        _replyDict = @{
            //: @(NIMMessageTypeText) : replyedTextConfig,
            @(NIMMessageTypeText) : replyedTextConfig,
            //: @(NIMMessageTypeAudio) : replyedTextConfig,
            @(NIMMessageTypeAudio) : replyedTextConfig,
            //: @(NIMMessageTypeVideo) : replyedTextConfig,
            @(NIMMessageTypeVideo) : replyedTextConfig,
            //: @(NIMMessageTypeFile) : replyedTextConfig,
            @(NIMMessageTypeFile) : replyedTextConfig,
            //: @(NIMMessageTypeTip) : replyedTextConfig,
            @(NIMMessageTypeTip) : replyedTextConfig,
            //: @(NIMMessageTypeRobot) : replyedTextConfig,
            @(NIMMessageTypeRobot) : replyedTextConfig,
            //: @(NIMMessageTypeNotification) : replyedTextConfig,
            @(NIMMessageTypeNotification) : replyedTextConfig,
            //: @(NIMMessageTypeLocation) : replyedTextConfig,
            @(NIMMessageTypeLocation) : replyedTextConfig,
            //: @(NIMMessageTypeCustom) : replyedTextConfig,
            @(NIMMessageTypeCustom) : replyedTextConfig,
            //: @(NIMMessageTypeImage) : replyedTextConfig,
            @(NIMMessageTypeImage) : replyedTextConfig,
            //: @(NIMMessageTypeRtcCallRecord) : replyedTextConfig,
            @(NIMMessageTypeRtcCallRecord) : replyedTextConfig,
        //: };
        };
        //: _unsupportConfig = [[CCCUnsupportContentConfig alloc] init];
        _unsupportConfig = [[TitleConfig alloc] init];
    }
    //: return self;
    return self;
}

//: - (id<CCCSessionContentConfig>)replyConfigBy:(NIMMessage *)message
- (id<TopTing>)selectedTitle:(NIMMessage *)message
{
    //: NIMMessageType type = message.messageType;
    NIMMessageType type = message.messageType;
    //: id<CCCSessionContentConfig>config = [_replyDict objectForKey:@(type)];
    id<TopTing>config = [_replyDict objectForKey:@(type)];
    //: if (config == nil)
    if (config == nil)
    {
        //: config = _unsupportConfig;
        config = _unsupportConfig;
    }
    //: return config;
    return config;
}

//: - (id<CCCSessionContentConfig>)configBy:(NIMMessage *)message
- (id<TopTing>)datePress:(NIMMessage *)message
{
    //: NIMMessageType type = message.messageType;
    NIMMessageType type = message.messageType;
    //: id<CCCSessionContentConfig>config = [_dict objectForKey:@(type)];
    id<TopTing>config = [_dict objectForKey:@(type)];
    //: if (config == nil)
    if (config == nil)
    {
        //: config = _unsupportConfig;
        config = _unsupportConfig;
    }
    //: return config;
    return config;
}

//: @end
@end