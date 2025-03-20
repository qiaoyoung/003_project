//
//  SNDevice.m
//  sohunews
//
//  Created by lhp on 9/24/14.
//  Copyright (c) 2014 Sohu.com. All rights reserved.
//

#import "SNDevice.h"
#import "SAMKeychain.h"

#include <sys/sysctl.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <sys/dirent.h>
#include <sys/utsname.h>
#include <mach/mach.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <arpa/inet.h>
#include <ifaddrs.h>

#import <CoreTelephony/CTTelephonyNetworkInfo.h> // 获取设备运营商
#import <CoreTelephony/CTCarrier.h> // 获取设备运营商
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/ASIdentifierManager.h>

#define kUserDefult_UserProtocol            @"kUserDefult_UserProtocol"
#define kProfileClientIDKey @"client id"
#define kProfileCookieKey @"s_ookie"
#define kSystemAdDisabledDefaultIDFA        (@"00000000-0000-0000-0000-000000000000")
#define kIdfaOpen @"idfaOpen"
#define kIdfaOpen_New @"kIdfaOpen_New"

/// 存储客户端生成的IUUID
#define SNUserDefault_Key_IUUID @"SNUserDefault_Key_IUUID"

#define SNKey @"SNKey_tyl"


@interface SNDevice ()
@property (nonatomic, copy) NSString *iuuid;
@property (nonatomic, copy) NSString *udid;
@property (nonatomic, copy) NSString *idfv;
@end


@implementation SNDevice

+ (SNDevice *)sharedInstance {
    static SNDevice *_sharedDevice = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDevice = [[SNDevice alloc] init];
    });
    return _sharedDevice;
}


- (NSString *)idfv {
    if (_idfv.length <= 0) {
        _idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    return _idfv;
}

/*
 IDFA:广告标示符，适用于对外：例如广告推广，换量等跨应用的用户追踪等,如果用户完全重置系统（(设置程序 -> 通用 -> 还原 -> 还原位置与隐私) ，这个广告标示符会重新生成。另外如果用户明确的还原广告(设置程序-> 通用 -> 关于本机 -> 广告 -> 还原广告标示符) ，那么广告标示符也会重新生成;若果用户在隐私->广告->限制广告跟踪，开关开启，则取不到IDFA
 注：iOS 10  弱开启限制广告标示符后，取到的为 00000000-0000-0000-0000-000000000000
 */

//static NSString* sohunews_IDFA = nil;
//+ (NSString *)deviceIDFA {
//    
//    if (sohunews_IDFA) {
//        return sohunews_IDFA;
//    }
//    BOOL idfaOpen = [[NSUserDefaults standardUserDefaults] boolForKey:kIdfaOpen];
//    if (@available(iOS 14, *)) {
//        // iOS14及以上版本需要先请求权限
//        pthread_mutex_lock(&kUIDeviceHardware_deviceIDFA_mutex_0);
//        if(idfaOpen) {
//            if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
//                [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
//                    // 获取到权限后，依然使用老方法获取idfa
//                    if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
//                        NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
//                        sohunews_IDFA = idfa;
//                    }
//                }];
//            }
//        }
//        pthread_mutex_unlock(&kUIDeviceHardware_deviceIDFA_mutex_0);
//    }
//    // iOS14以下版本依然使用老方法
//    else if (NSClassFromString(@"ASIdentifierManager")) {
//        pthread_mutex_lock(&kUIDeviceHardware_deviceIDFA_mutex_0);
//        NSString *IDFA = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//        sohunews_IDFA = IDFA;
//        pthread_mutex_unlock(&kUIDeviceHardware_deviceIDFA_mutex_0);
//        return IDFA;
//    }
//    
//    return @"";
//}


static NSString *iuuid = nil;
+ (NSString *)deviceIUUID {
    if (iuuid.length <= 0) {
        iuuid = [SAMKeychain passwordForService:SNUserDefault_Key_IUUID account:SNKey];
        if (iuuid.length <= 0) {
            [self updateDeviceIUUID];
        }
    }
    return iuuid;
}


+ (void)updateDeviceIUUID {
    
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    iuuid = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
    CFRelease(uuidRef);
    [SAMKeychain setPassword:iuuid forService:SNUserDefault_Key_IUUID account:SNKey];
}



#pragma mark - CAID

static time_t bootSecTime() {
    struct timeval boottime;
    size_t len = sizeof(boottime);
    int mib[2] = { CTL_KERN, KERN_BOOTTIME};
    if ( sysctl(mib, 2, &boottime, &len, NULL, 0) < 0) {
        return 0;
    }
    return boottime.tv_sec;
}

/// 设备启动时间
+ (NSString *)bootTimeInSec
{
    return [NSString stringWithFormat:@"%ld",bootSecTime()];
}
//get system uptime since last boot 获取系统当前运行了多长时间
+ (NSTimeInterval)uptime
{
    struct timeval boottime;
    int mib[2] = {CTL_KERN, KERN_BOOTTIME};
    size_t size = sizeof(boottime);
    struct timeval now;
    struct timezone tz;
    gettimeofday(&now, &tz);
    double uptime = -1;
    if (sysctl(mib, 2, &boottime, &size, NULL, 0) != -1 && boottime.tv_sec != 0)
    {
        uptime = now.tv_sec - boottime.tv_sec;
        uptime += (double)(now.tv_usec - boottime.tv_usec) / 1000000.0;
    }
    return uptime;
}


/// 国家
+ (NSString *)countryCode
{
    NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey:NSLocaleCountryCode]; return countryCode;
}

