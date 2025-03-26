// __DEBUG__
// __CLOSE_PRINT__
//
//  MessagePressedModel.m
//  LEEAlertDemo
//
//  Created by 李响 on 2017/6/4.
//  Copyright © 2017年 lee. All rights reserved.
//

// __M_A_C_R_O__
//: #import "SelectedListModel.h"
#import "MessagePressedModel.h"

//: @implementation SelectedListModel
@implementation MessagePressedModel

//: - (instancetype)initWithSid:(NSInteger)sid
- (instancetype)initWithStatuteTitle:(NSInteger)sid
                      //: Title:(NSString *)title{
                      commentBubble:(NSString *)title{

    //: return [[SelectedListModel alloc] initWithSid:sid Title:title Context:nil];
    return [[MessagePressedModel alloc] initWithChange:sid tap:title success:nil];
}

//: - (instancetype)initWithSid:(NSInteger)sid
- (instancetype)initWithChange:(NSInteger)sid
                      //: Title:(NSString *)title
                      tap:(NSString *)title
                    //: Context:(id)context{
                    success:(id)context{

    //: self = [super init];
    self = [super init];

    //: if (self) {
    if (self) {

        //: _sid = sid;
        _sid = sid;

        //: _title = title;
        _title = title;

        //: _context = context;
        _context = context;
    }

    //: return self;
    return self;
}

//: @end
@end