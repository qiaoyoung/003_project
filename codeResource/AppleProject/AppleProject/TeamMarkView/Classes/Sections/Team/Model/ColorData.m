
#import <Foundation/Foundation.h>
typedef struct {
    Byte thirds;
    Byte *personal;
    unsigned int install;
    bool mainlyRide;
	int attractOy;
	int mainlySculpt;
	int fee;
} BiologicData;

NSString *StringFromBiologicData(BiologicData *data);


//: contact_group_header
BiologicData str_neitherLengthData = (BiologicData){182, (Byte []){213, 217, 216, 194, 215, 213, 194, 233, 209, 196, 217, 195, 198, 233, 222, 211, 215, 210, 211, 196, 37}, 20, false, 51, 25, 203};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamInfoData.m
//  NIM
//
//  Created by chris on 15/6/1.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBTeamInfoData.h"
#import "ColorData.h"
//: #import "AAASpellingCenter.h"
#import "CenterMessagePressed.h"

//: @implementation BBBTeamInfoData
@implementation ColorData

//: - (instancetype)initWithTeam:(NIMTeam *)team{
- (instancetype)initWithDomain:(NIMTeam *)team{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _teamId = team.teamId;
        _teamId = team.teamId;
        //: _teamName = team.teamName;
        _teamName = team.teamName;
        //: _iconId = @"contact_group_header";
        _iconId = StringFromBiologicData(&str_neitherLengthData);
    }
    //: return self;
    return self;
}

//: - (NSString *)groupTitle{
- (NSString *)groupTitle{
    //: NSString *title = [[AAASpellingCenter sharedCenter] firstLetter:self.teamName].capitalizedString;
    NSString *title = [[CenterMessagePressed success] indexLetter:self.teamName].capitalizedString;
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
- (NSString *)memberId{
    //: return self.teamId;
    return self.teamId;
}

- (id)sortKey{
    //: return [[AAASpellingCenter sharedCenter] spellingForString:self.teamName].shortSpelling;
    return [[CenterMessagePressed success] unwelcomeSpellingPackthread:self.teamName].shortSpelling;
}

//: - (NSString *)usrId{
- (NSString *)withIndex{
    //: return self.teamId;
    return self.teamId;
}

//: - (NSString *)nick{
- (NSString *)forward{
    //: return self.teamName;
    return self.teamName;
}

//: - (NSString *)showName{
- (NSString *)showTitle{
    //: return self.teamName;
    return self.teamName;
}


//: @end
@end

Byte *BiologicDataToByte(BiologicData *data) {
    if (data->mainlyRide) return data->personal;
    for (int i = 0; i < data->install; i++) {
        data->personal[i] ^= data->thirds;
    }
    data->personal[data->install] = 0;
    data->mainlyRide = true;
	if (data->install >= 3) {
		data->attractOy = data->personal[0];
		data->mainlySculpt = data->personal[1];
		data->fee = data->personal[2];
	}
    return data->personal;
}

NSString *StringFromBiologicData(BiologicData *data) {
    return [NSString stringWithUTF8String:(char *)BiologicDataToByte(data)];
}
