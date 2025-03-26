// __DEBUG__
// __CLOSE_PRINT__
//
//  LineSize.m
//  NIM
//
//  Created by chris on 15/7/27.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESClientUtil.h"
#import "LineSize.h"

//: @implementation NTESClientUtil
@implementation LineSize

//: + (NSString *)clientName:(NIMLoginClientType)clientType{
+ (NSString *)randomStickText:(NIMLoginClientType)clientType{
    //: switch (clientType) {
    switch (clientType) {
        //: case NIMLoginClientTypeAOS:
        case NIMLoginClientTypeAOS:
        //: case NIMLoginClientTypeiOS:
        case NIMLoginClientTypeiOS:
        //: case NIMLoginClientTypeWP:
        case NIMLoginClientTypeWP:
            //: return @"移动".ntes_localized;
            return @"移动".language;
        //: case NIMLoginClientTypePC:
        case NIMLoginClientTypePC:
        //: case NIMLoginClientTypemacOS:
        case NIMLoginClientTypemacOS:
            //: return @"电脑".ntes_localized;
            return @"电脑".language;
        //: case NIMLoginClientTypeWeb:
        case NIMLoginClientTypeWeb:
            //: return @"网页".ntes_localized;
            return @"网页".language;
        //: default:
        default:
            //: return @"";
            return @"";
    }
}

//: @end
@end