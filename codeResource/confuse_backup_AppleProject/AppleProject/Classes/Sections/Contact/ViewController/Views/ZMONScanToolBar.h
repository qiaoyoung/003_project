//
//  ZMONScanToolBar.h
//  NIM
//
//  Created by Yan Wang on 2024/7/27.
//  Copyright © 2024 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMONScanToolBar : UIView

- (void)addQRCodeTarget:(id)aTarget action:(SEL)aAction;
- (void)addAlbumTarget:(id)aTarget action:(SEL)aAction;

- (void)showTorch;
- (void)dismissTorch;

@end

NS_ASSUME_NONNULL_END
