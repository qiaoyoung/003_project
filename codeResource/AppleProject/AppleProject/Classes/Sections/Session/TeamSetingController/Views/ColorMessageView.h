// __DEBUG__
// __CLOSE_PRINT__
//
//  ColorMessageView.h
//  NIM
//
//  Created by 彭爽 on 2021/10/22.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "BBBTeamListDataManager.h"
#import "ListHideState.h"
//: #import "CCCAdvancedTeamCardViewController.h"
#import "AssemblageViewController.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NIMAdvancedTeamCardView : UIView
@interface ColorMessageView : UIView
//群组管理
//: @property (nonatomic,strong) BBBTeamListDataManager *teamListManager;
@property (nonatomic,strong) ListHideState *teamListManager;
//: @property (nonatomic,strong) BBBTeamCardViewControllerOption *option;
@property (nonatomic,strong) ViewOption *option;
//: @property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;
@property (nonatomic,strong) AssemblageViewController *vc;

//: - (void)reloaddata;
- (void)at;
//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END