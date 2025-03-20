//
//  NTESInputNickNameWindowView.h
//  NIM
//
//  Created by 彭爽 on 2021/9/7.
//  Copyright © 2021 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^KnowBlock)(NSString *niceNmae);

@interface NTESInputNickNameWindowView : UIView

@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UITextField *textField;
@property (nonatomic ,strong) UIButton *dowmButton;

@property (nonatomic,copy) KnowBlock block;
-(void)clickKnowButton:(KnowBlock)block;
- (void)show;

@end

NS_ASSUME_NONNULL_END
