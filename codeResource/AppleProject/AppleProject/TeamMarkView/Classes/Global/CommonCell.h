// __DEBUG__
// __CLOSE_PRINT__
//
//  CommonCell.h
//  NIM
//
//  Created by chris on 15/6/29.
//  Copyright (c) 2015年 Netease. All rights reserved.
//
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

// __M_A_C_R_O__

//: @class NIMCommonTableRow;
@class ChildMessage;

//: @protocol CCCCommonTableViewCell <NSObject>
@protocol CommonCell <NSObject>

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (instancetype)initWithClickValue:(UITableViewCellStyle)style identifier:(NSString *)reuseIdentifier;

//: @optional
@optional
//: - (void)refreshData:(NIMCommonTableRow *)rowData tableView:(UITableView *)tableView;
- (void)text:(ChildMessage *)rowData should_strong:(UITableView *)tableView;

//: @end
@end