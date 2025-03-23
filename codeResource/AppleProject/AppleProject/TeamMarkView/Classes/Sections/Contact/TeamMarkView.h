// __DEBUG__
// __CLOSE_PRINT__
//
//  ContactPickedView.h
//  NIM
//
//  Created by ios on 10/23/13.
//  Copyright (c) 2013 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class CCCKitInfo;
@class TitleInfo;

//: @protocol AAAContactPickedViewDelegate <NSObject>
@protocol ShouldDelegate <NSObject>

//: - (void)removeUser:(NSString *)userId;
- (void)array:(NSString *)userId;

//: @end
@end

//: @interface AAAContactPickedView : UIView <UIScrollViewDelegate>
@interface TeamMarkView : UIView <UIScrollViewDelegate>

//: @property (nonatomic, weak) id<AAAContactPickedViewDelegate> delegate;
@property (nonatomic, weak) id<ShouldDelegate> delegate;

//: - (void)removeMemberInfo:(CCCKitInfo *)info;
- (void)atShowInfo:(TitleInfo *)info;

//: - (void)addMemberInfo:(CCCKitInfo *)info;
- (void)message:(TitleInfo *)info;

//: @end
@end