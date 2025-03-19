//
//  CCCMessageCellMaker.h
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCMessageCell.h"
#import "CCCSessionTimestampCell.h"
#import "CCCCellConfig.h"
#import "CCCMessageCellProtocol.h"

@interface CCCMessageCellFactory : NSObject

- (CCCMessageCell *)cellInTable:(UITableView*)tableView
                 forMessageMode:(BBBMessageModel *)model;

- (CCCSessionTimestampCell *)cellInTable:(UITableView *)tableView
                            forTimeModel:(BBBTimestampModel *)model;

@end
