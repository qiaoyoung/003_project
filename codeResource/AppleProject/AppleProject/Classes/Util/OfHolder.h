// __DEBUG__
// __CLOSE_PRINT__
//
//  OfHolder.h
//  NIM
//
//  Created by amao on 5/16/14.
//  Copyright (c) 2014 amao. All rights reserved.
//
//M80TimerHolder，管理某个Timer，功能为
//1.隐藏NSTimer,使得NSTimer只能retain M80TimerHolder
//2.对于非repeats的Timer,执行一次后自动释放Timer
//3.对于repeats的Timer,需要持有M80TimerHolder的对象在析构时调用[M80TimerHolder stopTimer]

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @class NTESTimerHolder;
@class OfHolder;

//: @protocol NTESTimerHolderDelegate <NSObject>
@protocol ReachIndicator <NSObject>
//: - (void)onNTESTimerFired:(NTESTimerHolder *)holder;
- (void)numbers:(OfHolder *)holder;
//: @end
@end

//: @interface NTESTimerHolder : NSObject
@interface OfHolder : NSObject
//: @property (nonatomic,weak) id<NTESTimerHolderDelegate> timerDelegate;
@property (nonatomic,weak) id<ReachIndicator> timerDelegate;

//: - (void)startTimer:(NSTimeInterval)seconds
- (void)name:(NSTimeInterval)seconds
          //: delegate:(id<NTESTimerHolderDelegate>)delegate
          betweenBottom:(id<ReachIndicator>)delegate
           //: repeats:(BOOL)repeats;
           show:(BOOL)repeats;

//: - (void)stopTimer;
- (void)compartment;
//: @end
@end