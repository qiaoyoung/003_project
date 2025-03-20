// __DEBUG__
// __CLOSE_PRINT__
//
//  MightHaveBeenAdd.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"

//: @interface BBBKitEvent : NSObject
@interface MightHaveBeenAdd : NSObject

//: @property (nonatomic,copy) NSString *eventName;
@property (nonatomic,copy) NSString *eventName;

//: @property (nonatomic,strong) BBBMessageModel *messageModel;
@property (nonatomic,strong) AccumulationCenter *messageModel;

//: @property (nonatomic,strong) id data;
@property (nonatomic,strong) id data;

//: @end
@end




//: extern NSString *const BBBKitEventNameTapContent;
extern NSString *const k_kitTotalContactTitle;
//: extern NSString *const BBBKitEventNameTapLabelLink;
extern NSString *const k_managerContent;
//: extern NSString *const BBBKitEventNameTapAudio;
extern NSString *const k_messageData;

//: extern NSString *const BBBKitEventNameTapRepliedContent;
extern NSString *const k_cropQueryVersionData;