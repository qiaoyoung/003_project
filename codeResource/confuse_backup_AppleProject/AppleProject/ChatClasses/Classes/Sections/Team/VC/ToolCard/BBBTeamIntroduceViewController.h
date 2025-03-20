//
//  BBBTeamIntroduceViewController.h
//  NIM
//
//  Created by Yan Wang on 2024/6/27.
//  Copyright © 2024 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SpeiceBackBlock) (NSString *Introduce);

@interface BBBTeamIntroduceViewController : UIViewController

@property (nonatomic, copy) SpeiceBackBlock speiceBackBlock;

@property (nonatomic, copy) NSString *defaultContent;

@end

NS_ASSUME_NONNULL_END
