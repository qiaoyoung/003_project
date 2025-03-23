// __DEBUG__
// __CLOSE_PRINT__
//
//  IndicatorViewController.h
// Indicator
//
//  Created by Genning-Work on 2019/12/13.
//  Copyright © 2019 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "CCCTeamMemberListDataSource.h"
#import "MessageSource.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface BBBTeamMuteMemberListViewController : UIViewController
@interface IndicatorViewController : UIViewController

//: - (instancetype)initWithDataSource:(id<CCCTeamMemberListDataSource>)dataSource;
- (instancetype)initWithViewGesture:(id<MessageSource>)dataSource;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END