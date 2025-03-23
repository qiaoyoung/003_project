//
//  TeamCardHeaderCell.h
//  NIM
//
//  Created by chris on 15/3/7.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppleProjectKit.h"
#import "BBBCardDataSourceProtocol.h"
@class BBBAvatarImageView;
@protocol BBBCardHeaderCellDelegate;



@interface BBBCardHeaderCell : UICollectionViewCell

@property (nonatomic,strong) BBBAvatarImageView *imageView;

@property (nonatomic,strong) UIImageView *roleImageView;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIButton *removeBtn;

@property (nonatomic,weak) id<BBBCardHeaderCellDelegate>delegate;

@property (nonatomic,readonly) id<NIMKitCardHeaderData> data;

- (void)refreshData:(id<NIMKitCardHeaderData>)data;

@end


@protocol BBBCardHeaderCellDelegate <NSObject>

- (void)cellDidSelected:(BBBCardHeaderCell*)cell;


@optional
- (void)cellShouldBeRemoved:(BBBCardHeaderCell*)cell;

@end
