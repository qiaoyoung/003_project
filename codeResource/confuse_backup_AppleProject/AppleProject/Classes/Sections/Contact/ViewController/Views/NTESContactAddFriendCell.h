//
//  NTESContactAddFriendCell.h
//  NIM
//
//  Created by 彭爽 on 2021/10/19.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTESContactAddFriendCell : BaseTableViewCell
@property (nonatomic ,weak) id delegate;
@property (nonatomic ,strong) UITextField *textField;
@property (nonatomic ,strong) UIButton *myQRCodeBtn;
@end

NS_ASSUME_NONNULL_END
