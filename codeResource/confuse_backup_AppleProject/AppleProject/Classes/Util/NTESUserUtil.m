//
//  NTESUserUtil.m
//  NIM
//
//  Created by chris on 15/9/17.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NTESUserUtil.h"
#import "AAAKitUtil.h"

@implementation NTESUserUtil

+ (NSString *)genderString:(NIMUserGender)gender{
    NSString *genderStr = @"";
    switch (gender) {
        case NIMUserGenderMale:
            genderStr = LangKey(@"friend_info_activity_nan");
            break;
        case NIMUserGenderFemale:
            genderStr = LangKey(@"friend_info_activity_nv");
            break;
        case NIMUserGenderUnknown:
            genderStr = LangKey(@"friend_info_activity_xu");
        default:
            break;
    }
    return genderStr;
}

@end
