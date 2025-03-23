
#import <Foundation/Foundation.h>
typedef struct {
    Byte dateSurgeon;
    Byte *recognise;
    unsigned int con;
    bool speciallyCarve;
	int walk;
	int conCede;
} LeapData;

NSString *StringFromLeapData(LeapData *data);


//: emoji_ios.plist
LeapData str_satisfactionValue = (LeapData){120, (Byte []){29, 21, 23, 18, 17, 39, 17, 23, 11, 86, 8, 20, 17, 11, 12, 229}, 15, false, 228, 54};


//: bundle
LeapData str_handleName = (LeapData){192, (Byte []){162, 181, 174, 164, 172, 165, 123}, 6, false, 161, 142};


//: NSUserDefaultLanguage
LeapData str_jazzFlavorTitle = (LeapData){196, (Byte []){138, 151, 145, 183, 161, 182, 128, 161, 162, 165, 177, 168, 176, 136, 165, 170, 163, 177, 165, 163, 161, 239}, 21, false, 212, 111};


//: %@.lproj
LeapData str_burdenDataGestureName = (LeapData){94, (Byte []){123, 30, 112, 50, 46, 44, 49, 52, 37}, 8, false, 136, 180};


//: en.lproj
LeapData str_improvementContentWorkoutData = (LeapData){111, (Byte []){10, 1, 65, 3, 31, 29, 0, 5, 219}, 8, false, 131, 161};


//: emoji.plist
LeapData str_qualifyAuthorityData = (LeapData){127, (Byte []){26, 18, 16, 21, 22, 81, 15, 19, 22, 12, 11, 51}, 11, false, 100, 241};


//: AppleProjectEmoticon
LeapData str_commissionShouldValue = (LeapData){216, (Byte []){153, 168, 168, 180, 189, 136, 170, 183, 178, 189, 187, 172, 157, 181, 183, 172, 177, 187, 183, 182, 5}, 20, false, 225, 245};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NSBundle+NIMKit.m
// Indicator
//
//  Created by Genning-Work on 2019/11/14.
//  Copyright © 2019 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NSBundle+AppleProjectKit.h"
#import "NSBundle+Indicator.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "UserInputEmoticonDefine.h"
#import "UserInputEmoticonDefine.h"
//: #import "SSZipArchiveManager.h"
#import "EnableChildWith.h"

//: @implementation NSBundle (AppleProjectKit)
@implementation NSBundle (Indicator)

//: + (NSBundle *)nim_defaultEmojiBundle {
+ (NSBundle *)show {
    //: NSBundle *bundle = [NSBundle bundleForClass:[AppleProjectKit class]];
    NSBundle *bundle = [NSBundle bundleForClass:[Indicator class]];
    //: NSURL *url = [bundle URLForResource:@"AppleProjectEmoticon" withExtension:@"bundle"];
    NSURL *url = [bundle URLForResource:StringFromLeapData(&str_commissionShouldValue) withExtension:StringFromLeapData(&str_handleName)];
    //: NSBundle *emojiBundle = [NSBundle bundleWithURL:url];
    NSBundle *emojiBundle = [NSBundle bundleWithURL:url];
    //: return emojiBundle;
    return emojiBundle;
}

//: + (NSBundle *)nim_defaultLanguageBundle {
+ (NSBundle *)by {
    // 获取语言资源所在路径
    //: NSString *lprojPath = [[SSZipArchiveManager sharedManager] getLprojPath];
    NSString *lprojPath = [[EnableChildWith containerMessage] recordShow];
    //: if (!lprojPath || ![lprojPath length]) {
    if (!lprojPath || ![lprojPath length]) {
        //: return nil;
        return nil;
    }

    // 构建完整的语言资源路径
    //: NSString *languageName = [self preferredLanguage];
    NSString *languageName = [self callLanguage];
    //: NSString *fullLprojPath = [lprojPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.lproj", languageName]];
    NSString *fullLprojPath = [lprojPath stringByAppendingPathComponent:[NSString stringWithFormat:StringFromLeapData(&str_burdenDataGestureName), languageName]];

    // 检查路径是否存在
    //: if (![[NSFileManager defaultManager] fileExistsAtPath:fullLprojPath]) {
    if (![[NSFileManager defaultManager] fileExistsAtPath:fullLprojPath]) {
        // 如果指定语言的资源不存在，尝试使用默认语言（英语）
        //: fullLprojPath = [lprojPath stringByAppendingPathComponent:@"en.lproj"];
        fullLprojPath = [lprojPath stringByAppendingPathComponent:StringFromLeapData(&str_improvementContentWorkoutData)];
        //: if (![[NSFileManager defaultManager] fileExistsAtPath:fullLprojPath]) {
        if (![[NSFileManager defaultManager] fileExistsAtPath:fullLprojPath]) {
            //: return nil;
            return nil;
        }
    }

    // 创建并返回语言资源包
    //: return [NSBundle bundleWithPath:fullLprojPath];
    return [NSBundle bundleWithPath:fullLprojPath];
}

