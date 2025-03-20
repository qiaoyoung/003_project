// __DEBUG__
// __CLOSE_PRINT__
//
//  ClueView.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "CCCInputProtocol.h"
#import "CCCInputProtocol.h"
//: #import "CCCSessionConfig.h"
#import "FromConfig.h"
//: #import "AAAInputToolBar.h"
#import "DistanceView.h"
//: #import "AAAInputAtCache.h"
#import "ColorCache.h"

//: @class AAAInputMoreContainerView;
@class ToAGreaterExtentView;
//: @class AAAInputEmoticonContainerView;
@class StreetwiseView;
//: @class AAAReplyContentView;
@class StatuteTitleView;



//: typedef NS_ENUM(NSInteger, NIMAudioRecordPhase) {
typedef NS_ENUM(NSInteger, NIMAudioRecordPhase) {
    //: AudioRecordPhaseStart,
    AudioRecordPhaseStart,
    //: AudioRecordPhaseRecording,
    AudioRecordPhaseRecording,
    //: AudioRecordPhaseCancelling,
    AudioRecordPhaseCancelling,
    //: AudioRecordPhaseEnd
    AudioRecordPhaseEnd
//: };
};



//: @protocol NIMInputDelegate <NSObject>
@protocol OffDelegate <NSObject>

//: @optional
@optional

//: - (void)didChangeInputHeight:(CGFloat)inputHeight;
- (void)dataTip:(CGFloat)inputHeight;

//: @end
@end

//: @interface AAAInputView : UIView
@interface ClueView : UIView

//: @property (nonatomic, strong) NIMSession *session;
@property (nonatomic, strong) NIMSession *session;

//: @property (nonatomic, assign) NSInteger maxTextLength;
@property (nonatomic, assign) NSInteger maxTextLength;

//: @property (assign, nonatomic, getter=isRecording) BOOL recording;
@property (assign, nonatomic, getter=isRecording) BOOL recording;

//: @property (strong, nonatomic) AAAInputToolBar *toolBar;
@property (strong, nonatomic) DistanceView *toolBar;
//: @property (strong, nonatomic) UIView *moreContainer;
@property (strong, nonatomic) UIView *moreContainer;
//: @property (strong, nonatomic) UIView *emoticonContainer;
@property (strong, nonatomic) UIView *emoticonContainer;

//: @property (nonatomic, strong) AAAReplyContentView *replyedContent;
@property (nonatomic, strong) StatuteTitleView *replyedContent;

//: @property (nonatomic, assign) NIMInputStatus status;
@property (nonatomic, assign) NIMInputStatus status;
//: @property (nonatomic, strong) AAAInputAtCache *atCache;
@property (nonatomic, strong) ColorCache *atCache;

//: - (instancetype)initWithFrame:(CGRect)frame
- (instancetype)initWithTing:(CGRect)frame
                       //: config:(id<CCCSessionConfig>)config;
                       valueEnableConfig:(id<FromConfig>)config;

//: - (void)reset;
- (void)date;

//: - (void)refreshStatus:(NIMInputStatus)status;
- (void)clean:(NIMInputStatus)status;

//: - (void)setInputDelegate:(id<NIMInputDelegate>)delegate;
- (void)setInputDelegate:(id<OffDelegate>)delegate;

//外部设置
//: - (void)setInputActionDelegate:(id<NIMInputActionDelegate>)actionDelegate;
- (void)setSignalingColor:(id<ColorDelegate>)actionDelegate;

//: - (void)setInputTextPlaceHolder:(NSString*)placeHolder;
- (void)setReply:(NSString*)placeHolder;
//: - (void)setInputTextPlaceHolder:(NSString*)placeHolder color:(UIColor *)placeholderColor;
- (void)message:(NSString*)placeHolder color:(UIColor *)placeholderColor;

//: - (void)updateAudioRecordTime:(NSTimeInterval)time;
- (void)quick:(NSTimeInterval)time;
//: - (void)updateVoicePower:(float)power;
- (void)tingPower:(float)power;
//: - (void)addAtItems:(NSArray *)contacts;
- (void)replyOff:(NSArray *)contacts;

//: - (void)refreshReplyedContent:(NIMMessage *)message;
- (void)bubble:(NIMMessage *)message;
//: - (void)dismissReplyedContent;
- (void)should;

//: @end
@end