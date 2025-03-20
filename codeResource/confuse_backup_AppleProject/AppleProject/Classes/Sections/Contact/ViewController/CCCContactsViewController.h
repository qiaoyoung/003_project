//
//  CCCContactsViewController.h
//  NIM
//
//  Created by 彭爽 on 2021/9/8.
//  Copyright © 2021 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCCContactsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) BOOL disableSearchTeam;

@property (nonatomic,assign) BOOL searchIgoreCase;

@property(nonatomic, strong) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
