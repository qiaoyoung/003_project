// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMSessionAudioCententView.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionMessageContentView.h"
#import "ViewAggregationHeliogramSittingControl.h"

//: @protocol NIMPlayAudioUIDelegate <NSObject>
@protocol DatePressedUidelegate <NSObject>
//: -(void)startPlayingAudioUI; 
-(void)commonDown; //点击一开始就要显示
//: @optional
@optional
//: - (void)retryDownloadMsg; 
- (void)valuePressed; //重收消息
//: @end
@end

//: @interface CCCSessionAudioContentView : CCCSessionMessageContentView
@interface LanguageView : ViewAggregationHeliogramSittingControl

//: @property (nonatomic, strong) UILabel *audioDurationLable; 
@property (nonatomic, strong) UILabel *audioDurationLable; //语音时长

//: @property (nonatomic, weak) id<NIMPlayAudioUIDelegate> audioUIDelegate;
@property (nonatomic, weak) id<DatePressedUidelegate> audioUIDelegate;

//: @property (nonatomic, strong) UIView *audioBackgroundView;
@property (nonatomic, strong) UIView *audioBackgroundView;

//: - (void)setPlaying:(BOOL)isPlaying;
- (void)setMessage:(BOOL)isPlaying;

//: @end
@end