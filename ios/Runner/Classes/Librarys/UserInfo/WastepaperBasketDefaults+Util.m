
#import <Foundation/Foundation.h>
typedef struct {
    Byte townJazz;
    Byte *typicallyEnterprise;
    unsigned int oven;
    bool throttle;
	int hen;
	int refugeeGain;
} FishData;

NSString *StringFromFishData(FishData *data);


//: language
FishData str_competitiveValue = (FishData){235, (Byte []){135, 138, 133, 140, 158, 138, 140, 142, 11}, 8, false, 242, 103};


//: NSUserDefault%@
FishData str_entireData = (FishData){6, (Byte []){72, 85, 83, 117, 99, 116, 66, 99, 96, 103, 115, 106, 114, 35, 70, 255}, 15, false, 185, 76};


//: appkey
FishData str_workCartName = (FishData){142, (Byte []){239, 254, 254, 229, 235, 247, 79}, 6, false, 241, 7};


//: Webpage
FishData str_bareTingTitle = (FishData){177, (Byte []){230, 212, 211, 193, 208, 214, 212, 153}, 7, false, 163, 46};


//: isclose
FishData str_lowEgoData = (FishData){150, (Byte []){255, 229, 245, 250, 249, 229, 243, 211}, 7, false, 252, 81};


//: isregitor
FishData str_fedCellContent = (FishData){160, (Byte []){201, 211, 210, 197, 199, 201, 212, 207, 210, 224}, 9, false, 247, 136};


//: logininfo
FishData str_imageScapeContent = (FishData){241, (Byte []){157, 158, 150, 152, 159, 152, 159, 151, 158, 11}, 9, false, 3, 201};


//: Hello World
FishData str_biologicName = (FishData){68, (Byte []){12, 33, 40, 40, 43, 100, 19, 43, 54, 40, 32, 211}, 11, false, 122, 175};


//: KEKENotificationLanguageChanged
FishData str_drivingOvertValue = (FishData){93, (Byte []){22, 24, 22, 24, 19, 50, 41, 52, 59, 52, 62, 60, 41, 52, 50, 51, 17, 60, 51, 58, 40, 60, 58, 56, 30, 53, 60, 51, 58, 56, 57, 115}, 31, false, 167, 1};


//: e6548ec2fe71a38961430ee520b0ad47
FishData str_thighScapeData = (FishData){58, (Byte []){95, 12, 15, 14, 2, 95, 89, 8, 92, 95, 13, 11, 91, 9, 2, 3, 12, 11, 14, 9, 10, 95, 95, 15, 8, 10, 88, 10, 91, 94, 14, 13, 75}, 32, false, 154, 23};


//: webViewTitle
FishData str_howName = (FishData){100, (Byte []){19, 1, 6, 50, 13, 1, 19, 48, 13, 16, 8, 1, 239}, 12, false, 197, 244};


//: webViewURL
FishData str_religionValue = (FishData){130, (Byte []){245, 231, 224, 212, 235, 231, 245, 215, 208, 206, 45}, 10, false, 167, 125};

// __DEBUG__
// __CLOSE_PRINT__
//
//  WastepaperBasketDefaults+Util.m
//  译同行
//
//  Created by 曹宇 on 2017/8/29.
//  Copyright © 2017年 caoyu. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NIMUserDefaults+Util.h"
#import "WastepaperBasketDefaults+Util.h"
//: #import "ZCHttpManager.h"
#import "FromMessage.h"

//: @implementation NIMUserDefaults (Util)
@implementation WastepaperBasketDefaults (Util)

//: @dynamic webViewTitle;
@dynamic webViewTitle;
//: @dynamic webViewURL;
@dynamic webViewURL;
//: @dynamic appkey;
@dynamic appkey;
//: @dynamic isclose;
@dynamic isclose;

//: @dynamic isregitor;
@dynamic isregitor;
//: @dynamic accountName;
@dynamic accountName;

//: @dynamic loginToken;
@dynamic loginToken;
//: @dynamic language;
@dynamic language;



