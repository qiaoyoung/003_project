// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESInputMoreContainerView.h
//  NIMDemo
//
//  Created by chris.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "CCCSessionConfig.h"
#import "FromConfig.h"
//: #import "CCCInputProtocol.h"
#import "CCCInputProtocol.h"

//: @interface AAAInputMoreContainerView : UIView
@interface ToAGreaterExtentView : UIView

//: @property (nonatomic,weak) id<CCCSessionConfig> config;
@property (nonatomic,weak) id<FromConfig> config;
//: @property (nonatomic,weak) id<NIMInputActionDelegate> actionDelegate;
@property (nonatomic,weak) id<ColorDelegate> actionDelegate;

//: @end
@end