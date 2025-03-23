// __DEBUG__
// __CLOSE_PRINT__
//
//  SignalCellFactory.h
//  NIM
//
//  Created by zhanggenning on 2019/10/18.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCMessageCellFactory.h"
#import "TitlePressed.h"
//: #import "NTESTimestampCell.h"
#import "InformationTimestampCell.h"
//: #import "NTESMergeMessageCell.h"
#import "FiveMessageCell.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESMessageCellFactory : CCCMessageCellFactory
@interface SignalCellFactory : TitlePressed

//: - (NTESMergeMessageCell *)ntesCellInTable:(UITableView*)tableView
- (FiveMessageCell *)ofImport:(UITableView*)tableView
                           //: forMessageMode:(BBBMessageModel *)model;
                           mode:(AccumulationCenter *)model;

//: - (NTESTimestampCell *)ntesCellInTable:(UITableView *)tableView
- (InformationTimestampCell *)name:(UITableView *)tableView
                          //: forTimeModel:(BBBTimestampModel *)model;
                          buttonDoing:(FromTap *)model;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END