//
//  NIMSessionViewConfigurator.h
// AppleProjectKit
//
//  Created by chris on 2016/11/7.
//  Copyright © 2016年 NetEase. All rights reserved.
//

#import "CCCSessionViewController.h"
#import "CCCSessionConfigurateProtocol.h"

@class CCCSessionViewController;

@interface CCCSessionConfigurator : NSObject

- (void)setup:(CCCSessionViewController *)vc;

@end
