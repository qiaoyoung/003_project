// __DEBUG__
// __CLOSE_PRINT__
//
//  SignalingView.h
//  NIM
//
//  Created by 彭爽 on 2021/9/7.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: typedef void(^KnowBlock)(NSString *niceNmae);
typedef void(^KnowBlock)(NSString *niceNmae);

//: @interface NTESInputNickNameWindowView : UIView
@interface SignalingView : UIView

//: @property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *titleLabel;
//: @property (nonatomic ,strong) UITextField *textField;
@property (nonatomic ,strong) UITextField *textField;
//: @property (nonatomic ,strong) UIButton *dowmButton;
@property (nonatomic ,strong) UIButton *dowmButton;

//: @property (nonatomic,copy) KnowBlock block;
@property (nonatomic,copy) KnowBlock block;
//: -(void)clickKnowButton:(KnowBlock)block;
-(void)grievousBodilyHarmTitle:(KnowBlock)block;
//: - (void)show;
- (void)lengthShow;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END