// __DEBUG__
// __CLOSE_PRINT__
//
//  RadiatorGrilleMessage.m
//  NIM
//
//  Created by 田玉龙 on 2023/6/24.
//  Copyright © 2023 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCAutoLoginManager.h"
#import "RadiatorGrilleMessage.h"

//: @implementation CCCAutoLoginManager
@implementation RadiatorGrilleMessage

//: + (instancetype)sharedManager
+ (instancetype)view
{
    //: static CCCAutoLoginManager *instance = nil;
    static RadiatorGrilleMessage *instance = nil;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: instance = [[CCCAutoLoginManager alloc] init];
        instance = [[RadiatorGrilleMessage alloc] init];
    //: });
    });
    //: return instance;
    return instance;
}


//: @end
@end