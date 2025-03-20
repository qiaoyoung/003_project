
#import <Foundation/Foundation.h>

NSString *StringFromFlavorData(Byte *data);


//: WIFI
Byte str_enterpriseTitle[] = {86, 4, 9, 137, 174, 168, 174, 102, 60, 73, 70, 73, 87, 174};


//: iPhone
Byte str_porkValue[] = {85, 6, 3, 101, 110, 111, 104, 80, 105, 126};

// __DEBUG__
// __CLOSE_PRINT__
//
//  StateDevice.m
//  NIM
//
//  Created by chris on 15/9/18.
//  Copyright © 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESDevice.h"
#import "StateDevice.h"
//: #import "Reachability.h"
#import "Reachability.h"
//: #import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
//: #import <sys/sysctl.h>
#import <sys/sysctl.h>
//: #import <sys/utsname.h>
#import <sys/utsname.h>

//: @interface NTESDevice ()
@interface StateDevice ()

//: @property (nonatomic,copy) NSDictionary *networkTypes;
@property (nonatomic,copy) NSDictionary *networkTypes;

//: @end
@end

//: @implementation NTESDevice
@implementation StateDevice

//: - (instancetype)init
- (instancetype)init
{
    //: if (self = [super init])
    if (self = [super init])
    {
        //: [self buildDeviceInfo];
        [self blue];
    }
    //: return self;
    return self;
}


//: + (NTESDevice *)currentDevice{
+ (StateDevice *)straddle{
    //: static NTESDevice *instance = nil;
    static StateDevice *instance = nil;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: instance = [[NTESDevice alloc] init];
        instance = [[StateDevice alloc] init];
    //: });
    });
    //: return instance;
    return instance;
}

//: - (void)buildDeviceInfo
- (void)blue
{
    //: _networkTypes = @{
    _networkTypes = @{
                          //: CTRadioAccessTechnologyGPRS:@(NTESNetworkType2G),
                          CTRadioAccessTechnologyGPRS:@(NTESNetworkType2G),
                          //: CTRadioAccessTechnologyEdge:@(NTESNetworkType2G),
                          CTRadioAccessTechnologyEdge:@(NTESNetworkType2G),
                          //: CTRadioAccessTechnologyWCDMA:@(NTESNetworkType3G),
                          CTRadioAccessTechnologyWCDMA:@(NTESNetworkType3G),
                          //: CTRadioAccessTechnologyHSDPA:@(NTESNetworkType3G),
                          CTRadioAccessTechnologyHSDPA:@(NTESNetworkType3G),
                          //: CTRadioAccessTechnologyHSUPA:@(NTESNetworkType3G),
                          CTRadioAccessTechnologyHSUPA:@(NTESNetworkType3G),
                          //: CTRadioAccessTechnologyCDMA1x:@(NTESNetworkType3G),
                          CTRadioAccessTechnologyCDMA1x:@(NTESNetworkType3G),
                          //: CTRadioAccessTechnologyCDMAEVDORev0:@(NTESNetworkType3G),
                          CTRadioAccessTechnologyCDMAEVDORev0:@(NTESNetworkType3G),
                          //: CTRadioAccessTechnologyCDMAEVDORevA:@(NTESNetworkType3G),
                          CTRadioAccessTechnologyCDMAEVDORevA:@(NTESNetworkType3G),
                          //: CTRadioAccessTechnologyCDMAEVDORevB:@(NTESNetworkType3G),
                          CTRadioAccessTechnologyCDMAEVDORevB:@(NTESNetworkType3G),
                          //: CTRadioAccessTechnologyeHRPD:@(NTESNetworkType3G),
                          CTRadioAccessTechnologyeHRPD:@(NTESNetworkType3G),
                          //: CTRadioAccessTechnologyLTE:@(NTESNetworkType4G),
                          CTRadioAccessTechnologyLTE:@(NTESNetworkType4G),
                     //: };
                     };

}


//图片/音频推荐参数
//: - (CGFloat)suggestImagePixels{
- (CGFloat)allowButton{
    //: return (1280 * 960);
    return (1280 * 960);
}

//: - (CGFloat)compressQuality{
- (CGFloat)sharedColor{
    //: return 0.5;
    return 0.5;
}


//App状态
//: - (BOOL)isUsingWifi{
- (BOOL)size{
    //: Reachability *reachability = [Reachability reachabilityForInternetConnection];
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    //: NetworkStatus status = [reachability currentReachabilityStatus];
    NetworkStatus status = [reachability currentReachabilityStatus];
    //: return status == ReachableViaWiFi;
    return status == ReachableViaWiFi;
}

