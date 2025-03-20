
#import <Foundation/Foundation.h>
typedef struct {
    Byte speciallyBy;
    Byte *unite;
    unsigned int badlyBloc;
    bool axEager;
	int orationHello;
	int hullo;
	int matter;
} BurdenHelloData;

NSString *StringFromBurdenHelloData(BurdenHelloData *data);


//: image
BurdenHelloData str_genderValue = (BurdenHelloData){117, (Byte []){28, 24, 20, 18, 16, 170}, 5, false, 96, 187, 195};


//: merge
BurdenHelloData str_slatViewFranchiseValue = (BurdenHelloData){4, (Byte []){105, 97, 118, 99, 97, 173}, 5, false, 115, 45, 236};


//: video
BurdenHelloData str_animalContent = (BurdenHelloData){25, (Byte []){111, 112, 125, 124, 118, 83}, 5, false, 95, 250, 124};

// __DEBUG__
// __CLOSE_PRINT__
//
//  BubbleMaxContainer.m
//  NIM
//
//  Created by chris on 15/4/12.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESFileLocationHelper.h"
#import "BubbleMaxContainer.h"
//: #import <sys/stat.h>
#import <sys/stat.h>
//: #import "CCCConfig.h"
#import "IndueColor.h"

//: @interface NTESFileLocationHelper ()
@interface BubbleMaxContainer ()
//: + (NSString *)filepathForDir: (NSString *)dirname filename: (NSString *)filename;
+ (NSString *)tap: (NSString *)dirname filenameWith: (NSString *)filename;
//: @end
@end


//: @implementation NTESFileLocationHelper
@implementation BubbleMaxContainer
//: + (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
+ (BOOL)tinkle:(NSURL *)URL
{
    //: assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);


    //: NSError *error = nil;
    NSError *error = nil;
    //: BOOL success = [URL setResourceValue:@(YES)
    BOOL success = [URL setResourceValue:@(YES)
                                  //: forKey:NSURLIsExcludedFromBackupKey
                                  forKey:NSURLIsExcludedFromBackupKey
                                   //: error:&error];
                                   error:&error];
    //: if(!success)
    if(!success)
    {
    }
    //: return success;
    return success;

}
//: + (NSString *)getAppDocumentPath
+ (NSString *)will
{
    //: static NSString *appDocumentPath = nil;
    static NSString *appDocumentPath = nil;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: NSString *appKey = [[CCCConfig sharedConfig] appKey];
        NSString *appKey = [[IndueColor originAcross] appKey];
        //: NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        //: appDocumentPath= [[NSString alloc]initWithFormat:@"%@/%@/",[paths objectAtIndex:0],appKey];
        appDocumentPath= [[NSString alloc]initWithFormat:@"%@/%@/",[paths objectAtIndex:0],appKey];
        //: if (![[NSFileManager defaultManager] fileExistsAtPath:appDocumentPath])
        if (![[NSFileManager defaultManager] fileExistsAtPath:appDocumentPath])
        {
            //: [[NSFileManager defaultManager] createDirectoryAtPath:appDocumentPath
            [[NSFileManager defaultManager] createDirectoryAtPath:appDocumentPath
                                      //: withIntermediateDirectories:NO
                                      withIntermediateDirectories:NO
                                                       //: attributes:nil
                                                       attributes:nil
                                                            //: error:nil];
                                                            error:nil];
        }
        //: [NTESFileLocationHelper addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:appDocumentPath]];
        [BubbleMaxContainer tinkle:[NSURL fileURLWithPath:appDocumentPath]];
    //: });
    });
    //: return appDocumentPath;
    return appDocumentPath;

}

//: + (NSString *)getAppTempPath
+ (NSString *)sunnah
{
    //: return NSTemporaryDirectory();
    return NSTemporaryDirectory();
}

//: + (NSString *)userDirectory
+ (NSString *)person
{
    //: NSString *documentPath = [NTESFileLocationHelper getAppDocumentPath];
    NSString *documentPath = [BubbleMaxContainer will];
    //: NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
    NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
    //: if ([userID length] == 0)
    if ([userID length] == 0)
    {
    }
    //: NSString* userDirectory= [NSString stringWithFormat:@"%@%@/",documentPath,userID];
    NSString* userDirectory= [NSString stringWithFormat:@"%@%@/",documentPath,userID];
    //: if (![[NSFileManager defaultManager] fileExistsAtPath:userDirectory])
    if (![[NSFileManager defaultManager] fileExistsAtPath:userDirectory])
    {
        //: [[NSFileManager defaultManager] createDirectoryAtPath:userDirectory
        [[NSFileManager defaultManager] createDirectoryAtPath:userDirectory
                                  //: withIntermediateDirectories:NO
                                  withIntermediateDirectories:NO
                                                   //: attributes:nil
                                                   attributes:nil
                                                        //: error:nil];
                                                        error:nil];

    }
    //: return userDirectory;
    return userDirectory;
}

