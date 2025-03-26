// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageViewCell.h
//  NIM
//
//  Created by 彭爽 on 2021/10/19.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BaseTableViewCell.h"
#import "CompartmentView.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESContactAddFriendCell : BaseTableViewCell
@interface MessageViewCell : CompartmentView
//: @property (nonatomic ,weak) id delegate;
@property (nonatomic ,weak) id delegate;
//: @property (nonatomic ,strong) UITextField *textField;
@property (nonatomic ,strong) UITextField *textField;
//: @property (nonatomic ,strong) UIButton *myQRCodeBtn;
@property (nonatomic ,strong) UIButton *myQRCodeBtn;
//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END