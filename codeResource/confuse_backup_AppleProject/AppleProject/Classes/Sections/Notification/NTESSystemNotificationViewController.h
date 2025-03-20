//
//  SystemNotificationViewController.h
//  NIM
//
//  Created by amao on 3/17/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTESSystemNotificationViewController : UIViewController
@property (nonatomic ,strong) NSString *filterType;//1:请求好友 2:群通知

@property (nonatomic, strong) UITableView *tableView;

@end
