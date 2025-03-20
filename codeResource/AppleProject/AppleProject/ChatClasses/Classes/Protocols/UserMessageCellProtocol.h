// __DEBUG__
// __CLOSE_PRINT__
//
//  UserMessageCellProtocol.h
// Indicator
//
//  Created by NetEase.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "UserCellConfig.h"
#import "UserCellConfig.h"

// __M_A_C_R_O__

//: @class BBBMessageModel;
@class AccumulationCenter;
//: @class NIMMessage;
@class NIMMessage;
//: @class NIMQuickComment;
@class NIMQuickComment;
//: @class BBBKitEvent;
@class MightHaveBeenAdd;
//: @class CCCTextView;
@class LanguageWithPositionScrollView;

//: @protocol CCCMessageCellDelegate <NSObject>
@protocol StateAddLight <NSObject>

//: @optional
@optional

//: #pragma mark - cell 样式更改
#pragma mark - cell 样式更改

//: - (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)image:(UITableView *)tableView view:(UITableViewCell *)cell cellOf:(NSIndexPath *)indexPath;

//: - (BOOL)disableAudioPlayedStatusIcon:(NIMMessage *)message;
- (BOOL)titleScheme:(NIMMessage *)message;

//: #pragma mark - 点击事件
#pragma mark - 点击事件
//: - (BOOL)onTapCell:(BBBKitEvent *)event;
- (BOOL)anTo:(MightHaveBeenAdd *)event;

//: - (BOOL)onLongPressCell:(NIMMessage *)message
- (BOOL)squelch:(NIMMessage *)message
                 //: inView:(UIView *)view;
                 flipOptionKey:(UIView *)view;

// 新长按代理方法
//: - (BOOL)onLongPressCell:(NIMMessage *)message;
- (BOOL)itemCell:(NIMMessage *)message;
//: - (BOOL)onLongPressCell:(NIMMessage *)message complete:(void(^)(id data))complete;
- (BOOL)greenIn:(NIMMessage *)message past:(void(^)(id data))complete;

//: - (BOOL)onTapAvatar:(NIMMessage *)message;
- (BOOL)selected:(NIMMessage *)message;

//: - (BOOL)onLongPressAvatar:(NIMMessage *)message;
- (BOOL)longAvatar:(NIMMessage *)message;

//: - (BOOL)onPressReadLabel:(NIMMessage *)message;
- (BOOL)cells:(NIMMessage *)message;

//: - (void)onRetryMessage:(NIMMessage *)message;
- (void)names:(NIMMessage *)message;

//: - (void)onSelectedMessage:(BOOL)selected message:(NIMMessage *)message;
- (void)to:(BOOL)selected overdrive_strong:(NIMMessage *)message;

//: - (void)onClickReplyButton:(NIMMessage *)message;
- (void)tiptoed:(NIMMessage *)message;

//: - (void)onClickEmoticon:(NIMMessage *)message
- (void)readRange:(NIMMessage *)message
                //: comment:(NIMQuickComment *)comment
                commentTab:(NIMQuickComment *)comment
               //: selected:(BOOL)isSelected;
               line:(BOOL)isSelected;

//: @end
@end
