// __DEBUG__
// __CLOSE_PRINT__
//
//  PhoneMessageHolder.h
//  NIM
//
//  Created by Netease on 15/8/27.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class NTESCADisplayLinkHolder;
@class PhoneMessageHolder;

//: @protocol NTESCADisplayLinkHolderDelegate <NSObject>
@protocol ShouldName <NSObject>

//: - (void)onDisplayLinkFire:(NTESCADisplayLinkHolder *)holder
- (void)free:(PhoneMessageHolder *)holder
                 //: duration:(NSTimeInterval)duration
                 everyMedia:(NSTimeInterval)duration
              //: displayLink:(CADisplayLink *)displayLink;
              send:(CADisplayLink *)displayLink;

//: @end
@end


//: @interface NTESCADisplayLinkHolder : NSObject
@interface PhoneMessageHolder : NSObject

//: @property (nonatomic,weak ) id<NTESCADisplayLinkHolderDelegate> delegate;
@property (nonatomic,weak ) id<ShouldName> delegate;
//: @property (nonatomic,assign) NSInteger frameInterval;
@property (nonatomic,assign) NSInteger frameInterval;

//: - (void)startCADisplayLinkWithDelegate: (id<NTESCADisplayLinkHolderDelegate>)delegate;
- (void)ting: (id<ShouldName>)delegate;

//: - (void)stop;
- (void)key;

//: @end
@end