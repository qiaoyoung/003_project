// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamMessageModel.m
//  NIM
//
//  Created by zhanggenning on 2019/10/21.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESMessageModel.h"
#import "TeamMessageModel.h"

//: @implementation NTESMessageModel
@implementation TeamMessageModel

//: - (instancetype)initWithMessage:(NIMMessage*)message
- (instancetype)initWithDisplacement:(NIMMessage*)message
{
    //: self = [super initWithMessage:message];
    self = [super initWithDisplacement:message];
    //: if (self) {
    if (self) {
        //: self.shouldShowPinContent = NO;
        self.shouldShowPinContent = NO;
        //: self.enableSubMessages = NO;
        self.enableSubMessages = NO;
        //: self.enableRepliedContent = NO;
        self.enableRepliedContent = NO;
        //: self.enableQuickComments = NO;
        self.enableQuickComments = NO;
    }
    //: return self;
    return self;
}

//: @end
@end