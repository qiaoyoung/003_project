// __DEBUG__
// __CLOSE_PRINT__
//
//  OfControl.h
// Indicator
//
//  Created by chris on 15/5/8.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionMessageContentView.h"
#import "ViewAggregationHeliogramSittingControl.h"
//: #import "CCCKitDependency.h"
#import "CCCKitDependency.h"

//: @interface CCCSessionNetChatNotifyContentView : CCCSessionMessageContentView
@interface OfControl : ViewAggregationHeliogramSittingControl

//: @property (nonatomic, strong) M80AttributedLabel *textLabel;
@property (nonatomic, strong) MessageEnableTextView *textLabel;

//: @end
@end