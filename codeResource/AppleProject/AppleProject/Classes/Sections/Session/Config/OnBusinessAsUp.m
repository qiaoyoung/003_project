
#import <Foundation/Foundation.h>

NSString *StringFromChantData(Byte *data);        


//: report_Content
Byte str_disableBottomText[] = {8, 14, 78, 14, 175, 14, 246, 217, 203, 122, 61, 131, 239, 142, 36, 23, 34, 33, 36, 38, 17, 245, 33, 32, 38, 23, 32, 38, 119};


//: onTapMenuItemForword:
Byte str_kickDisableData[] = {33, 21, 74, 4, 37, 36, 10, 23, 38, 3, 27, 36, 43, 255, 42, 27, 35, 252, 37, 40, 45, 37, 40, 26, 240, 207};


//: menu_report
Byte str_keyKickChangeValue[] = {55, 11, 15, 13, 236, 139, 144, 2, 157, 141, 209, 7, 37, 94, 86, 95, 102, 80, 99, 86, 97, 96, 99, 101, 153};


//: onTapMenuItemCopy:
Byte str_badlyText[] = {92, 18, 81, 8, 19, 184, 190, 222, 30, 29, 3, 16, 31, 252, 20, 29, 36, 248, 35, 20, 28, 242, 30, 31, 40, 233, 95};


//: onTapMenuItemRevoke:
Byte str_jurorTitle[] = {93, 20, 35, 10, 66, 191, 96, 78, 189, 251, 76, 75, 49, 62, 77, 42, 66, 75, 82, 38, 81, 66, 74, 47, 66, 83, 76, 72, 66, 23, 141};


//: menu_copy
Byte str_activityValue[] = {47, 9, 1, 9, 224, 224, 248, 100, 194, 108, 100, 109, 116, 94, 98, 110, 111, 120, 94};


//: menu_forword
Byte str_tingCollectionValue[] = {52, 12, 51, 9, 206, 162, 235, 135, 236, 58, 50, 59, 66, 44, 51, 60, 63, 68, 60, 63, 49, 111};


//: menu_translation
Byte str_marbleByTitle[] = {22, 16, 9, 9, 202, 30, 47, 191, 40, 100, 92, 101, 108, 86, 107, 105, 88, 101, 106, 99, 88, 107, 96, 102, 101, 208};


//: onTapMenuItemTranslation:
Byte str_luckyText[] = {33, 25, 78, 5, 12, 33, 32, 6, 19, 34, 255, 23, 32, 39, 251, 38, 23, 31, 6, 36, 19, 32, 37, 30, 19, 38, 27, 33, 32, 236, 122};


//: onTapMenuItemReport:
Byte str_cedeThreadTitle[] = {25, 20, 15, 10, 182, 21, 21, 253, 240, 117, 96, 95, 69, 82, 97, 62, 86, 95, 102, 58, 101, 86, 94, 67, 86, 97, 96, 99, 101, 43, 15};


//: menu_revoke
Byte str_proofValue[] = {22, 11, 51, 14, 76, 151, 87, 111, 92, 243, 197, 172, 177, 147, 58, 50, 59, 66, 44, 63, 50, 67, 60, 56, 50, 30};

// __DEBUG__
// __CLOSE_PRINT__
//
//  OnBusinessAsUp.m
//  NIM
//
//  Created by amao on 8/11/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESSessionConfig.h"
#import "OnBusinessAsUp.h"
//: #import "BBBMediaItem.h"
#import "WithMin.h"
//: #import "NTESBundleSetting.h"
#import "NameLine.h"
//: #import "NTESSnapchatAttachment.h"
#import "TopOfTap.h"
//: #import "NTESWhiteboardAttachment.h"
#import "ToContainer.h"
//: #import "NTESBundleSetting.h"
#import "NameLine.h"
//: #import "NSString+NTES.h"
#import "NSString+Status.h"
//: #import "CCCSessionConfig.h"
#import "FromConfig.h"
//: #import "NTESSessionUtil.h"
#import "ChildMark.h"
//: #import "AAAInputEmoticonManager.h"
#import "DataOf.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"

