//
//  KEKESetNickNameView.h
//  KEKEChat
//
//  Created by Yan Wang on 2024/4/7.
//  Copyright © 2024 KEKE. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SpeiceBackBlock) (NSString *nickName);

@interface KEKESetNickNameView : UIView

@property (nonatomic, copy) SpeiceBackBlock speiceBackBlock;

//@property (nonatomic, strong) NSString *nickname;

- (void)reloadWithNickname:(NSString *)nickname;

/** 动画显示 */
- (void)animationShow;

/** 动画关闭 */
- (void)animationClose;

@end

NS_ASSUME_NONNULL_END
