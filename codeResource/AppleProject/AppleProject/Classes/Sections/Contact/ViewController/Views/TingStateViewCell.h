// __DEBUG__
// __CLOSE_PRINT__
//
//  TingStateViewCell.h
//  NIM
//
//  Created by Yan Wang on 2024/7/27.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "AAAContactDefines.h"
#import "AAAContactDefines.h"
//: #import "CCCKitInfo.h"
#import "TitleInfo.h"
//: #import "NTESContactDataMember.h"
#import "ContactAt.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @protocol NTESUserListCellDelegate <NSObject>
@protocol LightHide <NSObject>

//: - (void)didTouchMessageButton:(NSString *)memberId;
- (void)sharedRead:(NSString *)memberId;

//: @end
@end

//: @interface NTESFriendListTableViewCell : UITableViewCell
@interface TingStateViewCell : UITableViewCell

//: @property(nonatomic, strong) UIImageView *iconImageView;
@property(nonatomic, strong) UIImageView *iconImageView;
//: @property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *titleLabel;
//: @property (nonatomic,strong) UIButton *messageBtn;
@property (nonatomic,strong) UIButton *messageBtn;
//: @property (nonatomic,strong) UIButton *videoBtn;
@property (nonatomic,strong) UIButton *videoBtn;

//: @property (nonatomic,copy) NSString *memberId;
@property (nonatomic,copy) NSString *memberId;

//: + (instancetype)cellWithTableView:(UITableView *)tableView;
+ (instancetype)call:(UITableView *)tableView;

//: + (CGFloat)getCellHeight:(NSDictionary*)information;
+ (CGFloat)secretPlan:(NSDictionary*)information;

//: - (void)refreshUser:(id<NIMGroupMemberProtocol>)member;
- (void)image:(id<UpProtocol>)member;

//: - (void)reloadUserItem:(NIMUser *)user;
- (void)option:(NIMUser *)user;

//: @property (nonatomic,weak) id<NTESUserListCellDelegate> delegate;
@property (nonatomic,weak) id<LightHide> delegate;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END