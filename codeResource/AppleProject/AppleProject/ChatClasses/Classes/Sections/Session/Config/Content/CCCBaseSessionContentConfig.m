//
//  CCCBaseSessionContentConfig.m
// AppleProjectKit
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

#import "CCCBaseSessionContentConfig.h"
#import "CCCTextContentConfig.h"
#import "CCCImageContentConfig.h"
#import "CCCAudioContentConfig.h"
#import "CCCVideoContentConfig.h"
#import "CCCFileContentConfig.h"
#import "CCCNotificationContentConfig.h"
#import "CCCLocationContentConfig.h"
#import "CCCUnsupportContentConfig.h"
#import "CCCTipContentConfig.h"
#import "CCCReplyedTextContentConfig.h"
#import "CCCRtcCallRecordContentConfig.h"

@interface CCCSessionContentConfigFactory ()
@property (nonatomic,strong)    NSDictionary                *dict;
@property (nonatomic,strong)    NSDictionary                *replyDict;
@property (nonatomic,strong)    CCCUnsupportContentConfig   *unsupportConfig;
@end

@implementation CCCSessionContentConfigFactory

+ (instancetype)sharedFacotry
{
    static CCCSessionContentConfigFactory *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CCCSessionContentConfigFactory alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        _dict = @{@(NIMMessageTypeText)         :       [CCCTextContentConfig new],
                  @(NIMMessageTypeImage)        :       [CCCImageContentConfig new],
                  @(NIMMessageTypeAudio)        :       [CCCAudioContentConfig new],
                  @(NIMMessageTypeVideo)        :       [CCCVideoContentConfig new],
                  @(NIMMessageTypeFile)         :       [CCCFileContentConfig new],
                  @(NIMMessageTypeLocation)     :       [CCCLocationContentConfig new],
                  @(NIMMessageTypeNotification) :       [CCCNotificationContentConfig new],
                  @(NIMMessageTypeTip)          :       [CCCTipContentConfig new],
                  @(NIMMessageTypeRtcCallRecord):       [CCCRtcCallRecordContentConfig new],
        };
        
        CCCReplyedTextContentConfig *replyedTextConfig = [CCCReplyedTextContentConfig new];
        _replyDict = @{
            @(NIMMessageTypeText)       : replyedTextConfig,
            @(NIMMessageTypeAudio)      : replyedTextConfig,
            @(NIMMessageTypeVideo)      : replyedTextConfig,
            @(NIMMessageTypeFile)       : replyedTextConfig,
            @(NIMMessageTypeTip)        : replyedTextConfig,
            @(NIMMessageTypeRobot)      : replyedTextConfig,
            @(NIMMessageTypeNotification)   : replyedTextConfig,
            @(NIMMessageTypeLocation)   : replyedTextConfig,
            @(NIMMessageTypeCustom)     : replyedTextConfig,
            @(NIMMessageTypeImage)      : replyedTextConfig,
            @(NIMMessageTypeRtcCallRecord)      : replyedTextConfig,
        };
        _unsupportConfig = [[CCCUnsupportContentConfig alloc] init];
    }
    return self;
}

- (id<CCCSessionContentConfig>)replyConfigBy:(NIMMessage *)message
{
    NIMMessageType type = message.messageType;
    id<CCCSessionContentConfig>config = [_replyDict objectForKey:@(type)];
    if (config == nil)
    {
        config = _unsupportConfig;
    }
    return config;
}

- (id<CCCSessionContentConfig>)configBy:(NIMMessage *)message
{
    NIMMessageType type = message.messageType;
    id<CCCSessionContentConfig>config = [_dict objectForKey:@(type)];
    if (config == nil)
    {
        config = _unsupportConfig;
    }
    return config;
}

@end