//: + (NSString *)nim_EmojiPlistFile {
+ (NSString *)pull {
    //: NSString *emojiPath = [[SSZipArchiveManager sharedManager] getEmojiPath];
    NSString *emojiPath = [[EnableChildWith containerMessage] withSize];
    //: NSString *plistPath = [emojiPath stringByAppendingPathComponent:@"emoji_ios.plist"];
    NSString *plistPath = [emojiPath stringByAppendingPathComponent:StringFromLeapData(&str_satisfactionValue)];
    //: if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
    if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        //: return plistPath;
        return plistPath;
    }
    //: return @"";
    return @"";
//    NSBundle *bundle = [Indicator sharedKit].emoticonBundle;
//    NSString *filepath = [bundle pathForResource:@"emoji_ios" ofType:@"plist" inDirectory:NEEKIT_EmojiPath];
//    return filepath;
}


//: + (NSString *)nim_EmojiGifPlistFile {
+ (NSString *)characteristicRootOfASquareMatrix {
    //: NSString *emojiPath = [[SSZipArchiveManager sharedManager] getEmojiPath];
    NSString *emojiPath = [[EnableChildWith containerMessage] withSize];
    //: NSString *plistPath = [emojiPath stringByAppendingPathComponent:@"emoji.plist"];
    NSString *plistPath = [emojiPath stringByAppendingPathComponent:StringFromLeapData(&str_qualifyAuthorityData)];
    //: if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
    if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        //: return plistPath;
        return plistPath;
    }
    //: return @"";
    return @"";
//    NSBundle *bundle = [Indicator sharedKit].emoticonBundle;
//    NSString *filepath = [bundle pathForResource:@"emoji" ofType:@"plist" inDirectory:NEEKIT_EmojiPath];
//    return filepath;
}

//+ (NSString *)nim_EmojiImage:(NSString *)imageName {
//    NSBundle *bundle = [Indicator sharedKit].emoticonBundle;
//    NSString *ext = [imageName pathExtension];
//    if (ext.length == 0) {
//        ext = @"png";
//    }
//    NSString *name = [imageName stringByDeletingPathExtension];
//    NSString *doubleImage  = [name stringByAppendingString:@"@2x"];
//    NSString *tribleImage  = [name stringByAppendingString:@"@3x"];
//    NSString *path = nil;
//    if ([UIScreen mainScreen].scale == 3.0) {
//        path = [bundle pathForResource:tribleImage ofType:ext inDirectory:NEEKIT_EmojiPath];
//    }
//    path = path ? path : [bundle pathForResource:doubleImage ofType:ext inDirectory:NEEKIT_EmojiPath]; //取二倍图
//    path = path ? path : [bundle pathForResource:name ofType:ext inDirectory:NEEKIT_EmojiPath]; //实在没了就去取一倍图
//    return path;
//}

//: + (NSString *)preferredLanguage
+ (NSString *)callLanguage
{

    //: NSString *lang = [[NSUserDefaults standardUserDefaults] objectForKey:@"NSUserDefaultLanguage"];
    NSString *lang = [[NSUserDefaults standardUserDefaults] objectForKey:StringFromLeapData(&str_jazzFlavorTitle)];
    //: if (lang.length <= 0) {
    if (lang.length <= 0) {
        //: lang = @"en";
        lang = @"en";
    }
//    NSString * preferredLanguage = [NSLocale preferredLanguages].firstObject;
//    if ([preferredLanguage rangeOfString:@"zh-Hans"].location != NSNotFound) {
//        preferredLanguage = @"zh";
//    } else {
//        preferredLanguage = @"en";
//    }

    //: return lang;
    return lang;
}


//: @end
@end

Byte *LeapDataToByte(LeapData *data) {
    if (data->speciallyCarve) return data->recognise;
    for (int i = 0; i < data->con; i++) {
        data->recognise[i] ^= data->dateSurgeon;
    }
    data->recognise[data->con] = 0;
    data->speciallyCarve = true;
	if (data->con >= 2) {
		data->walk = data->recognise[0];
		data->conCede = data->recognise[1];
	}
    return data->recognise;
}

NSString *StringFromLeapData(LeapData *data) {
    return [NSString stringWithUTF8String:(char *)LeapDataToByte(data)];
}
