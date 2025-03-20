// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESContactInfoCell.h
//  NIM
//
//  Created by chris on 15/2/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "AAAContactDefines.h"
#import "AAAContactDefines.h"
//: #import "CCCKitInfo.h"
#import "TitleInfo.h"

//: @protocol AAAContactDataCellDelegate <NSObject>
@protocol IconName <NSObject>

//: - (void)onPressAvatar:(NSString *)memberId;
- (void)withed:(NSString *)memberId;

//: @end
@end

//: @class BBBAvatarImageView;
@class AvatarControl;

//: @interface AAAContactDataCell : UITableViewCell
@interface FromOfView : UITableViewCell

//: @property (nonatomic,copy) NSString *memberId;
@property (nonatomic,copy) NSString *memberId;

//: @property (nonatomic,strong) BBBAvatarImageView * avatarImageView;
@property (nonatomic,strong) AvatarControl * avatarImageView;

//: @property (nonatomic,strong) UIButton *accessoryBtn;
@property (nonatomic,strong) UIButton *accessoryBtn;

//: @property (nonatomic,strong) UIButton *messageBtn;
@property (nonatomic,strong) UIButton *messageBtn;
//: @property (nonatomic,strong) UIButton *videoBtn;
@property (nonatomic,strong) UIButton *videoBtn;

//: @property (nonatomic,weak) id<AAAContactDataCellDelegate> delegate;
@property (nonatomic,weak) id<IconName> delegate;

//: - (void)refreshUser:(id<NIMGroupMemberProtocol>)member;
- (void)lastName:(id<UpProtocol>)member;

//: - (void)refreshTeam:(NIMTeam *)team;
- (void)cell:(NIMTeam *)team;

//: - (void)refreshItem:(id<NIMGroupMemberProtocol>)member;
- (void)queryed:(id<UpProtocol>)member;

//: @end
@end