//
//  ZMONFriendCardViewController.h
//  NIM
//
//  Created by Yan Wang on 2024/7/30.
//  Copyright © 2024 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMONFriendCardViewController : UIViewController


- (instancetype)initWithUserId:(NSString *)userId;


- (void)onActionNeedNotifyValueChange:(id)sender;
- (void)onActionBlackListValueChange:(id)sender;



@end

NS_ASSUME_NONNULL_END