//: - (NSDictionary *)setupDefaults {
- (NSDictionary *)ofDisappear {
    //: return @{
    return @{
             //: @"webViewTitle" : @"Webpage",
             StringFromFishData(&str_howName) : StringFromFishData(&str_bareTingTitle),
             //: @"webViewURL" : @"",
             StringFromFishData(&str_religionValue) : @"",
             //: @"appkey" : @"e6548ec2fe71a38961430ee520b0ad47",
             StringFromFishData(&str_workCartName) : StringFromFishData(&str_thighScapeData),
             //: @"isclose" : @"0",
             StringFromFishData(&str_lowEgoData) : @"0",
             //: @"logininfo" : @"Hello World",
             StringFromFishData(&str_imageScapeContent) : StringFromFishData(&str_biologicName),
             //: @"isregitor" : @"1",
             StringFromFishData(&str_fedCellContent) : @"1",
             //: @"language" : @""
             StringFromFishData(&str_competitiveValue) : @""
             //: };
             };
}

//: - (void)updateLanguageWith:(NSString *)lang; {
- (void)koine:(NSString *)lang; {

    //: if (lang.length == 0) {
    if (lang.length == 0) {
        //: return;
        return;
    }

    //: [ZCHttpManager sharedManager].lastLang = lang;
    [FromMessage shared].lastLang = lang;

    //: NIMUserDefaults *userDefaults = [NIMUserDefaults standardUserDefaults];
    WastepaperBasketDefaults *userDefaults = [WastepaperBasketDefaults at];

    //: userDefaults.language = lang;
    userDefaults.language = lang;
    //: [[NTESLanguageManager shareInstance] setLanguagre:lang];
    [[MaxInformation beInstance] setInfoKey:lang];

    //: [AppleProjectKit sharedKit].languageBundle = nil;
    [Indicator reach].languageBundle = nil;

    //: [[NSNotificationCenter defaultCenter] postNotificationName:@"KEKENotificationLanguageChanged" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:StringFromFishData(&str_drivingOvertValue) object:nil];

    //: CCCAppDelegate *delegate = (CCCAppDelegate *)[UIApplication sharedApplication].delegate;
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //: if (delegate.deviceToken) {
    if (delegate.deviceToken) {
        //: [[NIMSDK sharedSDK] updateApnsToken:delegate.deviceToken
        [[NIMSDK sharedSDK] updateApnsToken:delegate.deviceToken
                           //: customContentKey:lang];
                           customContentKey:lang];

        //: dispatch_after(dispatch_time((0ull), (int64_t)(1 * 1000000000ull)), dispatch_get_main_queue(), ^{
        dispatch_after(dispatch_time((0ull), (int64_t)(1 * 1000000000ull)), dispatch_get_main_queue(), ^{
            //: id<NIMApnsManager> apnsManager = [[NIMSDK sharedSDK] apnsManager];
            id<NIMApnsManager> apnsManager = [[NIMSDK sharedSDK] apnsManager];
            //: NIMPushNotificationSetting *setting = [apnsManager currentSetting];
            NIMPushNotificationSetting *setting = [apnsManager currentSetting];
            //: setting.type = NIMPushNotificationDisplayTypeNoDetail;
            setting.type = NIMPushNotificationDisplayTypeNoDetail;

            //: [[NIMSDK sharedSDK].apnsManager updateApnsSetting:setting completion:^(NSError * _Nullable error) {
            [[NIMSDK sharedSDK].apnsManager updateApnsSetting:setting completion:^(NSError * _Nullable error) {
                //: if (error)
                if (error)
                {

                }
            //: }];
            }];
        //: });
        });
    }
}

//: - (NSString *)transformKey:(NSString *)key {
- (NSString *)keyImage:(NSString *)key {
    //: key = [key stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[key substringToIndex:1] uppercaseString]];
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[key substringToIndex:1] uppercaseString]];
    //: return [NSString stringWithFormat:@"NSUserDefault%@", key];
    return [NSString stringWithFormat:StringFromFishData(&str_entireData), key];
}
//: @end
@end

Byte *FishDataToByte(FishData *data) {
    if (data->throttle) return data->typicallyEnterprise;
    for (int i = 0; i < data->oven; i++) {
        data->typicallyEnterprise[i] ^= data->townJazz;
    }
    data->typicallyEnterprise[data->oven] = 0;
    data->throttle = true;
	if (data->oven >= 2) {
		data->hen = data->typicallyEnterprise[0];
		data->refugeeGain = data->typicallyEnterprise[1];
	}
    return data->typicallyEnterprise;
}

NSString *StringFromFishData(FishData *data) {
    return [NSString stringWithUTF8String:(char *)FishDataToByte(data)];
}
