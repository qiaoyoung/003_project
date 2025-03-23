
#import <Foundation/Foundation.h>
typedef struct {
    Byte ritualText;
    Byte *sharedWaste;
    unsigned int totalroduce;
    bool yardPopular;
	int camp;
	int country;
	int recognizeValue;
} CameraData;

NSString *StringFromCameraData(CameraData *data);


//: tyl_NTESLoginData
CameraData str_threadHearingText = (CameraData){160, (Byte []){212, 217, 204, 255, 238, 244, 229, 243, 236, 207, 199, 201, 206, 228, 193, 212, 193, 22}, 17, false, 21, 242, 111};

// __DEBUG__
// __CLOSE_PRINT__
//
//  FromMarkManager.m
//  NIM
//
//  Created by amao on 5/26/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCLoginManager.h"
#import "FromMarkManager.h"
//: #import "NTESFileLocationHelper.h"
#import "BubbleMaxContainer.h"

//: @interface NTESLoginData ()
@interface UpDataBubble ()

//: @end
@end

//: @implementation NTESLoginData
@implementation UpDataBubble

//: - (BOOL)isValid {
- (BOOL)session {
    //: if (_authType == NIMSDKAuthTypeDefault) {
    if (_authType == NIMSDKAuthTypeDefault) {
        //: return [_account length] && [_token length];
        return [_account length] && [_token length];
    }

    //: if (_authType == NIMSDKAuthTypeDynamicToken) {
    if (_authType == NIMSDKAuthTypeDynamicToken) {
        //: return [_account length] && [_token length];
        return [_account length] && [_token length];
    }

    //: if (_authType == NIMSDKAuthTypeThirdParty) {
    if (_authType == NIMSDKAuthTypeThirdParty) {
        //: return [_account length] && [_token length] && [_loginExtension length];
        return [_account length] && [_token length] && [_loginExtension length];
    }

    //: return NO;
    return NO;
}
//: @end
@end



//: @implementation CCCLoginManager
@implementation FromMarkManager

//: + (instancetype)sharedManager
+ (instancetype)rounderMargin
{
    //: static CCCLoginManager *instance = nil;
    static FromMarkManager *instance = nil;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: instance = [[CCCLoginManager alloc] init];
        instance = [[FromMarkManager alloc] init];
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
        //: [self readData];
        [self command];
    }
    //: return self;
    return self;
}


//: - (void)setCurrentLoginData:(NTESLoginData *)currentLoginData
- (void)setCurrentLoginData:(UpDataBubble *)currentLoginData
{
    //: _currentLoginData = currentLoginData;
    _currentLoginData = currentLoginData;
    //: [self saveData];
    [self green];
}

//从文件中读取和保存用户名密码,建议上层开发对这个地方做加密,DEMO只为了做示范,所以没加密
//: - (void)readData
- (void)command
{
    //: NSDictionary *loginDataDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"tyl_NTESLoginData"];
    NSDictionary *loginDataDic = [[NSUserDefaults standardUserDefaults] objectForKey:StringFromCameraData(&str_threadHearingText)];
    //: if (loginDataDic) {
    if (loginDataDic) {
        //: _currentLoginData = [NTESLoginData yy_modelWithDictionary:loginDataDic];
        _currentLoginData = [UpDataBubble yy_modelWithDictionary:loginDataDic];
    }
}

//: - (void)saveData
- (void)green
{
    //: if (_currentLoginData)
    if (_currentLoginData)
    {
        //: [[NSUserDefaults standardUserDefaults] setObject:[_currentLoginData yy_modelToJSONObject] forKey:@"tyl_NTESLoginData"];
        [[NSUserDefaults standardUserDefaults] setObject:[_currentLoginData yy_modelToJSONObject] forKey:StringFromCameraData(&str_threadHearingText)];
    }
}


//: @end
@end

Byte *CameraDataToByte(CameraData *data) {
    if (data->yardPopular) return data->sharedWaste;
    for (int i = 0; i < data->totalroduce; i++) {
        data->sharedWaste[i] ^= data->ritualText;
    }
    data->sharedWaste[data->totalroduce] = 0;
    data->yardPopular = true;
	if (data->totalroduce >= 3) {
		data->camp = data->sharedWaste[0];
		data->country = data->sharedWaste[1];
		data->recognizeValue = data->sharedWaste[2];
	}
    return data->sharedWaste;
}

NSString *StringFromCameraData(CameraData *data) {
    return [NSString stringWithUTF8String:(char *)CameraDataToByte(data)];
}
