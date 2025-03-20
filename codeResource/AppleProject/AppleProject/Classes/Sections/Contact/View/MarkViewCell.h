// __DEBUG__
// __CLOSE_PRINT__
//
//  MarkViewCell.h
//  NIM
//
//  Created by chris on 15/8/18.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class BBBAvatarImageView;
@class AvatarControl;
//: @class NTESContactDataMember;
@class ContactAt;


//: @protocol NTESUserListCellDelegate <NSObject>
@protocol LightHide <NSObject>

//: - (void)didTouchUserListAvatar:(NSString *)userId;
- (void)ting:(NSString *)userId;

//: @end
@end

//: @interface NTESUserListCell : UITableViewCell
@interface MarkViewCell : UITableViewCell

//: @property (nonatomic,strong) BBBAvatarImageView * avatarImageView;
@property (nonatomic,strong) AvatarControl * avatarImageView;

//: @property (nonatomic,weak) id<NTESUserListCellDelegate> delegate;
@property (nonatomic,weak) id<LightHide> delegate;

//: - (void)refreshWithMember:(NTESContactDataMember *)member;
- (void)name:(ContactAt *)member;

//: @end
@end