// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESSubscribeDefine.h
//  NIM
//
//  Created by chris on 2017/4/5.
//  Copyright © 2017年 Netease. All rights reserved.
//

// __M_A_C_R_O__

//: extern NSString *const NTESSubscribeNetState;
extern NSString *const k_styleValue;

//: extern NSString *const NTESSubscribeOnlineState;
extern NSString *const k_formatValue;

//: typedef NS_ENUM(NSInteger, NTESCustomStateValue) {
typedef NS_ENUM(NSInteger, NTESCustomStateValue) {
    //: NTESCustomStateValueOnlineExt = 10001,
    NTESCustomStateValueOnlineExt = 10001,
//: };
};


//: typedef NS_ENUM(NSInteger, NTESOnlineState){
typedef NS_ENUM(NSInteger, NTESOnlineState){
    //: NTESOnlineStateNormal, 
    NTESOnlineStateNormal, //在线
    //: NTESOnlineStateBusy, 
    NTESOnlineStateBusy, //忙碌
    //: NTESOnlineStateLeave, 
    NTESOnlineStateLeave, //离开
//: };
};