//: + (NSString *)resourceDir: (NSString *)resouceName
+ (NSString *)pressedMin: (NSString *)resouceName
{
    //: NSString *dir = [[NTESFileLocationHelper userDirectory] stringByAppendingPathComponent:resouceName];
    NSString *dir = [[BubbleMaxContainer person] stringByAppendingPathComponent:resouceName];
    //: if (![[NSFileManager defaultManager] fileExistsAtPath:dir])
    if (![[NSFileManager defaultManager] fileExistsAtPath:dir])
    {
        //: [[NSFileManager defaultManager] createDirectoryAtPath:dir
        [[NSFileManager defaultManager] createDirectoryAtPath:dir
                                  //: withIntermediateDirectories:NO
                                  withIntermediateDirectories:NO
                                                   //: attributes:nil
                                                   attributes:nil
                                                        //: error:nil];
                                                        error:nil];
    }
    //: return dir;
    return dir;
}


//: + (NSString *)filepathForVideo:(NSString *)filename
+ (NSString *)viewTemp:(NSString *)filename
{
    //: return [NTESFileLocationHelper filepathForDir:(@"video")
    return [BubbleMaxContainer tap:(StringFromBurdenHelloData(&str_animalContent))
                                     //: filename:filename];
                                     filenameWith:filename];
}

//: + (NSString *)filepathForImage:(NSString *)filename
+ (NSString *)enableRange:(NSString *)filename
{
    //: return [NTESFileLocationHelper filepathForDir:(@"image")
    return [BubbleMaxContainer tap:(StringFromBurdenHelloData(&str_genderValue))
                                     //: filename:filename];
                                     filenameWith:filename];
}

//: + (NSString *)filepathForMergeForwardFile:(NSString *)filename {
+ (NSString *)date:(NSString *)filename {
    //: return [NTESFileLocationHelper filepathForDir:(@"merge")
    return [BubbleMaxContainer tap:(StringFromBurdenHelloData(&str_slatViewFranchiseValue))
                                     //: filename:filename];
                                     filenameWith:filename];
}

//: + (NSString *)genFilenameWithExt:(NSString *)ext
+ (NSString *)smart:(NSString *)ext
{
    //: CFUUIDRef uuid = CFUUIDCreate(nil);
    CFUUIDRef uuid = CFUUIDCreate(nil);
    //: NSString *uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuid);
    NSString *uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuid);
    //: CFRelease(uuid);
    CFRelease(uuid);
    //: NSString *uuidStr = [[uuidString stringByReplacingOccurrencesOfString:@"-" withString:@""] lowercaseString];
    NSString *uuidStr = [[uuidString stringByReplacingOccurrencesOfString:@"-" withString:@""] lowercaseString];
    //: NSString *name = [NSString stringWithFormat:@"%@",uuidStr];
    NSString *name = [NSString stringWithFormat:@"%@",uuidStr];
    //: return [ext length] ? [NSString stringWithFormat:@"%@.%@",name,ext]:name;
    return [ext length] ? [NSString stringWithFormat:@"%@.%@",name,ext]:name;
}


//: #pragma mark - 辅助方法
#pragma mark - 辅助方法
//: + (NSString *)filepathForDir:(NSString *)dirname
+ (NSString *)tap:(NSString *)dirname
                    //: filename:(NSString *)filename
                    filenameWith:(NSString *)filename
{
    //: return [[NTESFileLocationHelper resourceDir:dirname] stringByAppendingPathComponent:filename];
    return [[BubbleMaxContainer pressedMin:dirname] stringByAppendingPathComponent:filename];
}

//: @end
@end

Byte *BurdenHelloDataToByte(BurdenHelloData *data) {
    if (data->axEager) return data->unite;
    for (int i = 0; i < data->badlyBloc; i++) {
        data->unite[i] ^= data->speciallyBy;
    }
    data->unite[data->badlyBloc] = 0;
    data->axEager = true;
	if (data->badlyBloc >= 3) {
		data->orationHello = data->unite[0];
		data->hullo = data->unite[1];
		data->matter = data->unite[2];
	}
    return data->unite;
}

NSString *StringFromBurdenHelloData(BurdenHelloData *data) {
    return [NSString stringWithUTF8String:(char *)BurdenHelloDataToByte(data)];
}