//: @interface NTESSessionConfig()
@interface OnBusinessAsUp()
//: @property (nonatomic,strong) NIMMessage *threadMessage;
@property (nonatomic,strong) NIMMessage *threadMessage;
//: @end
@end

//: @implementation NTESSessionConfig
@implementation OnBusinessAsUp

//: - (NSArray *)mediaItems
- (NSArray *)titleView
{
    //: NSArray *defaultMediaItems = [AppleProjectKit sharedKit].config.defaultMediaItems;
    NSArray *defaultMediaItems = [Indicator reach].config.cellItems;

//    WithMin *janKenPon = [WithMin item:@"onTapMediaItemJanKenPon:"
//                                     normalImage:[UIImage imageNamed:@"icon_jankenpon_normal"]
//                                   selectedImage:[UIImage imageNamed:@"icon_jankenpon_pressed"]
//                                           title:LangKey(@"message_send_RPS")];//@"石头剪刀布".ntes_localized

//    WithMin *fileTrans = [WithMin item:@"onTapMediaItemFileTrans:"
//                                                normalImage:[UIImage imageNamed:@"icon_file_trans_normal"]
//                                              selectedImage:[UIImage imageNamed:@"icon_file_trans_pressed"]
//                                           title:LangKey(@"message_send_transfer")];//@"文件传输".ntes_localized

//    WithMin *tip       = [WithMin item:@"onTapMediaItemTip:"
//                                     normalImage:[UIImage imageNamed:@"bk_media_tip_normal"]
//                                   selectedImage:[UIImage imageNamed:@"bk_media_tip_pressed"]
//                                           title:@"提示消息".ntes_localized];

//    WithMin *audioChat =  [WithMin item:@"onTapMediaItemAudioChat:"
//                                      normalImage:[UIImage imageNamed:@"btn_media_telphone_message_normal"]
//                                    selectedImage:[UIImage imageNamed:@"btn_media_telphone_message_pressed"]
//                                           title:LangKey(@"message_send_voice_chat")];//@"实时语音".ntes_localized
//
//    WithMin *videoChat =  [WithMin item:@"onTapMediaItemVideoChat:"
//                                      normalImage:[UIImage imageNamed:@"btn_bk_media_video_chat_normal"]
//                                    selectedImage:[UIImage imageNamed:@"btn_bk_media_video_chat_pressed"]
//                                            title:LangKey(@"message_send_video_chat")];//@"视频聊天".ntes_localized
//
//    WithMin *teamMeeting =  [WithMin item:@"onTapMediaItemTeamMeeting:"
//                                      normalImage:[UIImage imageNamed:@"btn_media_telphone_message_normal"]
//                                    selectedImage:[UIImage imageNamed:@"btn_media_telphone_message_pressed"]
//                                            title:LangKey(@"message_send_video_chat")];//@"视频通话".ntes_localized

//    WithMin *snapChat =   [WithMin item:@"onTapMediaItemSnapChat:"
//                                      normalImage:[UIImage imageNamed:@"bk_media_snap_normal"]
//                                    selectedImage:[UIImage imageNamed:@"bk_media_snap_pressed"]
//                                            title:@"阅后即焚".ntes_localized];

//    WithMin *whiteBoard = [WithMin item:@"onTapMediaItemWhiteBoard:"
//                                      normalImage:[UIImage imageNamed:@"btn_whiteboard_invite_normal"]
//                                    selectedImage:[UIImage imageNamed:@"btn_whiteboard_invite_pressed"]
//
//                                            title:@"白板".ntes_localized];
    //红包功能因合作终止，暂时关闭
//    WithMin *redPacket  = [WithMin item:@"onTapMediaItemRedPacket:"
//                                      normalImage:[UIImage imageNamed:@"icon_redpacket_normal"]
//                                    selectedImage:[UIImage imageNamed:@"icon_redpacket_pressed"]
//                                            title:LangKey(@"message_send_red_packet")];//@"红包"

//    WithMin *teamReceipt  = [WithMin item:@"onTapMediaItemTeamReceipt:"
//                                      normalImage:[UIImage imageNamed:@"icon_team_receipt_normal"]
//                                    selectedImage:[UIImage imageNamed:@"icon_team_receipt_pressed"]
//                                            title:@"已读回执".ntes_localized];



//    BOOL isMe   = _session.sessionType == NIMSessionTypeP2P
//    && [_session.sessionId isEqualToString:[[NIMSDK sharedSDK].loginManager currentAccount]];
//    NSArray *items = nil;

//    if (isMe)
//    {
//        items = @[janKenPon,tip];
//    }
//    else if(_session.sessionType == NIMSessionTypeTeam || _session.sessionType == NIMSessionTypeSuperTeam)
//    {
//        items = @[janKenPon];
//    }
//    else
//    {
//        items = @[janKenPon];
//    }


//    return [defaultMediaItems arrayByAddingObjectsFromArray:items];
    //: return defaultMediaItems;
    return defaultMediaItems;
}


