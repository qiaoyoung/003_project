// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESTeamMemberListViewController.h
//  NIM
//
//  Created by chris on 15/3/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>
//: #import "CCCTeamMemberListDataSource.h"
#import "MessageSource.h"
//: #import "BBBTeamListDataManager.h"
#import "ListHideState.h"

//: @interface CCCTeamMemberListViewController : UIViewController
@interface RefreshViewController : UIViewController

//: @property (nonatomic,strong) BBBTeamListDataManager *teamListManager;
@property (nonatomic,strong) ListHideState *teamListManager;

//: - (instancetype)initWithDataSource:(BBBTeamListDataManager *)dataSource;
- (instancetype)initWithOutOfSightSource:(ListHideState *)dataSource;

//: @end
@end