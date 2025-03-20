// __DEBUG__
// __CLOSE_PRINT__
//
//  OrientationContentView.h
// Indicator
//
//  Created by He on 2020/3/25.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionMessageContentView.h"
#import "ViewAggregationHeliogramSittingControl.h"

//: @class M80AttributedLabel;
@class MessageEnableTextView;
//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface CCCReplyedTextContentView : CCCSessionMessageContentView
@interface OrientationContentView : ViewAggregationHeliogramSittingControl

//: @property (nonatomic, strong) M80AttributedLabel *textLabel;
@property (nonatomic, strong) MessageEnableTextView *textLabel;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END