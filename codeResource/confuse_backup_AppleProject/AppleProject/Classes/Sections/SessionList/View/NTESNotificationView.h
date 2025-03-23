//
//  NTESNotificationView.h
//  NIM
//
//  Created by Yan Wang on 2024/6/27.
//  Copyright © 2024 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTESNotificationView : UIView

@property(nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray  *notifications;
//@property (nonatomic,strong) NSArray  *notifications;
@end

NS_ASSUME_NONNULL_END
