//
//  NTESMessageCellFactory.h
//  NIM
//
//  Created by zhanggenning on 2019/10/18.
//  Copyright © 2019 Netease. All rights reserved.
//

#import "CCCMessageCellFactory.h"
#import "NTESTimestampCell.h"
#import "NTESMergeMessageCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTESMessageCellFactory : CCCMessageCellFactory

- (NTESMergeMessageCell *)ntesCellInTable:(UITableView*)tableView
                           forMessageMode:(BBBMessageModel *)model;

- (NTESTimestampCell *)ntesCellInTable:(UITableView *)tableView
                          forTimeModel:(BBBTimestampModel *)model;

@end

NS_ASSUME_NONNULL_END
