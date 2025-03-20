// __DEBUG__
// __CLOSE_PRINT__
//
//  ViewAggregationHeliogramSittingControl.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "BBBKitEvent.h"
#import "MightHaveBeenAdd.h"

//: typedef NS_ENUM (NSInteger, CCCSessionMessageContentViewLayout){
typedef NS_ENUM (NSInteger, CCCSessionMessageContentViewLayout){
    //: CCCSessionMessageContentViewLayoutAuto = 0, 
    CCCSessionMessageContentViewLayoutAuto = 0, //根据消息自动布局
    //: CCCSessionMessageContentViewLayoutLeft, 
    CCCSessionMessageContentViewLayoutLeft, //左边布局
    //: CCCSessionMessageContentViewLayoutRight, 
    CCCSessionMessageContentViewLayoutRight, //右边布局
//: };
};

//: @class NIMKitBubbleStyleObject;
@class NIMKitBubbleStyleObject;

//: @protocol NIMMessageContentViewDelegate <NSObject>
@protocol LineText <NSObject>

//: - (void)onCatchEvent:(BBBKitEvent *)event;
- (void)birthplaces:(MightHaveBeenAdd *)event;

//: - (void)disableLongPress:(BOOL)disable;
- (void)currents:(BOOL)disable;

//: @optional
@optional
// 长按复制
//: - (BOOL)onLongTap:(NIMMessage *)message complete:(void(^)(id data))complete;
- (BOOL)view:(NIMMessage *)message to:(void(^)(id data))complete;
//: - (BOOL)onLongTap:(NIMMessage *)message;
- (BOOL)tables:(NIMMessage *)message;


//: @end
@end

//: @class BBBMessageModel;
@class AccumulationCenter;

//: @interface CCCSessionMessageContentView : UIControl
@interface ViewAggregationHeliogramSittingControl : UIControl

//: @property (nonatomic,strong,readonly) BBBMessageModel *model;
@property (nonatomic,strong,readonly) AccumulationCenter *model;

//: @property (nonatomic,strong) UIImageView * bubbleImageView;
@property (nonatomic,strong) UIImageView * bubbleImageView;

//: @property (nonatomic,assign) CCCSessionMessageContentViewLayout layoutStyle;
@property (nonatomic,assign) CCCSessionMessageContentViewLayout layoutStyle;

//: @property (nonatomic,weak) id<NIMMessageContentViewDelegate> delegate;
@property (nonatomic,weak) id<LineText> delegate;

/**
 *  contentView初始化方法
 *
 *  @return content实例
 */
//: - (instancetype)initSessionMessageContentView;
- (instancetype)initMessageOpen;

/**
 *  刷新方法
 *
 *  @param data 刷新数据
 *
 */
//: - (void)refresh:(BBBMessageModel*)data;
- (void)video:(AccumulationCenter*)data;


/**
 *  手指从contentView内部抬起
 */
//: - (void)onTouchUpInside:(id)sender;
- (void)priceTag:(id)sender;


/**
 *  手指从contentView外部抬起
 */
//: - (void)onTouchUpOutside:(id)sender;
- (void)shoulds:(id)sender;

/**
 *  手指按下contentView
 */
//: - (void)onTouchDown:(id)sender;
- (void)pyeDog:(id)sender;


/**
 *  聊天气泡图
 *
 *  @param state    目前的按压状态
 *  @param outgoing 是否是发出去的消息
 *
 */
//: - (UIImage *)chatBubbleImageForState:(UIControlState)state outgoing:(BOOL)outgoing;
- (UIImage *)administrator:(UIControlState)state language:(BOOL)outgoing;

//: @end
@end