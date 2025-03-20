// __DEBUG__
// __CLOSE_PRINT__
//
//  CCCBaseSessionContentConfig.h
// Indicator
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>
//: #import "CCCGlobalMacro.h"
#import "CCCGlobalMacro.h"

//: @protocol CCCSessionContentConfig <NSObject>
@protocol TopTing <NSObject>
//: @required
@required

//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message;
- (CGSize)offMessage:(CGFloat)cellWidth view:(NIMMessage *)message;

//: - (NSString *)cellContent:(NIMMessage *)message;
- (NSString *)text:(NIMMessage *)message;

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message;
- (UIEdgeInsets)pressedView:(NIMMessage *)message;


//: @optional
@optional
//: - (BOOL)enableBackgroundBubbleView:(NIMMessage *)message;
- (BOOL)backgrounded:(NIMMessage *)message;

//: @end
@end

//: @interface CCCSessionContentConfigFactory : NSObject
@interface NameFactory : NSObject
//: + (instancetype)sharedFacotry;
+ (instancetype)quick;
//: - (id<CCCSessionContentConfig>)configBy:(NIMMessage *)message;
- (id<TopTing>)datePress:(NIMMessage *)message;
//: - (id<CCCSessionContentConfig>)replyConfigBy:(NIMMessage *)message;
- (id<TopTing>)selectedTitle:(NIMMessage *)message;

//: @end
@end