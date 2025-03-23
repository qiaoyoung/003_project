//
//  BBBTeamMuteMemberListViewController.h
// AppleProjectKit
//
//  Created by Genning-Work on 2019/12/13.
//  Copyright © 2019 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCTeamMemberListDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface BBBTeamMuteMemberListViewController : UIViewController

- (instancetype)initWithDataSource:(id<CCCTeamMemberListDataSource>)dataSource;

@end

NS_ASSUME_NONNULL_END
