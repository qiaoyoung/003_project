
#import <Foundation/Foundation.h>
typedef struct {
    Byte skill;
    Byte *linkComprise;
    unsigned int likeAShot;
    bool meaningfulness;
	int company;
} SuspectData;

NSString *StringFromSuspectData(SuspectData *data);


//: 00:00
SuspectData str_lowMoveName = (SuspectData){7, (Byte []){55, 55, 61, 55, 55, 248}, 5, false, 100};


//: icon_input_record_indicator
SuspectData str_religionThreadText = (SuspectData){191, (Byte []){214, 220, 208, 209, 224, 214, 209, 207, 202, 203, 224, 205, 218, 220, 208, 205, 219, 224, 214, 209, 219, 214, 220, 222, 203, 208, 205, 25}, 27, false, 67};


//: 手指上滑，取消发送
SuspectData str_porchTextContent = (SuspectData){69, (Byte []){163, 204, 206, 163, 201, 194, 161, 253, 207, 163, 254, 212, 170, 249, 201, 160, 202, 211, 163, 243, 205, 160, 202, 212, 172, 197, 196, 12}, 27, false, 243};


//: 松开手指，取消发送
SuspectData str_suraRectoThighValue = (SuspectData){45, (Byte []){203, 176, 147, 200, 145, 173, 203, 164, 166, 203, 161, 170, 194, 145, 161, 200, 162, 187, 203, 155, 165, 200, 162, 188, 196, 173, 172, 36}, 27, false, 18};


//: icon_input_record_indicator_cancel
SuspectData str_egretValue = (SuspectData){2, (Byte []){107, 97, 109, 108, 93, 107, 108, 114, 119, 118, 93, 112, 103, 97, 109, 112, 102, 93, 107, 108, 102, 107, 97, 99, 118, 109, 112, 93, 97, 99, 108, 97, 103, 110, 124}, 34, false, 201};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ColorInformationView.m
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAInputAudioRecordIndicatorView.h"
#import "ColorInformationView.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "CCCGlobalMacro.h"
#import "CCCGlobalMacro.h"

//: @interface AAAInputAudioRecordIndicatorView(){
@interface ColorInformationView(){
    //: UIImageView *_backgrounView;
    UIImageView *_backgrounView;
    //: UIImageView *_tipBackgroundView;
    UIImageView *_tipBackgroundView;
}

//: @property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *timeLabel;

//: @property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UILabel *tipLabel;

//: @end
@end

//: @implementation AAAInputAudioRecordIndicatorView
@implementation ColorInformationView
//: - (instancetype)init {
- (instancetype)init {
    //: self = [super init];
    self = [super init];
    //: if(self) {
    if(self) {
        //: self.frame = CGRectMake(0, 0, 160, 110);
        self.frame = CGRectMake(0, 0, 160, 110);
        //: _backgrounView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_input_record_indicator"]];
        _backgrounView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:StringFromSuspectData(&str_religionThreadText)]];
        //: [self addSubview:_backgrounView];
        [self addSubview:_backgrounView];

        //: _tipBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_input_record_indicator_cancel"]];
        _tipBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:StringFromSuspectData(&str_egretValue)]];
        //: _tipBackgroundView.hidden = YES;
        _tipBackgroundView.hidden = YES;
        //: _tipBackgroundView.frame = CGRectMake(0, 110 - CGRectGetHeight(_tipBackgroundView.bounds), 160, CGRectGetHeight(_tipBackgroundView.bounds));
        _tipBackgroundView.frame = CGRectMake(0, 110 - CGRectGetHeight(_tipBackgroundView.bounds), 160, CGRectGetHeight(_tipBackgroundView.bounds));
        //: [self addSubview:_tipBackgroundView];
        [self addSubview:_tipBackgroundView];

        //: _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _timeLabel.font = [UIFont boldSystemFontOfSize:30];
        _timeLabel.font = [UIFont boldSystemFontOfSize:30];
        //: _timeLabel.textColor = [UIColor whiteColor];
        _timeLabel.textColor = [UIColor whiteColor];
        //: _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        //: _timeLabel.text = @"00:00";
        _timeLabel.text = StringFromSuspectData(&str_lowMoveName);
        //: [self addSubview:_timeLabel];
        [self addSubview:_timeLabel];

        //: _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _tipLabel.font = [UIFont systemFontOfSize:15];
        _tipLabel.font = [UIFont systemFontOfSize:15];
        //: _tipLabel.textColor = [UIColor whiteColor];
        _tipLabel.textColor = [UIColor whiteColor];
        //: _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        //: _tipLabel.text = @"手指上滑，取消发送".nim_localized;
        _tipLabel.text = StringFromSuspectData(&str_porchTextContent).trapLocalized;
        //: [self addSubview:_tipLabel];
        [self addSubview:_tipLabel];

        //: self.phase = AudioRecordPhaseEnd;
        self.phase = AudioRecordPhaseEnd;
    }
    //: return self;
    return self;
}