//: - (NSArray<BBBMediaItem *> *)menuItemsWithMessage:(NIMMessage *)message {
- (NSArray<WithMin *> *)oned:(NIMMessage *)message {
    //: NSMutableArray *items = [NSMutableArray array];
    NSMutableArray *items = [NSMutableArray array];

//    WithMin *reply = [WithMin item:@"onTapMenuItemReply:"
//                                 normalImage:[UIImage imageNamed:@"menu_reply"]
//                               selectedImage:nil
//                                       title:LangKey(@"回复")];

    //: BBBMediaItem *copy = [BBBMediaItem item:@"onTapMenuItemCopy:"
    WithMin *copy = [WithMin more:StringFromChantData(str_badlyText)
                                //: normalImage:[UIImage imageNamed:@"menu_copy"]
                                title:[UIImage imageNamed:StringFromChantData(str_activityValue)]
                              //: selectedImage:nil
                              back:nil
                                      //: title:[NTESLanguageManager getTextWithKey:@"复制"]];
                                      scheme:[MaxInformation off:@"复制"]];

    //: BBBMediaItem *forword = [BBBMediaItem item:@"onTapMenuItemForword:"
    WithMin *forword = [WithMin more:StringFromChantData(str_kickDisableData)
                                   //: normalImage:[UIImage imageNamed:@"menu_forword"]
                                   title:[UIImage imageNamed:StringFromChantData(str_tingCollectionValue)]
                                 //: selectedImage:nil
                                 back:nil
                                         //: title:[NTESLanguageManager getTextWithKey:@"转发"]];
                                         scheme:[MaxInformation off:@"转发"]];

//    WithMin *mark = [WithMin item:@"onTapMenuItemMark:"
//                                normalImage:[UIImage imageNamed:@"menu_collect"]
//                              selectedImage:nil
//                                      title:LangKey(@"收藏")];

//    BOOL isMessagePined = [NIMSDK.sharedSDK.chatExtendManager pinItemForMessage:message] != nil;
//    NSString *pinTitle = isMessagePined ? @"Un-pin": @"Pin";
//    NSString *pinAction = isMessagePined ? @"onTapMenuItemUnpin:" : @"onTapMenuItemPin:";
//    WithMin *pin = [WithMin item:pinAction
//                               normalImage:[UIImage imageNamed:@"menu_pin"]
//                             selectedImage:nil
//                                     title:pinTitle];

    //: BBBMediaItem *report = [BBBMediaItem item:@"onTapMenuItemReport:"
    WithMin *report = [WithMin more:StringFromChantData(str_cedeThreadTitle)
                                  //: normalImage:[UIImage imageNamed:@"menu_report"]
                                  title:[UIImage imageNamed:StringFromChantData(str_keyKickChangeValue)]
                                //: selectedImage:nil
                                back:nil
                                        //: title:[NTESLanguageManager getTextWithKey:@"report_Content"]];
                                        scheme:[MaxInformation off:StringFromChantData(str_disableBottomText)]];

    //: BBBMediaItem *translation = [BBBMediaItem item:@"onTapMenuItemTranslation:"
    WithMin *translation = [WithMin more:StringFromChantData(str_luckyText)
                                  //: normalImage:[UIImage imageNamed:@"menu_translation"]
                                  title:[UIImage imageNamed:StringFromChantData(str_marbleByTitle)]
                                //: selectedImage:nil
                                back:nil
                                        //: title:[NTESLanguageManager getTextWithKey:@"翻译"]];
                                        scheme:[MaxInformation off:@"翻译"]];

    //: BBBMediaItem *revoke = [BBBMediaItem item:@"onTapMenuItemRevoke:"
    WithMin *revoke = [WithMin more:StringFromChantData(str_jurorTitle)
                                  //: normalImage:[UIImage imageNamed:@"menu_revoke"]
                                  title:[UIImage imageNamed:StringFromChantData(str_proofValue)]
                                //: selectedImage:nil
                                back:nil
                                        //: title:[NTESLanguageManager getTextWithKey:@"撤回"]];
                                        scheme:[MaxInformation off:@"撤回"]];

//    WithMin *delete = [WithMin item:@"onTapMenuItemDelete:"
//                                  normalImage:[UIImage imageNamed:@"menu_del"]
//                                selectedImage:nil
//                                        title:LangKey(@"删除")];

//    WithMin *mutiSelect = [WithMin item:@"onTapMenuItemMutiSelect:"
//                                      normalImage:[UIImage imageNamed:@"menu_choose"]
//                                    selectedImage:nil
//                                            title:LangKey(@"多选")];
//    if ([ChildMark canMessageBeForwarded:message])
//    {
//        [items addObject:reply];
//    }

    //: BOOL isMe = [message.from isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount];
    BOOL isMe = [message.from isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount];
    //: if (!isMe)
    if (!isMe)
    {
        //: [items addObject:report];
        [items addObject:report];
    }

    //: if (message.messageType == NIMMessageTypeText)
    if (message.messageType == NIMMessageTypeText)
    {
        //: [items addObject:copy];
        [items addObject:copy];
    }

    //: if ([NTESSessionUtil canMessageBeForwarded:message]) {
    if ([ChildMark change:message]) {
        //: [items addObject:forword];
        [items addObject:forword];
    }
//    if ([ChildMark canMessageBeForwarded:message]) {
//        [items addObject:mark];
//        [items addObject:pin];
//    }
    //: if (message.messageType == NIMMessageTypeText){
    if (message.messageType == NIMMessageTypeText){
        //: [items addObject:translation];
        [items addObject:translation];
    }
    //: if ([NTESSessionUtil canMessageBeRevoked:message]) {
    if ([ChildMark itemTo:message]) {
        //: [items addObject:revoke];
        [items addObject:revoke];
    }



//    [items addObject:delete];

//    if ([ChildMark canMessageBeForwarded:message])
//    {
//        [items addObject:mutiSelect];
//    }

//    if (message.messageType == NIMMessageTypeAudio)
//    {
//        WithMin *audio2text = [WithMin item:@"onTapMenuItemAudio2Text:"
//          normalImage:[UIImage imageNamed:@"menu_audio2text"]
//        selectedImage:nil
//                title:@"转文字".ntes_localized];
//
//        [items addObject:audio2text];
//    }
    //: return items;
    return items;
}

