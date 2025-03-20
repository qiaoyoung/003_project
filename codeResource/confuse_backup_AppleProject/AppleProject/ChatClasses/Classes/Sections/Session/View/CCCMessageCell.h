//
//  CCCMessageCell.h
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCMessageCellProtocol.h"
#import "BBBTimestampModel.h"

@class CCCSessionMessageContentView;
@class BBBAvatarImageView;
@class BBBBadgeView;

@interface CCCMessageCell : UITableViewCell

@property (nonatomic, strong) BBBAvatarImageView *headImageView;
@property (nonatomic, strong) UILabel *nameLabel;                                 //姓名
@property (nonatomic, strong) UIImageView *bubblesBackgroundView;                  //气泡背景视图
@property (nonatomic, strong) CCCSessionMessageContentView *replyedBubbleView;    //被回复内容区域

@property (nonatomic, strong) CCCSessionMessageContentView *bubbleView;           //内容区域
@property (nonatomic, strong) UIActivityIndicatorView *traningActivityIndicator;  //发送loading
@property (nonatomic, strong) UIButton *retryButton;                              //重试
@property (nonatomic, strong) BBBBadgeView *audioPlayedIcon;                      //语音未读红点
@property (nonatomic, strong) UIButton *readButton;                               //已读
@property (nonatomic, strong) UIButton *selectButton;                             //选择
@property (nonatomic, strong) UIButton *selectButtonMask;                         //选择遮罩

@property (nonatomic, readonly) BBBMessageModel *model;

@property (nonatomic, weak)   id<CCCMessageCellDelegate> delegate;

- (void)refreshData:(BBBMessageModel *)data;

@end
