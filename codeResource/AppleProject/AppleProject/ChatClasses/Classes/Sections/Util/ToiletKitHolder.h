// __DEBUG__
// __CLOSE_PRINT__
//
//  ToiletKitHolder.h
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

//: @class AAAKitTimerHolder;
@class ToiletKitHolder;

//: @protocol AAAKitTimerHolderDelegate <NSObject>
@protocol HolderAddDelegate <NSObject>
//: - (void)onNIMKitTimerFired:(AAAKitTimerHolder *)holder;
- (void)ranged:(ToiletKitHolder *)holder;
//: @end
@end

//: @interface AAAKitTimerHolder : NSObject
@interface ToiletKitHolder : NSObject
//: @property (nonatomic,weak) id<AAAKitTimerHolderDelegate> timerDelegate;
@property (nonatomic,weak) id<HolderAddDelegate> timerDelegate;

//: - (void)startTimer:(NSTimeInterval)seconds
- (void)at:(NSTimeInterval)seconds
          //: delegate:(id<AAAKitTimerHolderDelegate>)delegate
          streetSmart:(id<HolderAddDelegate>)delegate
           //: repeats:(BOOL)repeats;
           prompt:(BOOL)repeats;

//: - (void)stopTimer;
- (void)model;
//: @end
@end