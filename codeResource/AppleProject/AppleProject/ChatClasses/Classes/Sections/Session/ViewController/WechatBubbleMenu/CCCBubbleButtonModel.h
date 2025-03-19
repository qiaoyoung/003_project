//
//  CCCBubbleButtonModel.h
//  JYImageTextCombine
//
//  Created by JackYoung on 2022/4/2.
//  Copyright © 2022 Jack Young. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCCBubbleButtonModel : NSObject

@property (nonatomic, copy)  NSString *name;
@property (nonatomic, assign)NSInteger buttonId;
@property (nonatomic, copy)  NSString *imageName;

@property (nonatomic,strong) BBBMediaItem *item;
@property (nonatomic,strong) UIImage *normalImage;

@end

NS_ASSUME_NONNULL_END
