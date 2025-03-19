//
//  ZCHttpRequestHeader.h
//  ZCBusinessCar
//
//  Created by peng on 2021/2/24.
//

#import <Foundation/Foundation.h>

#define FXX_AppVersion                  @"1.0.0"//上架显示的版本号
#define CURRENT_APP_DOT_VERSION         @"1.0.0"//版本号
#define CURRENT_APP_VERSION             @"0100"
#define INT_CURRENT_APP_VERSION         @"100"
#define CURRENT_APP_TYPE                @"ios"
#define DISTRIBUTION_CHANNAL            @"app"
#define DEVICE_ID                       [[UIDevice currentDevice]uniqueDeviceIdentifier]


@interface ZCHttpRequestHeader : NSObject
+(NSDictionary *)getHeader;
+ (NSString *)getAppID;

+(NSString *)getIOSVersion;
+(NSString*)deviceVersion;
@end
