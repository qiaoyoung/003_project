
#import <Foundation/Foundation.h>

NSString *StringFromIntervalervalData(Byte *data);        


//: icon_add_pressed
Byte str_ovenData[] = {13, 16, 50, 13, 182, 111, 17, 186, 47, 26, 162, 172, 45, 55, 49, 61, 60, 45, 47, 50, 50, 45, 62, 64, 51, 65, 65, 51, 50, 152};


//: icon_remove_pressed
Byte str_encounterValue[] = {49, 19, 89, 7, 11, 162, 197, 16, 10, 22, 21, 6, 25, 12, 20, 22, 29, 12, 6, 23, 25, 12, 26, 26, 12, 11, 205};


//: icon_add_normal
Byte str_aleName[] = {24, 15, 2, 6, 23, 255, 103, 97, 109, 108, 93, 95, 98, 98, 93, 108, 109, 112, 107, 95, 106, 131};


//: icon_remove_normal
Byte str_workoutTitle[] = {88, 18, 1, 9, 7, 105, 149, 214, 128, 104, 98, 110, 109, 94, 113, 100, 108, 110, 117, 100, 94, 109, 110, 113, 108, 96, 107, 61};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamCardOperationItem.m
//  NIM
//
//  Created by chris on 15/3/5.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBCardOperationItem.h"
#import "ToTarotItem.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "UserGlobalMacro.h"
#import "UserGlobalMacro.h"

//: @interface BBBCardOperationItem()
@interface ToTarotItem()

//: @property(nonatomic,assign) NIMKitCardHeaderOpeator opera;
@property(nonatomic,assign) NIMKitCardHeaderOpeator opera;

//: @end
@end

//: @implementation BBBCardOperationItem
@implementation ToTarotItem

//: - (instancetype)initWithOperation:(NIMKitCardHeaderOpeator)opera{
- (instancetype)initWithSizeObject:(NIMKitCardHeaderOpeator)opera{
    //: self = [self init];
    self = [self init];
    //: if (self) {
    if (self) {
        //: [self buildWithTeamCardOperation:opera];
        [self managerOperation:opera];
    }
    //: return self;
    return self;
}

//: - (void)buildWithTeamCardOperation:(NIMKitCardHeaderOpeator)opera{
- (void)managerOperation:(NIMKitCardHeaderOpeator)opera{
    //: _opera = opera;
    _opera = opera;
    //: switch (opera) {
    switch (opera) {
        //: case CardHeaderOpeatorAdd:
        case CardHeaderOpeatorAdd:
            //: _title = @"加入".nim_localized;
            _title = @"加入".trapLocalized;
            //: _imageNormal = [UIImage imageNamed:@"icon_add_normal"];
            _imageNormal = [UIImage imageNamed:StringFromIntervalervalData(str_aleName)];
            //: _imageHighLight = [UIImage imageNamed:@"icon_add_pressed"];
            _imageHighLight = [UIImage imageNamed:StringFromIntervalervalData(str_ovenData)];
            //: break;
            break;
        //: case CardHeaderOpeatorRemove:
        case CardHeaderOpeatorRemove:
            //: _title = @"移除".nim_localized;
            _title = @"移除".trapLocalized;
            //: _imageNormal = [UIImage imageNamed:@"icon_remove_normal"];
            _imageNormal = [UIImage imageNamed:StringFromIntervalervalData(str_workoutTitle)];
            //: _imageHighLight = [UIImage imageNamed:@"icon_remove_pressed"];
            _imageHighLight = [UIImage imageNamed:StringFromIntervalervalData(str_encounterValue)];
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
}

//: - (NSString*)teamId {
- (NSString*)pullMessage {
    //: return @"";
    return @"";
}

//: - (NSString*)userId {
- (NSString*)queryedMessage {
    //: return @"";
    return @"";
}

//: - (NIMTeamMemberType)userType {
- (NIMTeamMemberType)at {
    //: return NIMTeamMemberTypeNormal;
    return NIMTeamMemberTypeNormal;
}

//: - (void)setUserType:(NIMTeamMemberType)userType {}
- (void)setAt:(NIMTeamMemberType)userType {}

//: - (NIMTeamType)teamType {
- (NIMTeamType)greenOf {
    //: return NIMTeamTypeNormal;
    return NIMTeamTypeNormal;
}


//: - (NSString*)imageUrl {
- (NSString*)red {
    //: return nil;
    return nil;
}

//: - (NSString*)inviterAccid {
- (NSString*)arrayAccid {
    //: return nil;
    return nil;
}

//: - (BOOL)isMuted {
- (BOOL)mediaSize {
    //: return NO;
    return NO;
}

//: - (BOOL)isMyUserId {
- (BOOL)showBecome {
    //: return NO;
    return NO;
}

//: @end
@end

Byte * IntervalervalDataToCache(Byte *data) {
    int excited = data[0];
    int linkInsect = data[1];
    Byte lifeOration = data[2];
    int fluePipe = data[3];
    if (!excited) return data + fluePipe;
    for (int i = fluePipe; i < fluePipe + linkInsect; i++) {
        int value = data[i] + lifeOration;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[fluePipe + linkInsect] = 0;
    return data + fluePipe;
}

NSString *StringFromIntervalervalData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)IntervalervalDataToCache(data)];
}
