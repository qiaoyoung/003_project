//
//  CCCBaseSessionContentConfig.h
// AppleProjectKit
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NIMSDK/NIMSDK.h>
#import "CCCGlobalMacro.h"

@protocol CCCSessionContentConfig <NSObject>
@required

- (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message;

- (NSString *)cellContent:(NIMMessage *)message;

- (UIEdgeInsets)contentViewInsets:(NIMMessage *)message;


@optional
- (BOOL)enableBackgroundBubbleView:(NIMMessage *)message;

@end

@interface CCCSessionContentConfigFactory : NSObject
+ (instancetype)sharedFacotry;
- (id<CCCSessionContentConfig>)configBy:(NIMMessage *)message;
- (id<CCCSessionContentConfig>)replyConfigBy:(NIMMessage *)message;

@end
