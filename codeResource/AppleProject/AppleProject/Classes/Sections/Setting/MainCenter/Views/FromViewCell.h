// __DEBUG__
// __CLOSE_PRINT__
//
//  FromViewCell.h
//  NIM
//
//  Created by Yan Wang on 2024/6/29.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "NTESContactDataMember.h"
#import "ContactAt.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN


//: @protocol NTESUserListCellDelegate <NSObject>
@protocol LightHide <NSObject>

//: - (void)didTouchCancleButton:(NTESContactDataMember *)dataMemeber;
- (void)containerExamineed:(ContactAt *)dataMemeber;
//: - (void)didTouchUserListAvatar:(NSString *)userId;
- (void)ting:(NSString *)userId;

//: @end
@end

//: @interface NTESBlackListTableViewCell : UITableViewCell
@interface FromViewCell : UITableViewCell

//: + (instancetype)cellWithTableView:(UITableView *)tableView;
+ (instancetype)cell:(UITableView *)tableView;

//: @property(nonatomic, strong) UILabel *labName;
@property(nonatomic, strong) UILabel *labName;
//: @property (nonatomic,strong) UIImageView * avatarImageView;
@property (nonatomic,strong) UIImageView * avatarImageView;
//: @property (nonatomic,strong) UIButton *cancleBtn;
@property (nonatomic,strong) UIButton *cancleBtn;

//: @property (nonatomic,strong) NTESContactDataMember *member;
@property (nonatomic,strong) ContactAt *member;

//: @property (nonatomic,weak) id<NTESUserListCellDelegate> delegate;
@property (nonatomic,weak) id<LightHide> delegate;


//: - (void)refreshWithMember:(NTESContactDataMember *)member;
- (void)director:(ContactAt *)member;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END