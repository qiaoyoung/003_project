
#import <Foundation/Foundation.h>

NSString *StringFromPotData(Byte *data);        


//: 回复详情
Byte str_competitiveNomeEqualTitle[] = {17, 12, 6, 11, 55, 136, 130, 90, 143, 112, 250, 223, 149, 152, 223, 158, 135, 226, 169, 160, 224, 125, 127, 86};

// __DEBUG__
// __CLOSE_PRINT__
//
//  FromOfViewController.m
//  NIM
//
//  Created by He on 2020/4/12.
//  Copyright © 2020 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESThreadTalkSessionViewController.h"
#import "FromOfViewController.h"
//: #import "NTESThreadSessionConfig.h"
#import "PressedSessionConfig.h"

//: @interface NTESThreadTalkSessionViewController ()
@interface FromOfViewController ()
//: @property (nonatomic,strong) NIMMessage *threadMesssage;
@property (nonatomic,strong) NIMMessage *threadMesssage;
//: @property (nonatomic,strong) NTESThreadSessionConfig *sessionConfig;
@property (nonatomic,strong) PressedSessionConfig *sessionConfig;
//: @end
@end

//: @implementation NTESThreadTalkSessionViewController
@implementation FromOfViewController

//: - (instancetype)initWithThreadMessage:(NIMMessage *)message
- (instancetype)initWithMessageLabel:(NIMMessage *)message
{
    //: self = [super initWithSession:message.session];
    self = [super initWithOf:message.session];
    //: if (self)
    if (self)
    {
        //: _threadMesssage = message;
        _threadMesssage = message;
    }
    //: return self;
    return self;
}

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
}

//: - (void)setupNormalNav
- (void)anagrammatise
{
}

//: - (NSString *)sessionTitle
- (NSString *)birdSEyeViewContent
{
    //: return @"回复详情".ntes_localized;
    return StringFromPotData(str_competitiveNomeEqualTitle).language;
}

//接收消息

//: - (void)willSendMessage:(NIMMessage *)message
- (void)willSendMessage:(NIMMessage *)message
{
    //: if (![self shouldReceive:message])
    if (![self fromDisappear:message])
    {
        //: return;
        return;
    }
    //: [super willSendMessage:message];
    [super willSendMessage:message];
}

//发送结果
//: - (void)sendMessage:(NIMMessage *)message didCompleteWithError:(NSError *)error
- (void)sendMessage:(NIMMessage *)message didCompleteWithError:(NSError *)error
{
    //: if (![self shouldReceive:message])
    if (![self fromDisappear:message])
    {
       //: return;
       return;
    }

    //: [super sendMessage:message didCompleteWithError:error];
    [super sendMessage:message didCompleteWithError:error];
}


//发送进度
//: -(void)sendMessage:(NIMMessage *)message progress:(float)progress
-(void)sendMessage:(NIMMessage *)message progress:(float)progress
{
     //: if (![self shouldReceive:message])
     if (![self fromDisappear:message])
     {
         //: return;
         return;
     }

    //: [super sendMessage:message progress:progress];
    [super sendMessage:message progress:progress];
}

//: - (void)onRecvMessages:(NSArray *)messages
- (void)onRecvMessages:(NSArray *)messages
{
    //: NSMutableArray *subMessages = [NSMutableArray array];
    NSMutableArray *subMessages = [NSMutableArray array];
    //: for (NIMMessage *message in messages)
    for (NIMMessage *message in messages)
    {
        //: if ([self shouldReceive:message])
        if ([self fromDisappear:message])
        {
            //: [subMessages addObject:message];
            [subMessages addObject:message];
        }
    }
    //: if (subMessages.count == 0)
    if (subMessages.count == 0)
    {
        //: return;
        return;
    }
    //: [super onRecvMessages:messages];
    [super onRecvMessages:messages];
}

//: - (void)fetchMessageAttachment:(NIMMessage *)message progress:(float)progress
- (void)fetchMessageAttachment:(NIMMessage *)message progress:(float)progress
{
    //: if (![self shouldReceive:message])
    if (![self fromDisappear:message])
    {
        //: return;
        return;
    }

    //: [super fetchMessageAttachment:message progress:progress];
    [super fetchMessageAttachment:message progress:progress];
}

//: - (void)fetchMessageAttachment:(NIMMessage *)message didCompleteWithError:(NSError *)error
- (void)fetchMessageAttachment:(NIMMessage *)message didCompleteWithError:(NSError *)error
{
    //: if (![self shouldReceive:message])
    if (![self fromDisappear:message])
    {
        //: return;
        return;
    }

    //: [super fetchMessageAttachment:message didCompleteWithError:error];
    [super fetchMessageAttachment:message didCompleteWithError:error];
}

//: - (void)onRecvMessageReceipts:(NSArray<NIMMessageReceipt *> *)receipts
- (void)onRecvMessageReceipts:(NSArray<NIMMessageReceipt *> *)receipts
{
}


//: - (BOOL)shouldReceive:(NIMMessage *)message
- (BOOL)fromDisappear:(NIMMessage *)message
{
    //: BOOL should = [message.session isEqual:self.session] &&
    BOOL should = [message.session isEqual:self.session] &&
    //: [message.threadMessageId isEqualToString:self.threadMesssage.messageId];
    [message.threadMessageId isEqualToString:self.threadMesssage.messageId];
    //: should = should || [message.messageId isEqualToString:self.threadMesssage.messageId];
    should = should || [message.messageId isEqualToString:self.threadMesssage.messageId];

    //: return should;
    return should;
}

//: - (id<CCCSessionConfig>)sessionConfig
- (id<FromConfig>)sessionConfig
{
    //: if (_sessionConfig == nil) {
    if (_sessionConfig == nil) {
        //: _sessionConfig = [[NTESThreadSessionConfig alloc] initWithMessage:self.threadMesssage];
        _sessionConfig = [[PressedSessionConfig alloc] initWithTitle:self.threadMesssage];
        //: _sessionConfig.session = self.session;
        _sessionConfig.session = self.session;
    }
    //: return _sessionConfig;
    return _sessionConfig;
}

//: #pragma mark - Override
#pragma mark - Override
//: - (void)onClickReplyButton:(NIMMessage *)message
- (void)tiptoed:(NIMMessage *)message
{

}

//: - (BOOL)onLongPressCell:(NIMMessage *)message
- (BOOL)squelch:(NIMMessage *)message
                 //: inView:(UIView *)view
                 flipOptionKey:(UIView *)view
{
    //: return YES;
    return YES;
}

//: @end
@end

Byte * PotDataToCache(Byte *data) {
    int bucketTing = data[0];
    int ax = data[1];
    Byte socialGroup = data[2];
    int flavorImpose = data[3];
    if (!bucketTing) return data + flavorImpose;
    for (int i = flavorImpose; i < flavorImpose + ax; i++) {
        int value = data[i] + socialGroup;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[flavorImpose + ax] = 0;
    return data + flavorImpose;
}

NSString *StringFromPotData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)PotDataToCache(data)];
}
