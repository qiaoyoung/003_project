// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESGroupedUsrInfo.m
//  NIM
//
//  Created by Xuhui on 15/3/24.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAGroupedUsrInfo.h"
#import "AAAGroupedUsrInfo.h"
//: #import "AAASpellingCenter.h"
#import "CenterMessagePressed.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"

//: @interface NIMGroupUser()
@interface NameUser()

//: @property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *userId;
//: @property (nonatomic,strong) CCCKitInfo *info;
@property (nonatomic,strong) TitleInfo *info;

//: @end
@end

//: @implementation NIMGroupUser
@implementation NameUser

//: - (instancetype)initWithUserId:(NSString *)userId{
- (instancetype)initWithAnLineId:(NSString *)userId{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _userId = userId;
        _userId = userId;
        //: _info = [[AppleProjectKit sharedKit] infoByUser:userId option:nil];
        _info = [[Indicator reach] indoors:userId harvest:nil];
    }
    //: return self;
    return self;
}

- (NSString *)groupTitle{
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

//: - (NSString *)showName{
- (NSString *)showTitle{
    //: return self.info.showName;
    return self.info.showName;
}

- (NSString *)memberId{
    //: return self.userId;
    return self.userId;
}

- (id)sortKey{
    //: return [[AAASpellingCenter sharedCenter] spellingForString:self.info.showName].shortSpelling;
    return [[CenterMessagePressed success] unwelcomeSpellingPackthread:self.info.showName].shortSpelling;
}

//: - (UIImage *)avatarImage {
- (UIImage *)key {
    //: return self.info.avatarImage;
    return self.info.avatarImage;
}


//: - (NSString *)avatarUrlString {
- (NSString *)cornerLikeSnapLine {
    //: return self.info.avatarUrlString;
    return self.info.avatarUrlString;
}


//: @end
@end

//: @interface NIMGroupTeamMember()
@interface WithFlush()

//: @property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *userId;
//: @property (nonatomic,strong) CCCKitInfo *info;
@property (nonatomic,strong) TitleInfo *info;

//: @end
@end

//: @implementation NIMGroupTeamMember
@implementation WithFlush

//: - (instancetype)initWithUserId:(NSString *)userId
- (instancetype)initWithCover:(NSString *)userId
                       //: session:(NIMSession *)session {
                       reply:(NIMSession *)session {
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _userId = userId;
        _userId = userId;
        //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
        TitleOption *option = [[TitleOption alloc] init];
        //: option.session = session;
        option.session = session;
        //: _info = [[AppleProjectKit sharedKit] infoByUser:userId option:option];
        _info = [[Indicator reach] indoors:userId harvest:option];
    }
    //: return self;
    return self;
}

//: - (NSString *)groupTitle{
- (NSString *)groupTitle{
    //: NSString *title = [[AAASpellingCenter sharedCenter] firstLetter:self.showName].capitalizedString;
    NSString *title = [[CenterMessagePressed success] indexLetter:self.showTitle].capitalizedString;
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

- (id)sortKey{
    //: return [[AAASpellingCenter sharedCenter] spellingForString:self.showName].shortSpelling;
    return [[CenterMessagePressed success] unwelcomeSpellingPackthread:self.showTitle].shortSpelling;
}

//: - (NSString *)showName{
- (NSString *)showTitle{
    //: return self.info.showName;
    return self.info.showName;
}

//: - (NSString *)memberId{
- (NSString *)memberId{
    //: return self.userId;
    return self.userId;
}

//: - (UIImage *)avatarImage {
- (UIImage *)key {
    //: return self.info.avatarImage;
    return self.info.avatarImage;
}

//: - (NSString *)avatarUrlString {
- (NSString *)cornerLikeSnapLine {
    //: return self.info.avatarUrlString;
    return self.info.avatarUrlString;
}

//: @end
@end

//: @interface NIMGroupTeam()
@interface ShowTeam()

//: @property (nonatomic,copy) NSString *teamId;
@property (nonatomic,copy) NSString *teamId;
//: @property (nonatomic,strong) CCCKitInfo *info;
@property (nonatomic,strong) TitleInfo *info;

//: @end
@end

//: @implementation NIMGroupTeam
@implementation ShowTeam

//: - (instancetype)initWithTeamId:(NSString *)teamId
- (instancetype)initWithMessage:(NSString *)teamId
                      //: teamType:(NIMKitTeamType)teamType {
                      image:(NIMKitTeamType)teamType {
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _teamId = teamId;
        _teamId = teamId;
        //: if (teamType == NIMKitTeamTypeNomal) {
        if (teamType == NIMKitTeamTypeNomal) {
            //: _info = [[AppleProjectKit sharedKit] infoByTeam:teamId option:nil];
            _info = [[Indicator reach] text:teamId byLabel:nil];
        //: } else if (teamType == NIMKitTeamTypeSuper) {
        } else if (teamType == NIMKitTeamTypeSuper) {
            //: _info = [[AppleProjectKit sharedKit] infoBySuperTeam:teamId option:nil];
            _info = [[Indicator reach] noneShowOption:teamId viewMedia:nil];
        }
    }
    //: return self;
    return self;
}

//: - (NSString *)groupTitle{
- (NSString *)groupTitle{
    //: NSString *title = [[AAASpellingCenter sharedCenter] firstLetter:self.showName].capitalizedString;
    NSString *title = [[CenterMessagePressed success] indexLetter:self.showTitle].capitalizedString;
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

- (id)sortKey{
    //: return [[AAASpellingCenter sharedCenter] spellingForString:[self showName]].shortSpelling;
    return [[CenterMessagePressed success] unwelcomeSpellingPackthread:[self showTitle]].shortSpelling;
}

//: - (NSString *)showName{
- (NSString *)showTitle{
    //: return self.info.showName;
    return self.info.showName;
}

//: - (NSString *)memberId{
- (NSString *)memberId{
    //: return self.teamId;
    return self.teamId;
}

//: - (UIImage *)avatarImage {
- (UIImage *)key {
    //: return self.info.avatarImage;
    return self.info.avatarImage;
}

//: - (NSString *)avatarUrlString {
- (NSString *)cornerLikeSnapLine {
    //: return self.info.avatarUrlString;
    return self.info.avatarUrlString;
}

//: @end
@end
