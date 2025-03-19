//
//  TeamAnnouncementListCell.h
//  NIM
//
//  Created by Xuhui on 15/3/31.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NIMSDK/NIMSDK.h>

@interface BBBTeamAnnouncementListCell : UITableViewCell

- (void)refreshData:(NSDictionary *)data nick:(NSString *)nick;

+ (CGFloat)cellHeight:(NSString *)title;

@end