//: - (NSArray *)emotionItems
- (NSArray *)range
{
    //NSArray *indexs = @[@(1),@(145),@(12),@(15),@(10),@(18),@(19)];
    //: NSArray *indexs = @[];
    NSArray *indexs = @[];
    //: NSMutableArray *items = [NSMutableArray array];
    NSMutableArray *items = [NSMutableArray array];
    //: for (NSNumber *index in indexs)
    for (NSNumber *index in indexs)
    {
        //: NSString * ID = [NSString stringWithFormat:NIMKitQuickCommentFormat, [index integerValue]];
        NSString * ID = [NSString stringWithFormat:k_boxData, [index integerValue]];
        //: NIMInputEmoticon *item = [[AAAInputEmoticonManager sharedManager] emoticonByID:ID];
        LiquidEcstasyEmoticon *item = [[DataOf telegram] pressed:ID];
        //: if (item)
        if (item)
        {
            //: [items addObject:item];
            [items addObject:item];
        }
    }

    //: return [items copy];
    return [items copy];
}

//: - (BOOL)shouldHandleReceipt{
- (BOOL)edgeCall{
    //: return YES;
    return YES;
}

//: - (NSArray<NSNumber *> *)inputBarItemTypes{
- (NSArray<NSNumber *> *)iconImage{
    //: return @[
    return @[
//        @(CCCInputBarItemTypeMore),
//        @(CCCInputBarItemTypeEmoticon),
//             @(CCCInputBarItemTypeVoice),
             //: @(CCCInputBarItemTypeTextAndRecord),
             @(CCCInputBarItemTypeTextAndRecord),
        //: @(CCCInputBarItemTypeSend),
        @(CCCInputBarItemTypeSend),
            //: ];
            ];
}

