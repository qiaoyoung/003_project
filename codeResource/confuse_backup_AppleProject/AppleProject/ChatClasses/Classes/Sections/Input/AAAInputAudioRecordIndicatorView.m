//
//  AAAInputAudioRecordIndicatorView.m
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "AAAInputAudioRecordIndicatorView.h"
#import "UIImage+AppleProjectKit.h"
#import "CCCGlobalMacro.h"

#define NEEKIT_ViewWidth 160
#define NEEKIT_ViewHeight 110

#define NEEKIT_TimeFontSize 30
#define NEEKIT_TipFontSize 15

@interface AAAInputAudioRecordIndicatorView(){
    UIImageView *_backgrounView;
    UIImageView *_tipBackgroundView;
}

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UILabel *tipLabel;

@end

@implementation AAAInputAudioRecordIndicatorView
- (instancetype)init {
    self = [super init];
    if(self) {
        self.frame = CGRectMake(0, 0, NEEKIT_ViewWidth, NEEKIT_ViewHeight);
        _backgrounView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_input_record_indicator"]];
        [self addSubview:_backgrounView];
        
        _tipBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_input_record_indicator_cancel"]];
        _tipBackgroundView.hidden = YES;
        _tipBackgroundView.frame = CGRectMake(0, NEEKIT_ViewHeight - CGRectGetHeight(_tipBackgroundView.bounds), NEEKIT_ViewWidth, CGRectGetHeight(_tipBackgroundView.bounds));
        [self addSubview:_tipBackgroundView];
        
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _timeLabel.font = [UIFont boldSystemFontOfSize:NEEKIT_TimeFontSize];
        _timeLabel.textColor = [UIColor whiteColor];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.text = @"00:00";
        [self addSubview:_timeLabel];
        
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipLabel.font = [UIFont systemFontOfSize:NEEKIT_TipFontSize];
        _tipLabel.textColor = [UIColor whiteColor];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.text = @"手指上滑，取消发送".nim_localized;
        [self addSubview:_tipLabel];
        
        self.phase = AudioRecordPhaseEnd;
    }
    return self;
}

- (void)setRecordTime:(NSTimeInterval)recordTime {
    NSInteger minutes = (NSInteger)recordTime / 60;
    NSInteger seconds = (NSInteger)recordTime % 60;
    _timeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd", minutes, seconds];
}

- (void)setPhase:(NIMAudioRecordPhase)phase {
    if(phase == AudioRecordPhaseStart) {
        [self setRecordTime:0];
    } else if(phase == AudioRecordPhaseCancelling) {
        _tipLabel.text = @"松开手指，取消发送".nim_localized;
        _tipBackgroundView.hidden = NO;
    } else {
        _tipLabel.text = @"手指上滑，取消发送".nim_localized;
        _tipBackgroundView.hidden = YES;
    }
}

- (void)layoutSubviews {
    CGSize size = [_timeLabel sizeThatFits:CGSizeMake(NEEKIT_ViewWidth, MAXFLOAT)];
    _timeLabel.frame = CGRectMake(0, 36, NEEKIT_ViewWidth, size.height);
    size = [_tipLabel sizeThatFits:CGSizeMake(NEEKIT_ViewWidth, MAXFLOAT)];
    _tipLabel.frame = CGRectMake(0, NEEKIT_ViewHeight - 10 - size.height, NEEKIT_ViewWidth, size.height);
}


@end
