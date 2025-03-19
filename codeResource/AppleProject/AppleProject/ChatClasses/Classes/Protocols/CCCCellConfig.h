//
//  CCCCellConfig.h
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CCCSessionMessageContentView;
@class BBBMessageModel;

@protocol CCCCellLayoutConfig <NSObject>

@optional

/**
 * @return 返回message的内容大小
 */
- (CGSize)contentSize:(BBBMessageModel *)model cellWidth:(CGFloat)width;

/**
 *  需要构造的cellContent类名
 */
- (NSString *)cellContent:(BBBMessageModel *)model;

/**
 *  左对齐的气泡，cell气泡距离整个cell的内间距
 */
- (UIEdgeInsets)cellInsets:(BBBMessageModel *)model;

/**
 *  左对齐的气泡，cell内容距离气泡的内间距，
 */
- (UIEdgeInsets)contentViewInsets:(BBBMessageModel *)model;

/**
 * @return 返回message的所回复消息内容大小
 */
- (CGSize)replyContentSize:(BBBMessageModel *)model cellWidth:(CGFloat)width;

/**
 *  需要构造的ReplyContent类名
 */
- (NSString *)replyContent:(BBBMessageModel *)model;

/**
 *  左对齐的气泡，cell reply气泡距离整个cell的内间距
 */
- (UIEdgeInsets)replyCellInsets:(BBBMessageModel *)model;

/**
 *  左对齐的气泡，cell reply内容距离气泡的内间距，
 */
- (UIEdgeInsets)replyContentViewInsets:(BBBMessageModel *)model;

/**
 *  是否显示头像
 */
- (BOOL)shouldShowAvatar:(BBBMessageModel *)model;


/**
 *  左对齐的气泡，头像控件的 origin 点
 */
- (CGPoint)avatarMargin:(BBBMessageModel *)model;

/**
 *  左对齐的气泡，头像控件的 size
 */
- (CGSize)avatarSize:(BBBMessageModel *)model;

/**
 *  是否显示姓名
 */
- (BOOL)shouldShowNickName:(BBBMessageModel *)model;

/**
 *  左对齐的气泡，昵称控件的 origin 点
 */
- (CGPoint)nickNameMargin:(BBBMessageModel *)model;


/**
 *  消息显示在左边
 */
- (BOOL)shouldShowLeft:(BBBMessageModel *)model;


/**
 *  需要添加到Cell上的自定义视图
 */
- (NSArray *)customViews:(BBBMessageModel *)model;


/**
 *  是否开启重试叹号开关
 */
- (BOOL)disableRetryButton:(BBBMessageModel *)model;

/**
 * 是否显示气泡背景图
 */
- (BOOL)shouldDisplayBubbleBackground:(BBBMessageModel *)model;


@end
