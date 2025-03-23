
#import <Foundation/Foundation.h>

NSString *StringFromOwnData(Byte *data);


//: CFBundleShortVersionString
Byte str_oftContent[] = {68, 26, 96, 7, 52, 10, 252, 163, 166, 162, 213, 206, 196, 204, 197, 179, 200, 207, 210, 212, 182, 197, 210, 211, 201, 207, 206, 179, 212, 210, 201, 206, 199, 27};

// __DEBUG__
// __CLOSE_PRINT__
//
//  UpAt.m
//  NIM
//
//  Created by Netease on 2019/10/16.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESMigrateHeader.h"
#import "UpAt.h"
//: #import "NSDictionary+NTESJson.h"
#import "NSDictionary+Jv.h"

//: static NSString *const kNTESMigrateHeaderVersion = @"version";
static NSString *const k_labelName = @"version";
//: static NSString *const kNTESMigrateHeaderTerminal = @"terminal";
static NSString *const k_targetName = @"terminal";
//: static NSString *const kNTESMigrateHeaderSDKVersion = @"sdk_version";
static NSString *const k_mediaContent = @"sdk_version";
//: static NSString *const kNTESMigrateHeaderAPPVersion = @"app_version";
static NSString *const k_grayValue = @"app_version";
//: static NSString *const kNTESMigrateHeaderMessageCount = @"message_count";
static NSString *const k_weekMessageText = @"message_count";

//: @implementation NTESMigrateHeader
@implementation UpAt


//: + (instancetype)initWithDefaultConfig {
+ (instancetype)initWithDefault {
    //: NTESMigrateHeader *ret = [[NTESMigrateHeader alloc] init];
    UpAt *ret = [[UpAt alloc] init];
    //: ret.version = 0;
    ret.version = 0;
    //: ret.clientType = NIMLoginClientTypeiOS;
    ret.clientType = NIMLoginClientTypeiOS;
    //: ret.sdkVersion = [NIMSDK sharedSDK].sdkVersion;
    ret.sdkVersion = [NIMSDK sharedSDK].sdkVersion;
    //: ret.appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    ret.appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:StringFromOwnData(str_oftContent)];
    //: return ret;
    return ret;
}

//: + (instancetype)initWithRawContent:(NSData *)data {
+ (instancetype)initWithAtShow:(NSData *)data {
    //: if (!data) {
    if (!data) {
        //: return nil;
        return nil;
    }
    //: id jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    id jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    //: if (![jsonData isKindOfClass:[NSDictionary class]]) {
    if (![jsonData isKindOfClass:[NSDictionary class]]) {
        //: return nil;
        return nil;
    }

    //: NSDictionary *dict = (NSDictionary *)jsonData;
    NSDictionary *dict = (NSDictionary *)jsonData;
    //: NTESMigrateHeader *info = [[NTESMigrateHeader alloc] init];
    UpAt *info = [[UpAt alloc] init];
    //: info.version = [dict jsonInteger:kNTESMigrateHeaderVersion];
    info.version = [dict app:k_labelName];
    //: info.clientType = [dict jsonInteger:kNTESMigrateHeaderTerminal];
    info.clientType = [dict app:k_targetName];
    //: info.sdkVersion = [dict jsonString:kNTESMigrateHeaderSDKVersion];
    info.sdkVersion = [dict twine:k_mediaContent];
    //: info.appVersion = [dict jsonString:kNTESMigrateHeaderAPPVersion];
    info.appVersion = [dict twine:k_grayValue];
    //: info.totalInfoCount = [dict jsonInteger:kNTESMigrateHeaderMessageCount];
    info.totalInfoCount = [dict app:k_weekMessageText];
    //: return info;
    return info;
}

//: - (nullable NSData *)toRawContent {
- (nullable NSData *)name {

    //: if ([self invalid]) {
    if ([self completeIn]) {
        //: return nil;
        return nil;
    }

    //: NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    //: dic[kNTESMigrateHeaderVersion] = @(_version);
    dic[k_labelName] = @(_version);
    //: dic[kNTESMigrateHeaderTerminal] = @(_clientType);
    dic[k_targetName] = @(_clientType);
    //: dic[kNTESMigrateHeaderSDKVersion] = _sdkVersion;
    dic[k_mediaContent] = _sdkVersion;
    //: dic[kNTESMigrateHeaderAPPVersion] = _appVersion;
    dic[k_grayValue] = _appVersion;
    //: dic[kNTESMigrateHeaderMessageCount] = @(_totalInfoCount);
    dic[k_weekMessageText] = @(_totalInfoCount);
    //: NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:nil];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:nil];
    //: return jsonData;
    return jsonData;
}

//: - (BOOL)invalid {
- (BOOL)completeIn {
    //: return (_totalInfoCount == 0 ||
    return (_totalInfoCount == 0 ||
            //: _version != 0);
            _version != 0);
}

//: @end
@end

Byte * OwnDataToCache(Byte *data) {
    int jabbing = data[0];
    int shouldImage = data[1];
    Byte wadingPool = data[2];
    int textFed = data[3];
    if (!jabbing) return data + textFed;
    for (int i = textFed; i < textFed + shouldImage; i++) {
        int value = data[i] - wadingPool;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[textFed + shouldImage] = 0;
    return data + textFed;
}

NSString *StringFromOwnData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)OwnDataToCache(data)];
}
