// __DEBUG__
// __CLOSE_PRINT__
//
//  ContainerTableViewController.h
//  NIM
//
//  Created by Genning-Work on 2020/1/2.
//  Copyright © 2020 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @protocol NTESContactSearchDelegate <NSObject>
@protocol ContactAddDelegate <NSObject>

//不搜索team
//: - (BOOL)disableSearchTeam;
- (BOOL)teamDismiss;

//忽略大小写
//: - (BOOL)ignoreCase;
- (BOOL)letCamera;

//: @end
@end

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESContactSearchViewController : UITableViewController
@interface ContainerTableViewController : UITableViewController

//: @property (nonatomic, assign) id <NTESContactSearchDelegate> delegate;
@property (nonatomic, assign) id <ContactAddDelegate> delegate;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END