/// 语言
+ (NSString *)language {
    NSString *language;
    NSLocale *locale = [NSLocale currentLocale];
    if ([[NSLocale preferredLanguages] count] > 0) {
        language = [[NSLocale preferredLanguages]objectAtIndex:0];
    } else {
        language = [locale objectForKey:NSLocaleLanguageCode];
    }
    return language;
}



/// 运营商
+(NSString* )carrierInfo {
#if TARGET_IPHONE_SIMULATOR
    return @"SIMULATOR";
#else
    static dispatch_queue_t _queue;
    static dispatch_once_t once; dispatch_once(&once, ^{
        _queue = dispatch_queue_create([[NSString stringWithFormat:@"com.carr.%@", self] UTF8String], NULL);
    });
    __block NSString* carr=nil;
    dispatch_semaphore_t semaphore =dispatch_semaphore_create(0);
    dispatch_async(_queue, ^(){
        CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
        CTCarrier *carrier = nil;
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 12.1) {
            if ([info respondsToSelector:@selector(serviceSubscriberCellularProviders)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
                
                NSArray *carrierKeysArray = [info.serviceSubscriberCellularProviders.allKeys sortedArrayUsingSelector:@selector(compare:)];
                carrier = info.serviceSubscriberCellularProviders[carrierKeysArray.firstObject];
                if (!carrier.mobileNetworkCode) {
                    carrier = info.serviceSubscriberCellularProviders[carrierKeysArray.lastObject];
                }
#pragma clang diagnostic pop
            }
        }
        if(!carrier) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            carrier = info.subscriberCellularProvider;
#pragma clang diagnostic pop
        }
        if (carrier != nil) {
            NSString *networkCode = [carrier mobileNetworkCode];
            NSString *countryCode = [carrier mobileCountryCode];
            if (countryCode && [countryCode isEqualToString:@"460"] &&networkCode) {
                if ([networkCode isEqualToString:@"00"]||
                    [networkCode isEqualToString:@"02"]||
                    [networkCode isEqualToString:@"07"]||
                    [networkCode isEqualToString:@"08"]) {
                    carr= @"中国移动";
                }
                if ([networkCode isEqualToString:@"01"]||
                    [networkCode isEqualToString:@"06"]||
                    [networkCode isEqualToString:@"09"]) {
                    carr= @"中国联通";
                }
                if ([networkCode isEqualToString:@"03"] ||
                    [networkCode isEqualToString:@"05"]||
                    [networkCode isEqualToString:@"11"]) {
                    carr= @"中国电信";
                }
                if ([networkCode isEqualToString:@"04"]) {
                    carr= @"中国卫通";
                }
                if ([networkCode isEqualToString:@"20"]){
                    carr= @"中国铁通";
                }
            } else {
                carr = [carrier.carrierName copy];
            }
        }
        if (carr.length <= 0) {
            carr = @"unknown";
        }
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, 0.5*NSEC_PER_SEC);
    dispatch_semaphore_wait(semaphore, t);
    return [carr copy];
#endif
}


/// 系统更新时间
+ (NSString *)sysFileTime
{
    NSString *result = nil;
    NSString *information = @"L3Zhci9tb2JpbGUvTGlicmFyeS9Vc2VyQ29uZmlndXJhdGlvblByb2ZpbGVzL1B1YmxpY0luZm8vTUNNZXRhLnBsaXN0";
    NSData *data=[[NSData alloc]initWithBase64EncodedString:information options:0] ;
    NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:dataString error:&error];
    if (fileAttributes) {
        id singleAttibute = [fileAttributes objectForKey:NSFileCreationDate];
        if ([singleAttibute isKindOfClass:[NSDate class]]) {
            NSDate *dataDate = singleAttibute;
            result = [NSString stringWithFormat:@"%f",[dataDate timeIntervalSince1970]];
        }
    }
    return result;
}


///时区
+ (NSString *)timeZone
{
    NSInteger offset = [NSTimeZone systemTimeZone].secondsFromGMT;
    return [NSString stringWithFormat:@"%ld",(long)offset];
}


@end
