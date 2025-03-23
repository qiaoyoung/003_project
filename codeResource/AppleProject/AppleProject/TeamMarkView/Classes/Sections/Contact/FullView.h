// __DEBUG__
// __CLOSE_PRINT__
//
//  FullView.h
//  NIM
//
//  Created by Yan Wang on 2024/6/28.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: typedef void(^SpeiceBackBlock) (NSString *groupName);
typedef void(^SpeiceBackBlock) (NSString *groupName);

//: @interface AAASetGroupNameView : UIView
@interface FullView : UIView

//: @property (nonatomic, copy) SpeiceBackBlock speiceBackBlock;
@property (nonatomic, copy) SpeiceBackBlock speiceBackBlock;

//: @property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *nickname;

//- (void)reloadWithNickname:(NSString *)name;

/** 动画显示 */
//: - (void)animationShow;
- (void)clean;

/** 动画关闭 */
//: - (void)animationClose;
- (void)iconEnable;
//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END