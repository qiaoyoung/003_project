//
//  BBBTeamMemberListCell.h
//  NIM
//
//  Created by chris on 15/3/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NIMSDK/NIMSDK.h>
#import "AppleProjectKit.h"

extern NSString *const kTeamMember;
extern NSString *const kTeamMemberInfo;

@protocol BBBTeamMemberListCellActionDelegate <NSObject>

- (void)didSelectAddOpeartor;

@end


@interface BBBTeamMemberListCell : UITableViewCell


@property(nonatomic, assign) BOOL disableInvite;

@property(nonatomic, assign) NSInteger maxShowMemberCount;

@property(nonatomic, strong) NSMutableArray <NSDictionary *> *infos;

@property(nonatomic, weak) id<BBBTeamMemberListCellActionDelegate>delegate;

@end
