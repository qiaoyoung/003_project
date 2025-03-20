//
//  NTESContactInfoCell.h
//  NIM
//
//  Created by chris on 15/2/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAAContactDefines.h"
#import "CCCKitInfo.h"

@protocol AAAContactDataCellDelegate <NSObject>

- (void)onPressAvatar:(NSString *)memberId;

@end

@class BBBAvatarImageView;

@interface AAAContactDataCell : UITableViewCell

@property (nonatomic,copy) NSString *memberId;

@property (nonatomic,strong) BBBAvatarImageView * avatarImageView;

@property (nonatomic,strong) UIButton *accessoryBtn;

@property (nonatomic,strong) UIButton *messageBtn;
@property (nonatomic,strong) UIButton *videoBtn;

@property (nonatomic,weak) id<AAAContactDataCellDelegate> delegate;

- (void)refreshUser:(id<NIMGroupMemberProtocol>)member;

- (void)refreshTeam:(NIMTeam *)team;

- (void)refreshItem:(id<NIMGroupMemberProtocol>)member;

@end
