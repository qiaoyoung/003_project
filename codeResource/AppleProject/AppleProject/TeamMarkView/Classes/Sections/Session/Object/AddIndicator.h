// __DEBUG__
// __CLOSE_PRINT__
//
//  AddIndicator.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "CCCKitMessageProvider.h"
#import "ShowFlush.h"
//: #import "CCCSessionConfig.h"
#import "FromConfig.h"

//: @class BBBMessageModel;
@class AccumulationCenter;

//: @interface CCCSessionMsgDatasource : NSObject
@interface AddIndicator : NSObject

//: - (instancetype)initWithSession:(NIMSession*)session
- (instancetype)initWithContent:(NIMSession*)session
                         //: config:(id<CCCSessionConfig>)sessionConfig;
                         tap:(id<FromConfig>)sessionConfig;


//: @property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSMutableArray *items;
//: @property (nonatomic, strong) NSMutableDictionary<NSString *, NSString *> *pinUsers;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSString *> *pinUsers;
//: @property (nonatomic, readonly) NSInteger messageLimit; 
@property (nonatomic, readonly) NSInteger messageLimit; //每页消息显示条数
//: @property (nonatomic, readonly) NSInteger showTimeInterval; 
@property (nonatomic, readonly) NSInteger showTimeInterval; //两条消息相隔多久显示一条时间戳
//: @property (nonatomic, weak) id<CCCSessionConfig> sessionConfig;
@property (nonatomic, weak) id<FromConfig> sessionConfig;

//: - (NSInteger)indexAtModelArray:(BBBMessageModel*)model;
- (NSInteger)extraArray:(AccumulationCenter*)model;

//复位消息
//: - (void)resetMessages:(void(^)(NSError *error)) handler;
- (void)color:(void(^)(NSError *error)) handler;

//: - (void)enhancedResetMessages:(void(^)(NSError *error, NSArray *))handler;
- (void)selection:(void(^)(NSError *error, NSArray *))handler;

//数据对外接口
//: - (void)loadHistoryMessagesWithComplete:(void(^)(NSInteger index , NSArray *messages ,NSError *error))handler;
- (void)quick:(void(^)(NSInteger index , NSArray *messages ,NSError *error))handler;

//数据load接口
//: - (void)loadPullUpMessagesWithComplete:(void(^)(NSInteger index, NSArray *messages, NSError *error))handler;
- (void)custom:(void(^)(NSInteger index, NSArray *messages, NSError *error))handler;

//获取PIN
//: - (void)loadMessagePins:(void (^)(NSError *))handler;
- (void)heather:(void (^)(NSError *))handler;

// 展示message之前做额外配置
//: - (void)willDisplayMessageModel:(BBBMessageModel *)model;
- (void)posture:(AccumulationCenter *)model;

//添加消息，会根据时间戳插入到相应位置
//: - (NSArray<NSNumber *> *)insertMessageModels:(NSArray*)models;
- (NSArray<NSNumber *> *)attachModels:(NSArray*)models;

//添加消息，直接插入消息列表末尾
//: - (NSArray<NSNumber *> *)appendMessageModels:(NSArray *)models;
- (NSArray<NSNumber *> *)completeSend:(NSArray *)models;

//删除消息
//: - (NSArray<NSNumber *> *)deleteMessageModel:(BBBMessageModel*)model;
- (NSArray<NSNumber *> *)dayDrop:(AccumulationCenter*)model;

//根据范围批量删除消息
//: - (NSArray<NSNumber *> *)deleteModels:(NSRange)range;
- (NSArray<NSNumber *> *)presentText:(NSRange)range;

// 添加pin
//: - (void)addPinForMessage:(NIMMessage *)message callback:(void (^)(NSError *))handler;
- (void)to:(NIMMessage *)message telegram:(void (^)(NSError *))handler;

// 移除pin
//: - (void)removePinForMessage:(NIMMessage *)message callback:(void (^)(NSError *))handler;
- (void)show:(NIMMessage *)message searchedCallback:(void (^)(NSError *))handler;

//清理缓存数据
//: - (void)cleanCache;
- (void)distanceCache;

//是否显示选择
//: - (void)refreshMessageModelShowSelect:(BOOL)isShow;
- (void)message:(BOOL)isShow;

//: @end
@end