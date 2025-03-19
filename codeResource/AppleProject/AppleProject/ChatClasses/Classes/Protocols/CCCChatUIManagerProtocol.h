//
//  CCCChatUIManagerProtocol.h
// AppleProjectKit
//
//  Created by 丁文超 on 2020/3/19.
//  Copyright © 2020 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NIMMessage;

NS_ASSUME_NONNULL_BEGIN

@protocol CCCChatUIManager <NSObject>

- (void)forwardMessage:(NIMMessage *)message fromViewController:(UIViewController *)fromVC;

@end

NS_ASSUME_NONNULL_END
