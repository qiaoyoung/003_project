// __DEBUG__
// __CLOSE_PRINT__
//
//  TingTextView.h
//  NIM
//
//  Created by chris on 2017/7/17.
//  Copyright © 2017年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionMessageContentView.h"
#import "ViewAggregationHeliogramSittingControl.h"
//: #import "M80AttributedLabel.h"
#import "MessageEnableTextView.h"

//: static NSString *const NTESShowRedPacketDetailEvent = @"NTESShowRedPacketDetailEvent";
static NSString *const k_userText = @"NTESShowRedPacketDetailEvent";


//: @interface NTESSessionRedPacketTipContentView : CCCSessionMessageContentView
@interface TingTextView : ViewAggregationHeliogramSittingControl

//: @property (nonatomic,strong) M80AttributedLabel *label;
@property (nonatomic,strong) MessageEnableTextView *label;

//: @end
@end