// __DEBUG__
// __CLOSE_PRINT__
//
//  StatusViewCell.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "UserMessageCellProtocol.h"
#import "UserMessageCellProtocol.h"
//: #import "BBBTimestampModel.h"
#import "FromTap.h"

//: @class CCCSessionMessageContentView;
@class ViewAggregationHeliogramSittingControl;
//: @class BBBAvatarImageView;
@class AvatarControl;
//: @class BBBBadgeView;
@class BadgeView;

//: @interface CCCMessageCell : UITableViewCell
@interface StatusViewCell : UITableViewCell

//: @property (nonatomic, strong) BBBAvatarImageView *headImageView;
@property (nonatomic, strong) AvatarControl *headImageView;
//: @property (nonatomic, strong) UILabel *nameLabel; 
@property (nonatomic, strong) UILabel *nameLabel; //姓名
//: @property (nonatomic, strong) UIImageView *bubblesBackgroundView; 
@property (nonatomic, strong) UIImageView *bubblesBackgroundView; //气泡背景视图
//: @property (nonatomic, strong) CCCSessionMessageContentView *replyedBubbleView; 
@property (nonatomic, strong) ViewAggregationHeliogramSittingControl *replyedBubbleView; //被回复内容区域

//: @property (nonatomic, strong) CCCSessionMessageContentView *bubbleView; 
@property (nonatomic, strong) ViewAggregationHeliogramSittingControl *bubbleView; //内容区域
//: @property (nonatomic, strong) UIActivityIndicatorView *traningActivityIndicator; 
@property (nonatomic, strong) UIActivityIndicatorView *traningActivityIndicator; //发送loading
//: @property (nonatomic, strong) UIButton *retryButton; 
@property (nonatomic, strong) UIButton *retryButton; //重试
//: @property (nonatomic, strong) BBBBadgeView *audioPlayedIcon; 
@property (nonatomic, strong) BadgeView *audioPlayedIcon; //语音未读红点
//: @property (nonatomic, strong) UIButton *readButton; 
@property (nonatomic, strong) UIButton *readButton; //已读
//: @property (nonatomic, strong) UIButton *selectButton; 
@property (nonatomic, strong) UIButton *selectButton; //选择
//: @property (nonatomic, strong) UIButton *selectButtonMask; 
@property (nonatomic, strong) UIButton *selectButtonMask; //选择遮罩

//: @property (nonatomic, readonly) BBBMessageModel *model;
@property (nonatomic, readonly) AccumulationCenter *model;

//: @property (nonatomic, weak) id<CCCMessageCellDelegate> delegate;
@property (nonatomic, weak) id<StateAddLight> delegate;

//: - (void)refreshData:(BBBMessageModel *)data;
- (void)message:(AccumulationCenter *)data;

//: @end
@end
