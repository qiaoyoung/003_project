// __DEBUG__
// __CLOSE_PRINT__
//
//  ContentViewController.h
//  NIM
//
//  Created by Yan Wang on 2024/7/30.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface ZMONFriendCardViewController : UIViewController
@interface ContentViewController : UIViewController


//: - (instancetype)initWithUserId:(NSString *)userId;
- (instancetype)initWithData:(NSString *)userId;


//: - (void)onActionNeedNotifyValueChange:(id)sender;
- (void)nameMediaRead:(id)sender;
//: - (void)onActionBlackListValueChange:(id)sender;
- (void)bies:(id)sender;



//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END