//: - (BOOL)shouldHandleReceiptForMessage:(NIMMessage *)message
- (BOOL)lineItem:(NIMMessage *)message
{
    //文字，语音，图片，视频，文件，地址位置和自定义消息都支持已读回执，其他的不支持
    //: NIMMessageType type = message.messageType;
    NIMMessageType type = message.messageType;
    //: if (type == NIMMessageTypeCustom) {
    if (type == NIMMessageTypeCustom) {
        //: NIMCustomObject *object = (NIMCustomObject *)message.messageObject;
        NIMCustomObject *object = (NIMCustomObject *)message.messageObject;
        //: id attachment = object.attachment;
        id attachment = object.attachment;

        //: if ([attachment isKindOfClass:[NTESWhiteboardAttachment class]]) {
        if ([attachment isKindOfClass:[ToContainer class]]) {
            //: return NO;
            return NO;
        }
    }



    //: return type == NIMMessageTypeText ||
    return type == NIMMessageTypeText ||
    //: type == NIMMessageTypeAudio ||
    type == NIMMessageTypeAudio ||
    //: type == NIMMessageTypeImage ||
    type == NIMMessageTypeImage ||
    //: type == NIMMessageTypeVideo ||
    type == NIMMessageTypeVideo ||
    //: type == NIMMessageTypeFile ||
    type == NIMMessageTypeFile ||
    //: type == NIMMessageTypeLocation ||
    type == NIMMessageTypeLocation ||
    //: type == NIMMessageTypeCustom;
    type == NIMMessageTypeCustom;
}

//: - (NSArray<NIMInputEmoticonCatalog *> *)charlets
- (NSArray<TinCanTeam *> *)callItem
{
    //: return nil;
    return nil;
}

//: - (BOOL)disableProximityMonitor{
- (BOOL)textName{
    //: return [[NTESBundleSetting sharedConfig] disableProximityMonitor];
    return [[NameLine restoreTing] textName];
}

//: - (BOOL)autoFetchAttachment {
- (BOOL)autoWithinLength {
    //: return [[NTESBundleSetting sharedConfig] autoFetchAttachment];
    return [[NameLine restoreTing] autoWithinLength];
}

//: - (NIMAudioType)recordType
- (NIMAudioType)appOn
{
    //: return [[NTESBundleSetting sharedConfig] usingAmr] ? NIMAudioTypeAMR : NIMAudioTypeAAC;
    return [[NameLine restoreTing] find] ? NIMAudioTypeAMR : NIMAudioTypeAAC;
}

//: - (BOOL)disableSelectedForMessage:(NIMMessage *)message {
- (BOOL)searched:(NIMMessage *)message {
    //: return ![NTESSessionUtil canMessageBeForwarded:message];
    return ![ChildMark change:message];
}

//: - (void)setThreadMessage:(NIMMessage *)message
- (void)setThreadMessage:(NIMMessage *)message
{
    //: _threadMessage = message;
    _threadMessage = message;
}

//: - (void)cleanThreadMessage
- (void)message
{
    //: _threadMessage = nil;
    _threadMessage = nil;
}

//: - (BOOL)clearThreadMessageAfterSent
- (BOOL)handicappedCrop
{
    //: return YES;
    return YES;
}

//: @end
@end

Byte * ChantDataToCache(Byte *data) {
    int frank = data[0];
    int wolf = data[1];
    Byte underbelly = data[2];
    int concern = data[3];
    if (!frank) return data + concern;
    for (int i = concern; i < concern + wolf; i++) {
        int value = data[i] + underbelly;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[concern + wolf] = 0;
    return data + concern;
}

NSString *StringFromChantData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ChantDataToCache(data)];
}
