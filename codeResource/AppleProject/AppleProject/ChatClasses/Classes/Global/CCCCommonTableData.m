
#import <Foundation/Foundation.h>

NSString *StringFromInvestorGainData(Byte *data);        


//: disable
Byte str_pantDeveloperTitle[] = {77, 7, 45, 6, 5, 66, 55, 60, 70, 52, 53, 63, 56, 148};


//: headerHeight
Byte str_poolBlocName[] = {11, 12, 11, 14, 249, 224, 75, 89, 185, 36, 242, 184, 53, 112, 93, 90, 86, 89, 90, 103, 61, 90, 94, 92, 93, 105, 131};


//: language
Byte str_convictionName[] = {14, 8, 65, 14, 213, 30, 238, 185, 158, 74, 189, 85, 64, 104, 43, 32, 45, 38, 52, 32, 38, 36, 66};


//: extraInfo
Byte str_limpTitle[] = {20, 9, 79, 5, 234, 22, 41, 37, 35, 18, 250, 31, 23, 32, 56};


//: footerHeight
Byte str_contestCameraRoverValue[] = {99, 12, 71, 9, 125, 28, 25, 41, 236, 31, 40, 40, 45, 30, 43, 1, 30, 34, 32, 33, 45, 192};


//: row
Byte str_revParkTitle[] = {19, 3, 87, 13, 242, 165, 83, 41, 208, 59, 170, 84, 48, 27, 24, 32, 84};


//: accessory
Byte str_adderTitle[] = {35, 9, 86, 13, 253, 30, 12, 115, 20, 115, 2, 227, 119, 11, 13, 13, 15, 29, 29, 25, 28, 35, 37};


//: cellClass
Byte str_tanConsumeData[] = {22, 9, 30, 11, 17, 238, 83, 249, 91, 153, 160, 69, 71, 78, 78, 37, 78, 67, 85, 85, 104};


//: footerTitle
Byte str_doctrineMurderData[] = {91, 11, 32, 11, 3, 13, 198, 233, 90, 178, 213, 70, 79, 79, 84, 69, 82, 52, 73, 84, 76, 69, 129};


//: detailTitle
Byte str_cowFessData[] = {19, 11, 17, 6, 145, 202, 83, 84, 99, 80, 88, 91, 67, 88, 99, 91, 84, 19};


//: rowHeight
Byte str_distributeTitle[] = {81, 9, 12, 7, 89, 114, 119, 102, 99, 107, 60, 89, 93, 91, 92, 104, 239};


//: leftEdge
Byte str_ruleTitle[] = {41, 8, 92, 8, 82, 61, 98, 16, 16, 9, 10, 24, 233, 8, 11, 9, 95};


//: title
Byte str_schedulePriseName[] = {15, 5, 11, 4, 105, 94, 105, 97, 90, 12};


//: headerTitle
Byte str_bestNomeValue[] = {45, 11, 60, 11, 136, 153, 178, 177, 163, 198, 147, 44, 41, 37, 40, 41, 54, 24, 45, 56, 48, 41, 148};


//: forbidSelect
Byte str_tingMagnetValue[] = {63, 12, 60, 8, 170, 186, 130, 101, 42, 51, 54, 38, 45, 40, 23, 41, 48, 41, 39, 56, 98};


//: action
Byte str_differentValue[] = {22, 6, 31, 13, 114, 11, 123, 8, 161, 236, 196, 179, 226, 66, 68, 85, 74, 80, 79, 169};


//: disableUserInteraction
Byte str_crediblyValue[] = {55, 22, 58, 5, 16, 42, 47, 57, 39, 40, 50, 43, 27, 57, 43, 56, 15, 52, 58, 43, 56, 39, 41, 58, 47, 53, 52, 52};

// __DEBUG__
// __CLOSE_PRINT__
//
//  CCCCommonTableData.m
//  NIM
//
//  Created by chris on 15/6/26.
//  Copyright © 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCCommonTableData.h"
#import "CCCCommonTableData.h"

//: @implementation NIMCommonTableSection
@implementation ImageSection

//: - (instancetype) initWithDict:(NSDictionary *)dict{
- (instancetype) initWithCocktailLoungeDict:(NSDictionary *)dict{
    //: if ([dict[@"disable"] boolValue]) {
    if ([dict[StringFromInvestorGainData(str_pantDeveloperTitle)] boolValue]) {
        //: return nil;
        return nil;
    }
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _headerTitle = dict[@"headerTitle"];
        _headerTitle = dict[StringFromInvestorGainData(str_bestNomeValue)];
        //: _footerTitle = dict[@"footerTitle"];
        _footerTitle = dict[StringFromInvestorGainData(str_doctrineMurderData)];
        //: _uiFooterHeight = [dict[@"footerHeight"] floatValue];
        _uiFooterHeight = [dict[StringFromInvestorGainData(str_contestCameraRoverValue)] floatValue];
        //: _uiHeaderHeight = [dict[@"headerHeight"] floatValue];
        _uiHeaderHeight = [dict[StringFromInvestorGainData(str_poolBlocName)] floatValue];
        //: _uiHeaderHeight = _uiHeaderHeight ? _uiHeaderHeight : 44.f;
        _uiHeaderHeight = _uiHeaderHeight ? _uiHeaderHeight : 44.f;
        //: _uiFooterHeight = _uiFooterHeight ? _uiFooterHeight : 44.f;
        _uiFooterHeight = _uiFooterHeight ? _uiFooterHeight : 44.f;
        //: _rows = [NIMCommonTableRow rowsWithData:dict[@"row"]];
        _rows = [ChildMessage red:dict[StringFromInvestorGainData(str_revParkTitle)]];
    }
    //: return self;
    return self;
}

