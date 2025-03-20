// __DEBUG__
// __CLOSE_PRINT__
//
//  NSObject+Ting.h
//  NIM
//
//  Created by 田玉龙 on 2023/12/5.
//  Copyright © 2023 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NSObject (tyl_internalIdentifier)
@interface NSObject (Ting)

// 标记此attributedString中的表情是否已经检索渲染成了emoji表情
//: @property (nonatomic, strong) NSString *tyl_internalIdentifier;
@property (nonatomic, strong) NSString *ting;


//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END
