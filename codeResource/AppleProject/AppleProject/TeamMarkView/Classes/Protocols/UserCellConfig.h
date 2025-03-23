// __DEBUG__
// __CLOSE_PRINT__
//
//  UserCellConfig.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

// __M_A_C_R_O__

//: @class CCCSessionMessageContentView;
@class ViewAggregationHeliogramSittingControl;
//: @class BBBMessageModel;
@class AccumulationCenter;

//: @protocol CCCCellLayoutConfig <NSObject>
@protocol OffConfig <NSObject>

//: @optional
@optional

/**
 * @return 返回message的内容大小
 */
//: - (CGSize)contentSize:(BBBMessageModel *)model cellWidth:(CGFloat)width;
- (CGSize)sendWidth:(AccumulationCenter *)model showFloat:(CGFloat)width;

/**
 *  需要构造的cellContent类名
 */
//: - (NSString *)cellContent:(BBBMessageModel *)model;
- (NSString *)total:(AccumulationCenter *)model;

/**
 *  左对齐的气泡，cell气泡距离整个cell的内间距
 */
//: - (UIEdgeInsets)cellInsets:(BBBMessageModel *)model;
- (UIEdgeInsets)top:(AccumulationCenter *)model;

/**
 *  左对齐的气泡，cell内容距离气泡的内间距，
 */
//: - (UIEdgeInsets)contentViewInsets:(BBBMessageModel *)model;
- (UIEdgeInsets)handicapped:(AccumulationCenter *)model;

/**
 * @return 返回message的所回复消息内容大小
 */
//: - (CGSize)replyContentSize:(BBBMessageModel *)model cellWidth:(CGFloat)width;
- (CGSize)with:(AccumulationCenter *)model recordingOfWidth:(CGFloat)width;

/**
 *  需要构造的ReplyContent类名
 */
//: - (NSString *)replyContent:(BBBMessageModel *)model;
- (NSString *)keyVideo:(AccumulationCenter *)model;

/**
 *  左对齐的气泡，cell reply气泡距离整个cell的内间距
 */
//: - (UIEdgeInsets)replyCellInsets:(BBBMessageModel *)model;
- (UIEdgeInsets)weltanschauung:(AccumulationCenter *)model;

/**
 *  左对齐的气泡，cell reply内容距离气泡的内间距，
 */
//: - (UIEdgeInsets)replyContentViewInsets:(BBBMessageModel *)model;
- (UIEdgeInsets)pull:(AccumulationCenter *)model;

/**
 *  是否显示头像
 */
//: - (BOOL)shouldShowAvatar:(BBBMessageModel *)model;
- (BOOL)box:(AccumulationCenter *)model;


/**
 *  左对齐的气泡，头像控件的 origin 点
 */
//: - (CGPoint)avatarMargin:(BBBMessageModel *)model;
- (CGPoint)action:(AccumulationCenter *)model;

/**
 *  左对齐的气泡，头像控件的 size
 */
//: - (CGSize)avatarSize:(BBBMessageModel *)model;
- (CGSize)show:(AccumulationCenter *)model;

/**
 *  是否显示姓名
 */
//: - (BOOL)shouldShowNickName:(BBBMessageModel *)model;
- (BOOL)nickToInput:(AccumulationCenter *)model;

/**
 *  左对齐的气泡，昵称控件的 origin 点
 */
//: - (CGPoint)nickNameMargin:(BBBMessageModel *)model;
- (CGPoint)contentImage:(AccumulationCenter *)model;


/**
 *  消息显示在左边
 */
//: - (BOOL)shouldShowLeft:(BBBMessageModel *)model;
- (BOOL)reason:(AccumulationCenter *)model;


/**
 *  需要添加到Cell上的自定义视图
 */
//: - (NSArray *)customViews:(BBBMessageModel *)model;
- (NSArray *)rubric:(AccumulationCenter *)model;


/**
 *  是否开启重试叹号开关
 */
//: - (BOOL)disableRetryButton:(BBBMessageModel *)model;
- (BOOL)ats:(AccumulationCenter *)model;

/**
 * 是否显示气泡背景图
 */
//: - (BOOL)shouldDisplayBubbleBackground:(BBBMessageModel *)model;
- (BOOL)cellBackground:(AccumulationCenter *)model;


//: @end
@end
