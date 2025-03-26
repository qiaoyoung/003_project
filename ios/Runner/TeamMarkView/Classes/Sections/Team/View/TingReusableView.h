// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamCardHeaderCell.h
//  NIM
//
//  Created by chris on 15/3/7.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "UserCardDataSourceProtocol.h"
#import "UserCardDataSourceProtocol.h"

//: @class BBBAvatarImageView;
@class AvatarControl;
//: @protocol BBBCardHeaderCellDelegate;
@protocol TapWithOf;



//: @interface BBBCardHeaderCell : UICollectionViewCell
@interface TingReusableView : UICollectionViewCell

//: @property (nonatomic,strong) BBBAvatarImageView *imageView;
@property (nonatomic,strong) AvatarControl *imageView;

//: @property (nonatomic,strong) UIImageView *roleImageView;
@property (nonatomic,strong) UIImageView *roleImageView;

//: @property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *titleLabel;

//: @property (nonatomic,strong) UIButton *removeBtn;
@property (nonatomic,strong) UIButton *removeBtn;

//: @property (nonatomic,weak) id<BBBCardHeaderCellDelegate>delegate;
@property (nonatomic,weak) id<TapWithOf>delegate;

//: @property (nonatomic,readonly) id<NIMKitCardHeaderData> data;
@property (nonatomic,readonly) id<WithChild> data;

//: - (void)refreshData:(id<NIMKitCardHeaderData>)data;
- (void)text:(id<WithChild>)data;

//: @end
@end


//: @protocol BBBCardHeaderCellDelegate <NSObject>
@protocol TapWithOf <NSObject>

//: - (void)cellDidSelected:(BBBCardHeaderCell*)cell;
- (void)views:(TingReusableView*)cell;


//: @optional
@optional
//: - (void)cellShouldBeRemoved:(BBBCardHeaderCell*)cell;
- (void)imaged:(TingReusableView*)cell;

//: @end
@end
