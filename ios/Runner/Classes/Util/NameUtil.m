
#import <Foundation/Foundation.h>

NSString *StringFromCombineData(Byte *data);


//: 超大群消息撤回
Byte str_manufacturerTitle[] = {80, 21, 95, 14, 56, 214, 134, 83, 91, 58, 168, 136, 187, 190, 71, 21, 228, 68, 3, 6, 70, 29, 3, 69, 21, 231, 69, 224, 14, 69, 241, 3, 68, 250, 253, 134};


//: 群消息单向撤回
Byte str_attractCellName[] = {30, 21, 9, 8, 174, 247, 245, 226, 240, 199, 173, 239, 191, 145, 239, 138, 184, 238, 150, 158, 238, 153, 154, 239, 155, 173, 238, 164, 167, 254};


//: 群消息撤回
Byte str_blackName[] = {70, 15, 63, 12, 187, 197, 72, 249, 77, 157, 65, 12, 38, 253, 227, 37, 245, 199, 37, 192, 238, 37, 209, 227, 36, 218, 221, 80};


//: 点对点消息单向撤回
Byte str_modeCellData[] = {48, 27, 14, 9, 87, 25, 17, 254, 184, 245, 144, 199, 243, 189, 199, 245, 144, 199, 244, 196, 150, 244, 143, 189, 243, 155, 163, 243, 158, 159, 244, 160, 178, 243, 169, 172, 45};


//: 点对点消息撤回
Byte str_conservationComingData[] = {80, 21, 24, 7, 65, 67, 94, 255, 154, 209, 253, 199, 209, 255, 154, 209, 254, 206, 160, 254, 153, 199, 254, 170, 188, 253, 179, 182, 137};


//: [系统通知][%@]
Byte str_magnetConcerningData[] = {11, 18, 70, 7, 16, 27, 114, 161, 45, 249, 1, 45, 1, 229, 47, 198, 224, 45, 229, 235, 163, 161, 107, 134, 163, 136};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NameUtil.m
//  NIM
//
//  Created by Genning on 2020/8/27.
//  Copyright © 2020 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESNoticationUtil.h"
#import "NameUtil.h"
//: #import "UserGlobalMacro.h"
#import "UserGlobalMacro.h"

//: @implementation NTESNoticationUtil
@implementation NameUtil

//: + (NSString *)revokeNoticationContent:(NIMRevokeMessageNotification *)note {
+ (NSString *)custom:(NIMRevokeMessageNotification *)note {
    //: NSMutableString *ret = [NSMutableString stringWithFormat:@"[系统通知][%@]".nim_localized,
    NSMutableString *ret = [NSMutableString stringWithFormat:StringFromCombineData(str_magnetConcerningData).trapLocalized,
                            //: [self revokeTypeContent:note.notificationType]];
                            [self doingBarData:note.notificationType]];
    //: return ret;
    return ret;
}

//: + (NSString *)revokeTypeContent:(NIMRevokeMessageNotificationType)type {
+ (NSString *)doingBarData:(NIMRevokeMessageNotificationType)type {
    //: NSString *ret = @"点对点消息撤回".nim_localized;
    NSString *ret = StringFromCombineData(str_conservationComingData).trapLocalized;
    //: switch (type) {
    switch (type) {
        //: case NIMRevokeMessageNotificationTypeP2P:
        case NIMRevokeMessageNotificationTypeP2P:
        {
            //: ret = @"点对点消息撤回".nim_localized;
            ret = StringFromCombineData(str_conservationComingData).trapLocalized;
            //: break;
            break;
        }
        //: case NIMRevokeMessageNotificationTypeTeam:
        case NIMRevokeMessageNotificationTypeTeam:
        {
            //: ret = @"群消息撤回".nim_localized;
            ret = StringFromCombineData(str_blackName).trapLocalized;
            //: break;
            break;
        }
        //: case NIMRevokeMessageNotificationTypeSuperTeam:
        case NIMRevokeMessageNotificationTypeSuperTeam:
        {
            //: ret = @"超大群消息撤回".nim_localized;
            ret = StringFromCombineData(str_manufacturerTitle).trapLocalized;
            //: break;
            break;
        }
        //: case NIMRevokeMessageNotificationTypeP2POneWay:
        case NIMRevokeMessageNotificationTypeP2POneWay:
        {
            //: ret = @"点对点消息单向撤回".nim_localized;
            ret = StringFromCombineData(str_modeCellData).trapLocalized;
            //: break;
            break;
        }
        //: case NIMRevokeMessageNotificationTypeTeamOneWay:
        case NIMRevokeMessageNotificationTypeTeamOneWay:
        {
            //: ret = @"群消息单向撤回".nim_localized;
            ret = StringFromCombineData(str_attractCellName).trapLocalized;
            //: break;
            break;
        }
        //: default:
        default:
            //: break;
            break;
    }
    //: return ret;
    return ret;
}

//: @end
@end

Byte * CombineDataToCache(Byte *data) {
    int immuneHow = data[0];
    int narrowDown = data[1];
    Byte youth = data[2];
    int sessionConcerning = data[3];
    if (!immuneHow) return data + sessionConcerning;
    for (int i = sessionConcerning; i < sessionConcerning + narrowDown; i++) {
        int value = data[i] - youth;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[sessionConcerning + narrowDown] = 0;
    return data + sessionConcerning;
}

NSString *StringFromCombineData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)CombineDataToCache(data)];
}
