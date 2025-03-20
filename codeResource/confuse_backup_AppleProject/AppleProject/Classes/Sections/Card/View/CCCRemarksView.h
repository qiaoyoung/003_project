//
//  CCCRemarksView.h
//  KEKEChat
//
//  Created by Yan Wang on 2024/4/23.
//  Copyright © 2024 KEKE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SpeiceBackBlock) (NSString *nickName);

@interface CCCRemarksView : UIView

@property (nonatomic, copy) SpeiceBackBlock speiceBackBlock;

@property (nonatomic, strong) NIMUser *user;

- (void)reloadWithNickname:(NIMUser *)user;

/** 动画显示 */
- (void)animationShow;

/** 动画关闭 */
- (void)animationClose;

@end

NS_ASSUME_NONNULL_END
