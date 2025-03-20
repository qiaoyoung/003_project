// __DEBUG__
// __CLOSE_PRINT__
//
//  FromMax.h
//  JYImageTextCombine
//
//  Created by JackYoung on 2022/4/2.
//  Copyright © 2022 Jack Young. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface CCCBubbleButtonModel : NSObject
@interface FromMax : NSObject

//: @property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *name;
//: @property (nonatomic, assign)NSInteger buttonId;
@property (nonatomic, assign)NSInteger buttonId;
//: @property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *imageName;

//: @property (nonatomic,strong) BBBMediaItem *item;
@property (nonatomic,strong) WithMin *item;
//: @property (nonatomic,strong) UIImage *normalImage;
@property (nonatomic,strong) UIImage *normalImage;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END