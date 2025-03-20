//
//  SNTextHighlight.h
// AppleProjectKit
//
//  Created by 田玉龙 on 2022/8/25.
//  Copyright © 2022 NetEase. All rights reserved.
//

#import "YYTextAttribute.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SNTextHighlightType) {
    SNTextHighlightTypeDefault = 0, /// 服务下发了不认识的类型
    SNTextHighlightTypeEmoji,
};

@interface SNTextHighlight : YYTextHighlight

@property (nonatomic, assign) SNTextHighlightType type;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *textId;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, assign)  BOOL needFollow; //点击发布后自动关注@对象
@property (nonatomic, assign) BOOL associate; // 联想话题区分

@end

NS_ASSUME_NONNULL_END
