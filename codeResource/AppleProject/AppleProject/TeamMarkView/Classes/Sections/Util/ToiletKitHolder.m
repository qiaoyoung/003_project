// __DEBUG__
// __CLOSE_PRINT__
//
//  ToiletKitHolder.m
//  NIM
//
//  Created by amao on 5/16/14.
//  Copyright (c) 2014 amao. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAKitTimerHolder.h"
#import "ToiletKitHolder.h"

//: @interface AAAKitTimerHolder ()
@interface ToiletKitHolder ()
{
    //: NSTimer *_timer;
    NSTimer *_timer;
    //: BOOL _repeats;
    BOOL _repeats;
}
//: - (void)onTimer: (NSTimer *)timer;
- (void)cutTimer: (NSTimer *)timer;
//: @end
@end

//: @implementation AAAKitTimerHolder
@implementation ToiletKitHolder

//: - (void)dealloc
- (void)dealloc
{
    //: [self stopTimer];
    [self model];
}

//: - (void)startTimer: (NSTimeInterval)seconds
- (void)at: (NSTimeInterval)seconds
          //: delegate: (id<AAAKitTimerHolderDelegate>)delegate
          streetSmart: (id<HolderAddDelegate>)delegate
           //: repeats: (BOOL)repeats
           prompt: (BOOL)repeats
{
    //: _timerDelegate = delegate;
    _timerDelegate = delegate;
    //: _repeats = repeats;
    _repeats = repeats;
    //: if (_timer)
    if (_timer)
    {
        //: [_timer invalidate];
        [_timer invalidate];
        //: _timer = nil;
        _timer = nil;
    }
    //: _timer = [NSTimer scheduledTimerWithTimeInterval:seconds
    _timer = [NSTimer scheduledTimerWithTimeInterval:seconds
                                              //: target:self
                                              target:self
                                            //: selector:@selector(onTimer:)
                                            selector:@selector(cutTimer:)
                                            //: userInfo:nil
                                            userInfo:nil
                                             //: repeats:repeats];
                                             repeats:repeats];
}

//: - (void)stopTimer
- (void)model
{
    //: [_timer invalidate];
    [_timer invalidate];
    //: _timer = nil;
    _timer = nil;
    //: _timerDelegate = nil;
    _timerDelegate = nil;
}

//: - (void)onTimer: (NSTimer *)timer
- (void)cutTimer: (NSTimer *)timer
{
    //: if (!_repeats)
    if (!_repeats)
    {
        //: _timer = nil;
        _timer = nil;
    }
    //: if (_timerDelegate && [_timerDelegate respondsToSelector:@selector(onNIMKitTimerFired:)])
    if (_timerDelegate && [_timerDelegate respondsToSelector:@selector(ranged:)])
    {
        //: [_timerDelegate onNIMKitTimerFired:self];
        [_timerDelegate ranged:self];
    }
}

//: @end
@end