//: + (NSArray *)sectionsWithData:(NSArray *)data{
+ (NSArray *)max:(NSArray *)data{
    //: NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:data.count];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:data.count];
    //: for (NSDictionary *dict in data) {
    for (NSDictionary *dict in data) {
        //: if ([dict isKindOfClass:[NSDictionary class]]) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            //: NIMCommonTableSection * section = [[NIMCommonTableSection alloc] initWithDict:dict];
            ImageSection * section = [[ImageSection alloc] initWithCocktailLoungeDict:dict];
            //: if (section) {
            if (section) {
                //: [array addObject:section];
                [array addObject:section];
            }
        }
    }
    //: return array;
    return array;
}


//: @end
@end



//: @implementation NIMCommonTableRow
@implementation ChildMessage

//: - (instancetype) initWithDict:(NSDictionary *)dict{
- (instancetype) initWithStreetwise:(NSDictionary *)dict{
    //: if ([dict[@"disable"] boolValue]) {
    if ([dict[StringFromInvestorGainData(str_pantDeveloperTitle)] boolValue]) {
        //: return nil;
        return nil;
    }
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _title = dict[@"title"];
        _title = dict[StringFromInvestorGainData(str_schedulePriseName)];
        //: _detailTitle = dict[@"detailTitle"];
        _detailTitle = dict[StringFromInvestorGainData(str_cowFessData)];
        //: _cellClassName = dict[@"cellClass"];
        _cellClassName = dict[StringFromInvestorGainData(str_tanConsumeData)];
        //: _cellActionName = dict[@"action"];
        _cellActionName = dict[StringFromInvestorGainData(str_differentValue)];
        //: _uiRowHeight = dict[@"rowHeight"] ? [dict[@"rowHeight"] floatValue] : 50.f;
        _uiRowHeight = dict[StringFromInvestorGainData(str_distributeTitle)] ? [dict[StringFromInvestorGainData(str_distributeTitle)] floatValue] : 50.f;
        //: _extraInfo = dict[@"extraInfo"];
        _extraInfo = dict[StringFromInvestorGainData(str_limpTitle)];
        //: _sepLeftEdge = [dict[@"leftEdge"] floatValue];
        _sepLeftEdge = [dict[StringFromInvestorGainData(str_ruleTitle)] floatValue];
        //: _showAccessory = [dict[@"accessory"] boolValue];
        _showAccessory = [dict[StringFromInvestorGainData(str_adderTitle)] boolValue];
        //: _forbidSelect = [dict[@"forbidSelect"] boolValue];
        _forbidSelect = [dict[StringFromInvestorGainData(str_tingMagnetValue)] boolValue];
        //: _userInteractionDisable = [dict[@"disableUserInteraction"] boolValue];
        _userInteractionDisable = [dict[StringFromInvestorGainData(str_crediblyValue)] boolValue];
        //: _language = dict[@"language"];
        _language = dict[StringFromInvestorGainData(str_convictionName)];
    }
    //: return self;
    return self;
}

//: + (NSArray *)rowsWithData:(NSArray *)data{
+ (NSArray *)red:(NSArray *)data{
    //: NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:data.count];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:data.count];
    //: for (NSDictionary *dict in data) {
    for (NSDictionary *dict in data) {
        //: if ([dict isKindOfClass:[NSDictionary class]]) {
        if ([dict isKindOfClass:[NSDictionary class]]) {
            //: NIMCommonTableRow * row = [[NIMCommonTableRow alloc] initWithDict:dict];
            ChildMessage * row = [[ChildMessage alloc] initWithStreetwise:dict];
            //: if (row) {
            if (row) {
                //: [array addObject:row];
                [array addObject:row];
            }
        }
    }
    //: return array;
    return array;
}


//: @end
@end

Byte * InvestorGainDataToCache(Byte *data) {
    int grievousBodilyHarm = data[0];
    int tree = data[1];
    Byte words = data[2];
    int gainBadlySend = data[3];
    if (!grievousBodilyHarm) return data + gainBadlySend;
    for (int i = gainBadlySend; i < gainBadlySend + tree; i++) {
        int value = data[i] + words;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[gainBadlySend + tree] = 0;
    return data + gainBadlySend;
}

NSString *StringFromInvestorGainData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)InvestorGainDataToCache(data)];
}
