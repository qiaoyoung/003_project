//
//  CCCTextView.h
//  JYImageTextCombine
//
//  Created by JackYoung on 2022/3/31.
//  Copyright © 2022 Jack Young. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCCTextView : UITextView

@property (nonatomic, copy)void (^selectBlock)(BBBMediaItem *item);

@property (nonatomic, copy) NSArray *selectedAllRangeButtons;
@property (nonatomic, copy) NSArray *selectedPartRangeButtons;

@property (nonatomic,weak) id<CCCSessionConfig> config;
@property (nonatomic,weak) id<NIMInputActionDelegate> actionDelegate;


//取消文本选中效果
- (void)hideTextSelection;

- (void)genMediaButtonsWithMessage:(NIMMessage *)message;

// 群公告复制
- (void)new_genMediaButton;

@end

NS_ASSUME_NONNULL_END
