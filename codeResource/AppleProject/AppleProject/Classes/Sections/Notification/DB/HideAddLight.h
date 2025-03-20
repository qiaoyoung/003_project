// __DEBUG__
// __CLOSE_PRINT__
//
//  HideAddLight.h
//  NIM
//
//  Created by chris on 15/5/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @class NTESCustomNotificationObject;
@class DataObject;
//: @interface NTESCustomNotificationDB : NSObject
@interface HideAddLight : NSObject

//: + (instancetype)sharedInstance;;
+ (instancetype)count;;

//: @property (nonatomic,assign) NSInteger unreadCount;
@property (nonatomic,assign) NSInteger unreadCount;

//: - (NSArray *)fetchNotifications:(NTESCustomNotificationObject *)notification
- (NSArray *)printMediaTing:(DataObject *)notification
                          //: limit:(NSInteger)limit;
                          disable:(NSInteger)limit;

//: - (BOOL)saveNotification:(NTESCustomNotificationObject *)notification;
- (BOOL)location:(DataObject *)notification;

//: - (void)deleteNotification:(NTESCustomNotificationObject *)notification;
- (void)forwards:(DataObject *)notification;

//: - (void)deleteAllNotification;
- (void)sum;

//: - (void)markAllNotificationsAsRead;
- (void)selected;

//: @end
@end