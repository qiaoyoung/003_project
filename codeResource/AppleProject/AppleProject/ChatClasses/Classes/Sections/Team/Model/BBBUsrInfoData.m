//
//  UsrInfoData.m
//  NIM
//
//  Created by Xuhui on 15/3/19.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "BBBUsrInfoData.h"
#import "AAASpellingCenter.h"
#import "AppleProjectKit.h"

@implementation AppleProjectUsrInfo

- (BOOL)isFriend {
    NSArray *friends = [NIMSDK sharedSDK].userManager.myFriends;
    for (NIMUser *user in friends) {
        if ([user.userId isEqualToString:self.info.infoId]) {
            return YES;
        }
    }
    return NO;
}

- (NSString *)groupTitle {
    NSString *title = [[AAASpellingCenter sharedCenter] firstLetter:self.info.showName].capitalizedString;
    unichar character = [title characterAtIndex:0];
    if (character >= 'A' && character <= 'Z') {
        return title;
    }else{
        return @"#";
    }
}

- (NSString *)memberId{
    return self.info.infoId;
}

- (NSString *)showName{
    return self.info.showName;
}

- (NSString *)avatarUrlString {
    return self.info.avatarUrlString;
}

- (UIImage *)avatarImage {
    return self.info.avatarImage;
}

- (id)sortKey {
    return [[AAASpellingCenter sharedCenter] spellingForString:self.info.showName].shortSpelling;
}

@end

