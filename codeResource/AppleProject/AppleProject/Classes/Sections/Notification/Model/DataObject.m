// __DEBUG__
// __CLOSE_PRINT__
//
//  DataObject.m
//  NIM
//
//  Created by chris on 15/5/28.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESCustomNotificationObject.h"
#import "DataObject.h"

//: @implementation NTESCustomNotificationObject
@implementation DataObject

//: - (instancetype)initWithNotification:(NIMCustomSystemNotification *)notification{
- (instancetype)initWithNotification:(NIMCustomSystemNotification *)notification{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _sender = notification.sender;
        _sender = notification.sender;
        //: _receiver = notification.receiver;
        _receiver = notification.receiver;
        //: _timestamp = notification.timestamp;
        _timestamp = notification.timestamp;
        //: _content = notification.content;
        _content = notification.content;
        //: _needBadge = notification.setting.shouldBeCounted;
        _needBadge = notification.setting.shouldBeCounted;
    }
    //: return self;
    return self;
}

//: @end
@end