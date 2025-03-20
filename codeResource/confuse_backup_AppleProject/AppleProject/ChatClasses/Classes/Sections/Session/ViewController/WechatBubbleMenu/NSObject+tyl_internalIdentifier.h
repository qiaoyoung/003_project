//
//  NSObject+tyl_internalIdentifier.h
//  NIM
//
//  Created by 田玉龙 on 2023/12/5.
//  Copyright © 2023 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (tyl_internalIdentifier)

// 标记此attributedString中的表情是否已经检索渲染成了emoji表情
@property (nonatomic, strong) NSString *tyl_internalIdentifier;


@end

NS_ASSUME_NONNULL_END
