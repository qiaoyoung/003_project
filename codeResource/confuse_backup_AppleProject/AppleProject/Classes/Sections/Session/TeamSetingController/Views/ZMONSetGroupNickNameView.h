//
//  ZMONSetGroupNickNameView.h
//  NIM
//
//  Created by Yan Wang on 2024/7/29.
//  Copyright © 2024 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SpeiceBackBlock) (NSString *Name);

@interface ZMONSetGroupNickNameView : UIView

@property (nonatomic, copy) SpeiceBackBlock speiceBackBlock;

/** 动画显示 */
- (void)animationShow;

/** 动画关闭 */
- (void)animationClose;
@end

NS_ASSUME_NONNULL_END
