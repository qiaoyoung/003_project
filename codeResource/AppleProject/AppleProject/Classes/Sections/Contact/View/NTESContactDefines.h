// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESContactDefines.h
//  NIM
//
//  Created by chris on 15/2/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__

//: @protocol NTESContactItemCollection <NSObject>
@protocol ItemCollection <NSObject>
//: @required
@required
//显示的title名
- (NSString*)title;

//返回集合里的成员
//: - (NSArray*)members;
- (NSArray*)with;

//重用id
//: - (NSString*)reuseId;
- (NSString*)pullIn;

//需要构造的cell类名
//: - (NSString*)cellName;
- (NSString*)compartment;

//: @end
@end

//: @protocol NTESContactItem<NSObject>
@protocol StateHide<NSObject>
//: @required
@required
//userId和Vcname必有一个有值，根据有值的状态push进不同的页面
- (NSString*)vcName;

//userId和Vcname必有一个有值，根据有值的状态push进不同的页面
- (NSString*)userId;

//返回行高
//: - (CGFloat)uiHeight;
- (CGFloat)session;

//重用id
//: - (NSString*)reuseId;
- (NSString*)pullIn;

//需要构造的cell类名
//: - (NSString*)cellName;
- (NSString*)compartment;

//badge
//: - (NSString *)badge;
- (NSString *)hidden;

//显示名
//: - (NSString *)nick;
- (NSString *)dataUser;

//占位图
//: - (UIImage *)icon;
- (UIImage *)title;

//头像url
//: - (NSString *)avatarUrl;
- (NSString *)end;

//accessoryView
//: - (BOOL)showAccessoryView;
- (BOOL)viewDisable;

//: @optional
@optional
//: - (NSString *)selName;
- (NSString *)addInsidePhone;


//: @end
@end

//: @protocol NTESContactCell <NSObject>
@protocol CityCenterLanguage <NSObject>

//: - (void)refreshWithContactItem:(id<NTESContactItem>)item;
- (void)earth:(id<StateHide>)item;

//: - (void)addDelegate:(id)delegate;
- (void)concealed:(id)delegate;

//: @end
@end







//: static const CGFloat NTESContactUtilRowHeight = 57;
static const CGFloat k_upName = 57;//util类Cell行高
//: static const CGFloat NTESContactDataRowHeight = 50;
static const CGFloat k_retTextImageData = 50;//data类Cell行高
//: static const NSInteger NTESContactAvatarLeft = 10;
static const NSInteger k_allowTitle = 10;//没有选择框的时候，头像到左边的距离
//: static const NSInteger NTESContactAvatarAndAccessorySpacing = 10;
static const NSInteger k_tempData = 10;//头像和选择框之间的距离
