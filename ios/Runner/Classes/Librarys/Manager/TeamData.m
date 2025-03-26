
#import <Foundation/Foundation.h>
typedef struct {
    Byte shank;
    Byte *maltRide;
    unsigned int tablePost;
    bool axCredibility;
	int enablelyName;
} OftData;

NSString *StringFromOftData(OftData *data);


//: data
OftData str_bareWithData = (OftData){4, (Byte []){96, 101, 112, 101, 24}, 4, false, 149};


//: /wallet/questionList
OftData str_throatHorseName = (OftData){103, (Byte []){72, 16, 6, 11, 11, 2, 19, 72, 22, 18, 2, 20, 19, 14, 8, 9, 43, 14, 20, 19, 121}, 20, false, 155};


//: code
OftData str_elegantSearTitleData = (OftData){87, (Byte []){52, 56, 51, 50, 17}, 4, false, 41};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamData.m
//  NIM
//
//  Created by 彭爽 on 2021/9/8.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESGlobalConfigManager.h"
#import "TeamData.h"

//: @interface NTESGlobalConfigManager ()
@interface TeamData ()
//: @property (nonatomic ,strong) NSArray *secretQuestionArray;
@property (nonatomic ,strong) NSArray *secretQuestionArray;
//: @end
@end

//: @implementation NTESGlobalConfigManager
@implementation TeamData

//: static NTESGlobalConfigManager *shareConfigManager = nil;
static TeamData *k_teamData = nil;

//: + (NTESGlobalConfigManager *)shareConfigManager{
+ (TeamData *)value{
    //: @synchronized(self) {
    @synchronized(self) {
        //: if (shareConfigManager == nil) {
        if (k_teamData == nil) {
            //: shareConfigManager = [[NTESGlobalConfigManager alloc] init];
            k_teamData = [[TeamData alloc] init];
        }
        //: return shareConfigManager;
        return k_teamData;
    }
}



//: + (NSArray *)getSecretQuestionList{
+ (NSArray *)alongTouchList{
    //: return [NTESGlobalConfigManager shareConfigManager].secretQuestionArray;
    return [TeamData value].secretQuestionArray;
}

//: + (void)refreshSecretQuestionConfig{
+ (void)message{

    //: [ZCHttpManager getWithUrl:[NSString stringWithFormat:@"/wallet/questionList"] params:nil isShow:NO success:^(id responseObject) {
    [FromMessage maxColor:[NSString stringWithFormat:StringFromOftData(&str_throatHorseName)] flush:nil countIn:NO alongResponseSuccess:^(id responseObject) {
        //: NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        //: NSString *code = [resultDict newStringValueForKey:@"code"];
        NSString *code = [resultDict cord:StringFromOftData(&str_elegantSearTitleData)];
        //: if (code.integerValue == 0) {
        if (code.integerValue == 0) {
            //: [NTESGlobalConfigManager shareConfigManager].secretQuestionArray = [resultDict valueObjectForKey:@"data"];
            [TeamData value].secretQuestionArray = [resultDict eigenvalueOfAMatrix:StringFromOftData(&str_bareWithData)];
        }
    //: } failed:^(id responseObject, NSError *error) {
    } searched:^(id responseObject, NSError *error) {

    //: }];
    }];
}

//: @end
@end

Byte *OftDataToByte(OftData *data) {
    if (data->axCredibility) return data->maltRide;
    for (int i = 0; i < data->tablePost; i++) {
        data->maltRide[i] ^= data->shank;
    }
    data->maltRide[data->tablePost] = 0;
    data->axCredibility = true;
	if (data->tablePost >= 1) {
		data->enablelyName = data->maltRide[0];
	}
    return data->maltRide;
}

NSString *StringFromOftData(OftData *data) {
    return [NSString stringWithUTF8String:(char *)OftDataToByte(data)];
}
