// __DEBUG__
// __CLOSE_PRINT__
//
//  InformationViewController.h
//  NIM
//
//  Created by 彭爽 on 2021/9/8.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface CCCContactsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@interface InformationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

//: @property (nonatomic,assign) BOOL disableSearchTeam;
@property (nonatomic,assign) BOOL disableSearchTeam;

//: @property (nonatomic,assign) BOOL searchIgoreCase;
@property (nonatomic,assign) BOOL searchIgoreCase;

//: @property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UITableView *tableView;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END