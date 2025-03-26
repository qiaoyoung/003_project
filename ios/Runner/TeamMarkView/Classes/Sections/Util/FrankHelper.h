// __DEBUG__
// __CLOSE_PRINT__
//
//  FrankHelper.h
// Indicator
//
//  Created by chris on 2016/11/12.
//  Copyright © 2016年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @interface AAAKitFileLocationHelper : NSObject
@interface FrankHelper : NSObject

//: + (NSString *)getAppDocumentPath;
+ (NSString *)view;

//: + (NSString *)getAppTempPath;
+ (NSString *)image;

//: + (NSString *)userDirectory;
+ (NSString *)max;

//: + (NSString *)genFilenameWithExt:(NSString *)ext;
+ (NSString *)of:(NSString *)ext;

//: + (NSString *)filepathForVideo:(NSString *)filename;
+ (NSString *)manager:(NSString *)filename;

//: + (NSString *)filepathForImage:(NSString *)filename;
+ (NSString *)edge:(NSString *)filename;

//: @end
@end