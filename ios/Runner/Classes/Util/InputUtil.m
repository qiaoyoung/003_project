
#import <Foundation/Foundation.h>

NSString *StringFromNeitherWeekendData(Byte *data);


//: friend_info_activity_nv
Byte str_increasingTitle[] = {34, 23, 8, 205, 86, 52, 69, 50, 118, 110, 95, 121, 116, 105, 118, 105, 116, 99, 97, 95, 111, 102, 110, 105, 95, 100, 110, 101, 105, 114, 102, 198};


//: friend_info_activity_xu
Byte str_cellWipeValue[] = {5, 23, 12, 59, 89, 162, 225, 195, 105, 88, 215, 42, 117, 120, 95, 121, 116, 105, 118, 105, 116, 99, 97, 95, 111, 102, 110, 105, 95, 100, 110, 101, 105, 114, 102, 49};


//: friend_info_activity_nan
Byte str_onlyValue[] = {49, 24, 11, 163, 131, 73, 20, 246, 253, 81, 156, 110, 97, 110, 95, 121, 116, 105, 118, 105, 116, 99, 97, 95, 111, 102, 110, 105, 95, 100, 110, 101, 105, 114, 102, 142};

// __DEBUG__
// __CLOSE_PRINT__
//
//  InputUtil.m
//  NIM
//
//  Created by chris on 15/9/17.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESUserUtil.h"
#import "InputUtil.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"

//: @implementation NTESUserUtil
@implementation InputUtil

//: + (NSString *)genderString:(NIMUserGender)gender{
+ (NSString *)colorImage:(NIMUserGender)gender{
    //: NSString *genderStr = @"";
    NSString *genderStr = @"";
    //: switch (gender) {
    switch (gender) {
        //: case NIMUserGenderMale:
        case NIMUserGenderMale:
            //: genderStr = [NTESLanguageManager getTextWithKey:@"friend_info_activity_nan"];
            genderStr = [MaxInformation off:StringFromNeitherWeekendData(str_onlyValue)];
            //: break;
            break;
        //: case NIMUserGenderFemale:
        case NIMUserGenderFemale:
            //: genderStr = [NTESLanguageManager getTextWithKey:@"friend_info_activity_nv"];
            genderStr = [MaxInformation off:StringFromNeitherWeekendData(str_increasingTitle)];
            //: break;
            break;
        //: case NIMUserGenderUnknown:
        case NIMUserGenderUnknown:
            //: genderStr = [NTESLanguageManager getTextWithKey:@"friend_info_activity_xu"];
            genderStr = [MaxInformation off:StringFromNeitherWeekendData(str_cellWipeValue)];
        //: default:
        default:
            //: break;
            break;
    }
    //: return genderStr;
    return genderStr;
}

//: @end
@end

Byte * NeitherWeekendDataToCache(Byte *data) {
    int exhibitLucky = data[0];
    int staticMagnet = data[1];
    int advise = data[2];
    if (!exhibitLucky) return data + advise;
    for (int i = 0; i < staticMagnet / 2; i++) {
        int begin = advise + i;
        int end = advise + staticMagnet - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[advise + staticMagnet] = 0;
    return data + advise;
}

NSString *StringFromNeitherWeekendData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)NeitherWeekendDataToCache(data)];
}  
