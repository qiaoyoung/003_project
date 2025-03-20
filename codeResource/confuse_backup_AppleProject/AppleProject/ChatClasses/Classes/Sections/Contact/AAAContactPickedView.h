//
//  ContactPickedView.h
//  NIM
//
//  Created by ios on 10/23/13.
//  Copyright (c) 2013 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCCKitInfo;

@protocol AAAContactPickedViewDelegate <NSObject>

- (void)removeUser:(NSString *)userId;

@end

@interface AAAContactPickedView : UIView <UIScrollViewDelegate>

@property (nonatomic, weak) id<AAAContactPickedViewDelegate> delegate;

- (void)removeMemberInfo:(CCCKitInfo *)info;

- (void)addMemberInfo:(CCCKitInfo *)info;

@end
