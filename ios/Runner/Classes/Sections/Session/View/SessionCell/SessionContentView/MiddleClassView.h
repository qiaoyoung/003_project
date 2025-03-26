// __DEBUG__
// __CLOSE_PRINT__
//
//  MiddleClassView.h
//  NIM
//
//  Created by chris on 15/8/3.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "CCCSessionMessageContentView.h"
#import "ViewAggregationHeliogramSittingControl.h"

//: @class M80AttributedLabel;
@class MessageEnableTextView;




//: @interface NTESSessionWhiteBoardContentView : CCCSessionMessageContentView
@interface MiddleClassView : ViewAggregationHeliogramSittingControl

//: @property (nonatomic, strong) M80AttributedLabel *textLabel;
@property (nonatomic, strong) MessageEnableTextView *textLabel;

//: @end
@end