// __DEBUG__
// __CLOSE_PRINT__
//
//  OfHolder.m
//  NIM
//
//  Created by amao on 5/16/14.
//  Copyright (c) 2014 amao. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESTimerHolder.h"
#import "OfHolder.h"

//: @interface NTESTimerHolder ()
@interface OfHolder ()
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

//: @implementation NTESTimerHolder
@implementation OfHolder

//: - (void)dealloc
- (void)dealloc
{
    //: [self stopTimer];
    [self compartment];
}

//: - (void)startTimer: (NSTimeInterval)seconds
- (void)name: (NSTimeInterval)seconds
          //: delegate: (id<NTESTimerHolderDelegate>)delegate
          betweenBottom: (id<ReachIndicator>)delegate
           //: repeats: (BOOL)repeats
           show: (BOOL)repeats
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
- (void)compartment
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
    //: if (_timerDelegate && [_timerDelegate respondsToSelector:@selector(onNTESTimerFired:)])
    if (_timerDelegate && [_timerDelegate respondsToSelector:@selector(numbers:)])
    {
        //: [_timerDelegate onNTESTimerFired:self];
        [_timerDelegate numbers:self];
    }
}

//: @end
@end