//: - (BOOL)isInBackground{
- (BOOL)rangeWith{
    //: return [[UIApplication sharedApplication] applicationState] != UIApplicationStateActive;
    return [[UIApplication sharedApplication] applicationState] != UIApplicationStateActive;
}

//: - (NTESNetworkType)currentNetworkType{
- (NTESNetworkType)kit{
    //: Reachability *reachability = [Reachability reachabilityForInternetConnection];
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    //: NetworkStatus status = [reachability currentReachabilityStatus];
    NetworkStatus status = [reachability currentReachabilityStatus];
    //: switch (status) {
    switch (status) {
        //: case ReachableViaWiFi:
        case ReachableViaWiFi:
            //: return NTESNetworkTypeWifi;
            return NTESNetworkTypeWifi;
        //: case ReachableViaWWAN:
        case ReachableViaWWAN:
        {
            //: CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
            CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
            //: NSNumber *number = [_networkTypes objectForKey:telephonyInfo.currentRadioAccessTechnology];
            NSNumber *number = [_networkTypes objectForKey:telephonyInfo.currentRadioAccessTechnology];
            //: return number ? (NTESNetworkType)[number integerValue] : NTESNetworkTypeWwan;
            return number ? (NTESNetworkType)[number integerValue] : NTESNetworkTypeWwan;
        }
        //: default:
        default:
            //: return NTESNetworkTypeUnknown;
            return NTESNetworkTypeUnknown;
    }
}


//: - (NSString *)networkStatus:(NTESNetworkType)networkType
- (NSString *)graduateIsland:(NTESNetworkType)networkType
{
    //: switch (networkType) {
    switch (networkType) {
        //: case NTESNetworkType2G:
        case NTESNetworkType2G:
            //: return @"2G";
            return @"2G";
        //: case NTESNetworkType3G:
        case NTESNetworkType3G:
            //: return @"3G";
            return @"3G";
        //: case NTESNetworkType4G:
        case NTESNetworkType4G:
            //: return @"4G";
            return @"4G";
        //: default:
        default:
            //: return @"WIFI";
            return StringFromFlavorData(str_enterpriseTitle);
    }
}

//: - (NSInteger)cpuCount{
- (NSInteger)sub{
    //: size_t size = sizeof(int);
    size_t size = sizeof(int);
    //: int results;
    int results;

    //: int mib[2] = {6, 3};
    int mib[2] = {6, 3};
    //: sysctl(mib, 2, &results, &size, NULL, 0);
    sysctl(mib, 2, &results, &size, NULL, 0);
    //: return (NSUInteger) results;
    return (NSUInteger) results;
}

//: - (BOOL)isLowDevice{
- (BOOL)perspectiveDevice{



    //: return [[NSProcessInfo processInfo] processorCount] <= 1;
    return [[NSProcessInfo processInfo] processorCount] <= 1;

}

//: - (BOOL)isIphone{
- (BOOL)action{
    //: NSString *deviceModel = [UIDevice currentDevice].model;
    NSString *deviceModel = [UIDevice currentDevice].model;
    //: if ([deviceModel isEqualToString:@"iPhone"]) {
    if ([deviceModel isEqualToString:StringFromFlavorData(str_porkValue)]) {
        //: return YES;
        return YES;
    //: }else {
    }else {
        //: return NO;
        return NO;
    }
}

//: - (NSString *)machineName{
- (NSString *)placeName{
    //: struct utsname systemInfo;
    struct utsname systemInfo;
    //: uname(&systemInfo);
    uname(&systemInfo);
    //: return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}


//: - (CGFloat)statusBarHeight{
- (CGFloat)cinema{
    //: return [UIDevice vg_statusBarHeight];
    return [UIDevice task];
}


//: @end
@end

Byte * FlavorDataToCache(Byte *data) {
    int nationalistLeaderMinimum = data[0];
    int statusPopular = data[1];
    int statusSpecialize = data[2];
    if (!nationalistLeaderMinimum) return data + statusSpecialize;
    for (int i = 0; i < statusPopular / 2; i++) {
        int begin = statusSpecialize + i;
        int end = statusSpecialize + statusPopular - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[statusSpecialize + statusPopular] = 0;
    return data + statusSpecialize;
}

NSString *StringFromFlavorData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)FlavorDataToCache(data)];
}  
