//
//  NIMAdvancedTeamCardView.h
//  NIM
//
//  Created by 彭爽 on 2021/10/22.
//  Copyright © 2021 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBBTeamListDataManager.h"
#import "CCCAdvancedTeamCardViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NIMAdvancedTeamCardView : UIView
//群组管理
@property (nonatomic,strong) BBBTeamListDataManager *teamListManager;
@property (nonatomic,strong) BBBTeamCardViewControllerOption *option;
@property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;

- (void)reloaddata;
@end

NS_ASSUME_NONNULL_END

