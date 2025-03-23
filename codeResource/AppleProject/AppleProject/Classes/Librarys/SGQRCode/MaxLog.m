// __DEBUG__
// __CLOSE_PRINT__
//
//  KEKEProject
//  KEKEChat
//
//  Created by tyl.
//  Copyright © 2024 Ali. All rights reserved.
//

// __M_A_C_R_O__
//: #import "SGQRCodeLog.h"
#import "MaxLog.h"

//: static SGQRCodeLog *singleton = nil;
static MaxLog *k_mainServerText = nil;

//: @implementation SGQRCodeLog
@implementation MaxLog

//: + (instancetype)sharedQRCodeLog {
+ (instancetype)tableLog {
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: if (singleton == nil) {
        if (k_mainServerText == nil) {
            //: singleton = [[super allocWithZone:NULL] init];
            k_mainServerText = [[super allocWithZone:NULL] init];
        }
    //: });
    });
    //: return singleton;
    return k_mainServerText;
}

//: + (instancetype)allocWithZone:(struct _NSZone *)zone {
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    //: return [[self class] sharedQRCodeLog];
    return [[self class] tableLog];
}

//: - (id)copyWithZone:(NSZone *)zone {
- (id)sign:(NSZone *)zone {
    //: return [[self class] sharedQRCodeLog];
    return [[self class] tableLog];
}

//: - (id)mutableCopyWithZone:(NSZone *)zone {
- (id)streetwiseCell:(NSZone *)zone {
    //: return [[self class] sharedQRCodeLog];
    return [[self class] tableLog];
}

//: @end
@end