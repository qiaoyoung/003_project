//
//  BBBKitEvent.h
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NIMSDK/NIMSDK.h>
#import "BBBMessageModel.h"

@interface BBBKitEvent : NSObject

@property (nonatomic,copy) NSString *eventName;

@property (nonatomic,strong) BBBMessageModel *messageModel;

@property (nonatomic,strong) id data;

@end




extern NSString *const BBBKitEventNameTapContent;
extern NSString *const BBBKitEventNameTapLabelLink;
extern NSString *const BBBKitEventNameTapAudio;

extern NSString *const BBBKitEventNameTapRepliedContent;

