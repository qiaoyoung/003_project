// __DEBUG__
// __CLOSE_PRINT__
//
//  LanguageWithPositionScrollView.h
//  JYImageTextCombine
//
//  Created by JackYoung on 2022/3/31.
//  Copyright © 2022 Jack Young. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface CCCTextView : UITextView
@interface LanguageWithPositionScrollView : UITextView

//: @property (nonatomic, copy)void (^selectBlock)(BBBMediaItem *item);
@property (nonatomic, copy)void (^selectBlock)(WithMin *item);

//: @property (nonatomic, copy) NSArray *selectedAllRangeButtons;
@property (nonatomic, copy) NSArray *selectedAllRangeButtons;
//: @property (nonatomic, copy) NSArray *selectedPartRangeButtons;
@property (nonatomic, copy) NSArray *selectedPartRangeButtons;

//: @property (nonatomic,weak) id<CCCSessionConfig> config;
@property (nonatomic,weak) id<FromConfig> config;
//: @property (nonatomic,weak) id<NIMInputActionDelegate> actionDelegate;
@property (nonatomic,weak) id<ColorDelegate> actionDelegate;


//取消文本选中效果
//: - (void)hideTextSelection;
- (void)image;

//: - (void)genMediaButtonsWithMessage:(NIMMessage *)message;
- (void)infoMonth:(NIMMessage *)message;

// 群公告复制
//: - (void)new_genMediaButton;
- (void)genBubble;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END