//
//  NTESMainCenterCell.h
//  NIM
//
//  Created by 彭爽 on 2021/9/10.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "BBBAvatarImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTESMainCenterCell : BaseTableViewCell
@property (nonatomic ,weak) id delegate;
@end

@interface NTESMainCenterCell_1 : BaseTableViewCell
@property (nonatomic ,weak) id delegate;
@end

@interface NTESMainCenterCell_2 : BaseTableViewCell
@property (nonatomic ,weak) id delegate;
@end

@interface NTESMainCenterCell_3 : BaseTableViewCell
@property (nonatomic ,weak) id delegate;
@end

@interface NTESMainCenterCell_4 : BaseTableViewCell

@end

@interface NTESMainCenterHeader : UIView
@property (nonatomic ,strong) UILabel *nickNameLabel;
@property (nonatomic ,strong) UILabel *accountLabel;
@property (nonatomic ,weak) id delegate;
@property (nonatomic,strong) UIImageView *headerImage;
@property (nonatomic,strong) UIImageView *arrowImage;

-(void)reloadWithDictionary:(NSDictionary * _Nullable)dictionary;

@end

@protocol NTESMainCenterDelegate <NSObject>

-(void)userInfoCenter;

-(void)myWallet;

-(void)signClick;

-(void)shareUserInfo;

-(void)safetySeting;

-(void)generalSeting;

-(void)sendMore;

-(void)opinionBack;

@end



NS_ASSUME_NONNULL_END
