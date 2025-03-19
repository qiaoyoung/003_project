//
//  NTESFriendListTableViewCell.h
//  NIM
//
//  Created by Yan Wang on 2024/7/27.
//  Copyright © 2024 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAAContactDefines.h"
#import "CCCKitInfo.h"
#import "NTESContactDataMember.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NTESUserListCellDelegate <NSObject>

- (void)didTouchMessageButton:(NSString *)memberId;

@end

@interface NTESFriendListTableViewCell : UITableViewCell

@property(nonatomic, strong) UIImageView *iconImageView;
@property(nonatomic, strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *messageBtn;
@property (nonatomic,strong) UIButton *videoBtn;

@property (nonatomic,copy) NSString *memberId;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (CGFloat)getCellHeight:(NSDictionary*)information;

- (void)refreshUser:(id<NIMGroupMemberProtocol>)member;

- (void)reloadUserItem:(NIMUser *)user;

@property (nonatomic,weak) id<NTESUserListCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
