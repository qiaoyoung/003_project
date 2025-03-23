// __DEBUG__
// __CLOSE_PRINT__
//
//  BubbleMaxContainer.h
//  NIM
//
//  Created by chris on 15/4/12.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @interface NTESFileLocationHelper : NSObject
@interface BubbleMaxContainer : NSObject

//: + (NSString *)getAppDocumentPath;
+ (NSString *)will;

//: + (NSString *)getAppTempPath;
+ (NSString *)sunnah;

//: + (NSString *)userDirectory;
+ (NSString *)person;

//: + (NSString *)genFilenameWithExt:(NSString *)ext;
+ (NSString *)smart:(NSString *)ext;

//: + (NSString *)filepathForVideo:(NSString *)filename;
+ (NSString *)viewTemp:(NSString *)filename;

//: + (NSString *)filepathForImage:(NSString *)filename;
+ (NSString *)enableRange:(NSString *)filename;

//: + (NSString *)filepathForMergeForwardFile:(NSString *)filename;
+ (NSString *)date:(NSString *)filename;

//: @end
@end