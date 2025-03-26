// __DEBUG__
// __CLOSE_PRINT__
//
//  UnsealStateExpanseView.h
//  NIM
//
//  Created by 彭爽 on 2021/10/10.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESOpenRedPackageSheet : UIView
@interface UnsealStateExpanseView : UIView

//: @property (nonatomic ,weak) id delegate;
@property (nonatomic ,weak) id delegate;

//: -(instancetype)initWithFrame:(CGRect)frame dictionary:(NSDictionary *)dictionary;
-(instancetype)initWithLabelBlue:(CGRect)frame button:(NSDictionary *)dictionary;

//: - (void)show;
- (void)cellTo;

//: - (void)dismissPicker;
- (void)dismissImage;

//: @end
@end

//: @protocol NTESOpenRedPackageSheetDelegate <NSObject>
@protocol ImageCenterDelegate <NSObject>

//: -(void)myWalletDelegate;
-(void)noneDisplayDelegate;

//: -(void)redpackageDetailWith:(NSString *)redpackageID;
-(void)replies:(NSString *)redpackageID;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END