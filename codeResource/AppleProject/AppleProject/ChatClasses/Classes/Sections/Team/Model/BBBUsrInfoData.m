// __DEBUG__
// __CLOSE_PRINT__
//
//  UsrInfoData.m
//  NIM
//
//  Created by Xuhui on 15/3/19.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBUsrInfoData.h"
#import "BBBUsrInfoData.h"
//: #import "AAASpellingCenter.h"
#import "CenterMessagePressed.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @implementation AppleProjectUsrInfo
@implementation IconInfo

//: - (BOOL)isFriend {
- (BOOL)showFriend {
    //: NSArray *friends = [NIMSDK sharedSDK].userManager.myFriends;
    NSArray *friends = [NIMSDK sharedSDK].userManager.myFriends;
    //: for (NIMUser *user in friends) {
    for (NIMUser *user in friends) {
        //: if ([user.userId isEqualToString:self.info.infoId]) {
        if ([user.userId isEqualToString:self.info.infoId]) {
            //: return YES;
            return YES;
        }
    }
    //: return NO;
    return NO;
}

//: - (NSString *)groupTitle {
- (NSString *)team {
    //: NSString *title = [[AAASpellingCenter sharedCenter] firstLetter:self.info.showName].capitalizedString;
    NSString *title = [[CenterMessagePressed success] indexLetter:self.info.showName].capitalizedString;
    //: unichar character = [title characterAtIndex:0];
    unichar character = [title characterAtIndex:0];
    //: if (character >= 'A' && character <= 'Z') {
    if (character >= 'A' && character <= 'Z') {
        //: return title;
        return title;
    //: }else{
    }else{
        //: return @"#";
        return @"#";
    }
}

//: - (NSString *)memberId{
- (NSString *)video{
    //: return self.info.infoId;
    return self.info.infoId;
}

//: - (NSString *)showName{
- (NSString *)showTitle{
    //: return self.info.showName;
    return self.info.showName;
}

//: - (NSString *)avatarUrlString {
- (NSString *)cornerLikeSnapLine {
    //: return self.info.avatarUrlString;
    return self.info.avatarUrlString;
}

//: - (UIImage *)avatarImage {
- (UIImage *)key {
    //: return self.info.avatarImage;
    return self.info.avatarImage;
}

//: - (id)sortKey {
- (id)artificialFlowerStemWithKey {
    //: return [[AAASpellingCenter sharedCenter] spellingForString:self.info.showName].shortSpelling;
    return [[CenterMessagePressed success] unwelcomeSpellingPackthread:self.info.showName].shortSpelling;
}

//: @end
@end