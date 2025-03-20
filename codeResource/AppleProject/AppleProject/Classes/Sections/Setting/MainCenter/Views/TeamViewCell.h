// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamViewCell.h
//  NIM
//
//  Created by 彭爽 on 2021/9/10.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BaseTableViewCell.h"
#import "CompartmentView.h"
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESMainCenterCell : BaseTableViewCell
@interface TeamViewCell : CompartmentView
//: @property (nonatomic ,weak) id delegate;
@property (nonatomic ,weak) id delegate;
//: @end
@end

//: @interface NTESMainCenterCell_1 : BaseTableViewCell
@interface DisableViewCell : CompartmentView
//: @property (nonatomic ,weak) id delegate;
@property (nonatomic ,weak) id delegate;
//: @end
@end

//: @interface NTESMainCenterCell_2 : BaseTableViewCell
@interface TingViewCell : CompartmentView
//: @property (nonatomic ,weak) id delegate;
@property (nonatomic ,weak) id delegate;
//: @end
@end

//: @interface NTESMainCenterCell_3 : BaseTableViewCell
@interface WithMasterView : CompartmentView
//: @property (nonatomic ,weak) id delegate;
@property (nonatomic ,weak) id delegate;
//: @end
@end

//: @interface NTESMainCenterCell_4 : BaseTableViewCell
@interface CellTapView : CompartmentView

//: @end
@end

//: @interface NTESMainCenterHeader : UIView
@interface DisableView : UIView
//: @property (nonatomic ,strong) UILabel *nickNameLabel;
@property (nonatomic ,strong) UILabel *nickNameLabel;
//: @property (nonatomic ,strong) UILabel *accountLabel;
@property (nonatomic ,strong) UILabel *accountLabel;
//: @property (nonatomic ,weak) id delegate;
@property (nonatomic ,weak) id delegate;
//: @property (nonatomic,strong) UIImageView *headerImage;
@property (nonatomic,strong) UIImageView *headerImage;
//: @property (nonatomic,strong) UIImageView *arrowImage;
@property (nonatomic,strong) UIImageView *arrowImage;

//: -(void)reloadWithDictionary:(NSDictionary * _Nullable)dictionary;
-(void)cell:(NSDictionary * _Nullable)dictionary;

//: @end
@end

//: @protocol NTESMainCenterDelegate <NSObject>
@protocol DataDate <NSObject>

//: -(void)userInfoCenter;
-(void)toolView;

//: -(void)myWallet;
-(void)inputXView;

//: -(void)signClick;
-(void)openlineText;

//: -(void)shareUserInfo;
-(void)wearerSelect;

//: -(void)safetySeting;
-(void)readKey;

//: -(void)generalSeting;
-(void)emptyMain;

//: -(void)sendMore;
-(void)signLanguage;

//: -(void)opinionBack;
-(void)mustReply;

//: @end
@end



//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END
