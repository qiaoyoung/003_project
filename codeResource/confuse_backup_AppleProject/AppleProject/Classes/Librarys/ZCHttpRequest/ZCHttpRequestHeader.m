//
//  ZCHttpRequestHeader.m
//  ZCBusinessCar
//
//  Created by peng on 2021/2/24.
//

#import "ZCHttpRequestHeader.h"
#import <net/if.h>
#import <sys/sysctl.h>
#import <net/if_dl.h>
#import "sys/utsname.h"

@implementation ZCHttpRequestHeader
+(NSDictionary *)getHeader
{
    
    NSString *appName    = @"Astrologie";
    NSString *appVersion = FXX_AppVersion;
    NSString *appid      = [self getAppID];
    NSString *channel    = @"App Store";
    NSString *deviceType = @"iphone";
    NSString *macAddress =  [self macaddress];
    NSString *netType    = [self getNetType];
    NSString *primaryKey = @"iPhone";//DEVICE_ID;
    NSString *sys        = @"I";
    NSString *version    = FXX_AppVersion;
    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];

    
    
    NSMutableDictionary*dic=[NSMutableDictionary dictionaryWithObjectsAndKeys:
                             appName,@"appName",
                             appVersion,@"appVersion",
                             channel,@"channel",
                             macAddress,@"macAddress",
                             netType,@"netType",
                             primaryKey,@"primaryKey",
                             @"zh-CN", @"Accept-Language",
                             appid, @"APPID",
                             sys,@"sys",
                             netType,@"nettype",
                             version,@"version",
                             deviceType,@"deviceType",
                             uuid,@"deviceNumber",nil];
    //NIF_TRACE(@"%@",dic);
    return dic;
    
}



+ (NSString *)getAppID
{
    
    //    NSString *appId = [[NSUserDefaults standardUserDefaults] stringForKey:@"APPID"];
    //    if(appId != nil || [appId length]>0)
    //        return appId;
    
    UIDevice *device = [UIDevice currentDevice];
    NSString *appIDStr = @"";
    
    NSArray *lines = [device.systemVersion componentsSeparatedByString:@"."];
    
    NSString *firstNum;
    NSString *secondNum;
    
    if ([lines count] == 2) {
        if ([[lines objectAtIndex:0] intValue] < 10) {
            firstNum = [NSString stringWithFormat:@"0%@", [lines objectAtIndex:0]];
        } else {
            firstNum = [lines objectAtIndex:0];
        }
        
        secondNum = [NSString stringWithFormat:@"%@0",[lines objectAtIndex:1]];
        
        
    } else if ([lines count] == 3) {
        if ([[lines objectAtIndex:0] intValue] < 10) {
            firstNum = [NSString stringWithFormat:@"0%@", [lines objectAtIndex:0]];
        } else {
            firstNum = [lines objectAtIndex:0];
        }
        
        secondNum = [NSString stringWithFormat:@"%@%@", [lines objectAtIndex:1], [lines objectAtIndex:2]];
    } else {
        firstNum = @"00";
        secondNum = @"00";
    }
    appIDStr = [NSString stringWithFormat:@"I%@%@%@%@%@", firstNum, secondNum,CURRENT_APP_TYPE,CURRENT_APP_VERSION,DISTRIBUTION_CHANNAL];
    [[NSUserDefaults standardUserDefaults] setValue:appIDStr forKey:@"APPID"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    return appIDStr;
    
}

+ (NSString *) macaddress
{
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];

//    NSLog(@"outString:%@", outstring);
    
    free(buf);
    
    return [outstring uppercaseString];
}

+ (NSString *)getNetType{
    NSString *netType = @"G";
    netType = @"WIFI";

    return netType;
}


+(NSString *)getIOSVersion{
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    return phoneVersion;
}

+(NSString*)deviceVersion
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([deviceString isEqualToString:@"iPhone9,1"]) return @"iPhone 7";//国行、日版、港行
    
    if ([deviceString isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";//港行、国行
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone 7";//美版、台版
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";//美版、台版
    
    if ([deviceString isEqualToString:@"iPhone10,1"])   return @"iPhone 8";//国行(A1863)、日行(A1906)
    
    if ([deviceString isEqualToString:@"iPhone10,4"])   return @"iPhone 8";//美版(Global/A1905)
    
    if ([deviceString isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";//国行(A1864)、日行(A1898)
    
    if ([deviceString isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";//美版(Global/A1897)
    
    if ([deviceString isEqualToString:@"iPhone10,3"])   return @"iPhone X";//国行(A1865)、日行(A1902)
    
    if ([deviceString isEqualToString:@"iPhone10,6"])   return @"iPhone X";//美版(Global/A1901)


    if ([deviceString isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
    
    if ([deviceString isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
    
    if ([deviceString isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
    
    if ([deviceString isEqualToString:@"x86_64"])       return @"iPhone13";

    
      
    return deviceString;
}

@end
