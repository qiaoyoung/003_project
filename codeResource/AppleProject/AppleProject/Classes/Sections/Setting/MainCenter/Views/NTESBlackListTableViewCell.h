//
//  NTESBlackListTableViewCell.h
//  NIM
//
//  Created by Yan Wang on 2024/6/29.
//  Copyright © 2024 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTESContactDataMember.h"


NS_ASSUME_NONNULL_BEGIN


@protocol NTESUserListCellDelegate <NSObject>

- (void)didTouchCancleButton:(NTESContactDataMember *)dataMemeber;
- (void)didTouchUserListAvatar:(NSString *)userId;

@end

@interface NTESBlackListTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong) UILabel *labName;
@property (nonatomic,strong) UIImageView * avatarImageView;
@property (nonatomic,strong) UIButton *cancleBtn;

@property (nonatomic,strong) NTESContactDataMember *member;

@property (nonatomic,weak) id<NTESUserListCellDelegate> delegate;


- (void)refreshWithMember:(NTESContactDataMember *)member;

@end

NS_ASSUME_NONNULL_END
