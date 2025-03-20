// __DEBUG__
// __CLOSE_PRINT__
//
//  CCCMessageCellMaker.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "CCCMessageCell.h"
#import "StatusViewCell.h"
//: #import "CCCSessionTimestampCell.h"
#import "MixViewCell.h"
//: #import "CCCCellConfig.h"
#import "CCCCellConfig.h"
//: #import "CCCMessageCellProtocol.h"
#import "CCCMessageCellProtocol.h"

//: @interface CCCMessageCellFactory : NSObject
@interface TitlePressed : NSObject

//: - (CCCMessageCell *)cellInTable:(UITableView*)tableView
- (StatusViewCell *)findPoint:(UITableView*)tableView
                 //: forMessageMode:(BBBMessageModel *)model;
                 bottomLight:(AccumulationCenter *)model;

//: - (CCCSessionTimestampCell *)cellInTable:(UITableView *)tableView
- (MixViewCell *)timber:(UITableView *)tableView
                            //: forTimeModel:(BBBTimestampModel *)model;
                            tingAcross:(FromTap *)model;

//: @end
@end