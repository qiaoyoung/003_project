//
//  NTESInputMoreContainerView.h
//  NIMDemo
//
//  Created by chris.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCSessionConfig.h"
#import "CCCInputProtocol.h"


@interface AAAInputMoreContainerView : UIView

@property (nonatomic,weak)  id<CCCSessionConfig> config;
@property (nonatomic,weak)  id<NIMInputActionDelegate> actionDelegate;

@end