//: - (void)setRecordTime:(NSTimeInterval)recordTime {
- (void)setRecordTime:(NSTimeInterval)recordTime {
    //: NSInteger minutes = (NSInteger)recordTime / 60;
    NSInteger minutes = (NSInteger)recordTime / 60;
    //: NSInteger seconds = (NSInteger)recordTime % 60;
    NSInteger seconds = (NSInteger)recordTime % 60;
    //: _timeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd", minutes, seconds];
    _timeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd", minutes, seconds];
}

//: - (void)setPhase:(NIMAudioRecordPhase)phase {
- (void)setPhase:(NIMAudioRecordPhase)phase {
    //: if(phase == AudioRecordPhaseStart) {
    if(phase == AudioRecordPhaseStart) {
        //: [self setRecordTime:0];
        [self setRecordTime:0];
    //: } else if(phase == AudioRecordPhaseCancelling) {
    } else if(phase == AudioRecordPhaseCancelling) {
        //: _tipLabel.text = @"松开手指，取消发送".nim_localized;
        _tipLabel.text = StringFromSuspectData(&str_suraRectoThighValue).trapLocalized;
        //: _tipBackgroundView.hidden = NO;
        _tipBackgroundView.hidden = NO;
    //: } else {
    } else {
        //: _tipLabel.text = @"手指上滑，取消发送".nim_localized;
        _tipLabel.text = StringFromSuspectData(&str_porchTextContent).trapLocalized;
        //: _tipBackgroundView.hidden = YES;
        _tipBackgroundView.hidden = YES;
    }
}

//: - (void)layoutSubviews {
- (void)layoutSubviews {
    //: CGSize size = [_timeLabel sizeThatFits:CGSizeMake(160, 0x1.fffffep+127f)];
    CGSize size = [_timeLabel sizeThatFits:CGSizeMake(160, 0x1.fffffep+127f)];
    //: _timeLabel.frame = CGRectMake(0, 36, 160, size.height);
    _timeLabel.frame = CGRectMake(0, 36, 160, size.height);
    //: size = [_tipLabel sizeThatFits:CGSizeMake(160, 0x1.fffffep+127f)];
    size = [_tipLabel sizeThatFits:CGSizeMake(160, 0x1.fffffep+127f)];
    //: _tipLabel.frame = CGRectMake(0, 110 - 10 - size.height, 160, size.height);
    _tipLabel.frame = CGRectMake(0, 110 - 10 - size.height, 160, size.height);
}


//: @end
@end

Byte *SuspectDataToByte(SuspectData *data) {
    if (data->meaningfulness) return data->linkComprise;
    for (int i = 0; i < data->likeAShot; i++) {
        data->linkComprise[i] ^= data->skill;
    }
    data->linkComprise[data->likeAShot] = 0;
    data->meaningfulness = true;
	if (data->likeAShot >= 1) {
		data->company = data->linkComprise[0];
	}
    return data->linkComprise;
}

NSString *StringFromSuspectData(SuspectData *data) {
    return [NSString stringWithUTF8String:(char *)SuspectDataToByte(data)];
}
