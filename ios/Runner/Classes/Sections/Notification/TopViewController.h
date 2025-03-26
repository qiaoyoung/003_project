// __DEBUG__
// __CLOSE_PRINT__
//
//  SystemNotificationViewController.h
//  NIM
//
//  Created by amao on 3/17/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @interface NTESSystemNotificationViewController : UIViewController
@interface TopViewController : UIViewController
//: @property (nonatomic ,strong) NSString *filterType;
@property (nonatomic ,strong) NSString *filterType;//1:请求好友 2:群通知

//: @property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *tableView;

//: @end
@end