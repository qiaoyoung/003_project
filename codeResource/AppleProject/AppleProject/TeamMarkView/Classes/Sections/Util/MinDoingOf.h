// __DEBUG__
// __CLOSE_PRINT__
//
//  MinDoingOf.h
// Indicator
//
//  Created by Netease on 2019/10/17.
//  Copyright © 2019 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @class NIMMessage;
@class NIMMessage;

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface AAAMessageUtil : NSObject
@interface MinDoingOf : NSObject

//: + (NSString *)messageContent:(NIMMessage*)message;
+ (NSString *)lineText:(NIMMessage*)message;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END