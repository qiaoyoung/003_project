// __DEBUG__
// __CLOSE_PRINT__
//
//  ContactUtilItem.m
//  NIM
//
//  Created by chris on 15/2/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESContactUtilItem.h"
#import "ContentItem.h"

//: @implementation NTESContactUtilItem
@implementation ContentItem

//: - (NSString*)reuseId{
- (NSString*)pullIn{
    //: return @"NTESContactUtilItem";
    return @"ContentItem";
}

//: - (NSString*)cellName{
- (NSString*)compartment{
    //: return @"NTESContactUtilCell";
    return @"MarkView";
}

- (NSString*)title{
    //: return nil;
    return nil;
}

//: @end
@end

//: @implementation NTESContactUtilMember
@implementation TingChildMode

//: - (NSString *)avatarUrl{
- (NSString *)end{
    //: return nil;
    return nil;
}

//: - (CGFloat)uiHeight{
- (CGFloat)session{
    //: return NTESContactUtilRowHeight;
    return k_upName;
}

//: - (NSString*)reuseId{
- (NSString*)pullIn{
    //: return @"NTESContactUtilItem";
    return @"ContentItem";
}

//: - (NSString*)cellName{
- (NSString*)compartment{
    //: return @"NTESContactUtilCell";
    return @"MarkView";
}

- (NSString *)groupTitle {
    //: return nil;
    return nil;
}

- (NSString *)memberId{
    //: return self.userId;
    return self.userId;
}

//: - (BOOL)showAccessoryView{
- (BOOL)viewDisable{
    //: return YES;
    return YES;
}

- (id)sortKey {
    //: return nil;
    return nil;
}

//: @end
@end
