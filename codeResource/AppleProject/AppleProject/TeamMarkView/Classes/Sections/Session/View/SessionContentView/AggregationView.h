// __DEBUG__
// __CLOSE_PRINT__
//
//  AggregationView.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionMessageContentView.h"
#import "ViewAggregationHeliogramSittingControl.h"

//: @class M80AttributedLabel;
@class MessageEnableTextView;

//: @interface CCCSessionTextContentView : CCCSessionMessageContentView
@interface AggregationView : ViewAggregationHeliogramSittingControl

//: @property (nonatomic, strong) M80AttributedLabel *textView;
@property (nonatomic, strong) MessageEnableTextView *textView;

//: @end
@end