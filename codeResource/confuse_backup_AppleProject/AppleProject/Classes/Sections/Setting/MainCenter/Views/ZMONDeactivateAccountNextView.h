//
//  ZMONDeactivateAccountNextView.h
//  AppleProject
//
//  Created by Yan Wang on 2025/2/6.
//  Copyright © 2025 AppleProject. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SpeiceBackBlock) (NSString *nickName);

@interface ZMONDeactivateAccountNextView : UIView

@property (nonatomic, copy) SpeiceBackBlock speiceBackBlock;

- (void)reloadWithNickname:(NSString *)nickname;

/** 动画显示 */
- (void)animationShow;

/** 动画关闭 */
- (void)animationClose;

@end

NS_ASSUME_NONNULL_END
