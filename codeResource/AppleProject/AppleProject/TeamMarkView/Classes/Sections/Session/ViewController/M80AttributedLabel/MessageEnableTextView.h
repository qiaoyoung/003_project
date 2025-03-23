// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageEnableTextView.h
//  MessageEnableTextView
//
//  Created by amao on 13-9-1.
//  Copyright (c) 2013年 www.xiangwangfeng.com. All rights reserved.
//

// __M_A_C_R_O__
//: #import "M80AttributedLabelDefines.h"
#import "M80AttributedLabelDefines.h"
//: #import "NSMutableAttributedString+M80.h"
#import "NSMutableAttributedString+M80.h"
//: #import "CCCTextView.h"
#import "LanguageWithPositionScrollView.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @class M80AttributedLabelURL;
@class M80AttributedLabelURL;

//: @interface M80AttributedLabel : CCCTextView
@interface MessageEnableTextView : LanguageWithPositionScrollView
//: @property (nonatomic,weak) id<M80AttributedLabelDelegate> M80delegate;
@property (nonatomic,weak) id<DisableShowInput> M80delegate;
//: @property (nonatomic,strong) UIColor *highlightColor; 
@property (nonatomic,strong) UIColor *highlightColor; //链接点击时背景高亮色
//: @property (nonatomic,strong) UIColor *linkColor; 
@property (nonatomic,strong) UIColor *linkColor; //链接色
//: @property (nonatomic,strong) UIColor *shadowColor; 
@property (nonatomic,strong) UIColor *shadowColor; //阴影颜色
//: @property (nonatomic,assign) CGSize shadowOffset; 
@property (nonatomic,assign) CGSize shadowOffset; //阴影offset
//: @property (nonatomic,assign) CGFloat shadowBlur; 
@property (nonatomic,assign) CGFloat shadowBlur; //阴影半径
//: @property (nonatomic,assign) BOOL underLineForLink; 
@property (nonatomic,assign) BOOL underLineForLink; //链接是否带下划线
//: @property (nonatomic,assign) BOOL autoDetectLinks; 
@property (nonatomic,assign) BOOL autoDetectLinks; //自动检测

//: @property (nonatomic,assign) NSInteger numberOfLines; 
@property (nonatomic,assign) NSInteger numberOfLines; //行数
//: @property (nonatomic,assign) NSLineBreakMode lineBreakMode; 
@property (nonatomic,assign) NSLineBreakMode lineBreakMode; //LineBreakMode

//: @property (nonatomic,assign) CGFloat lineSpacing; 
@property (nonatomic,assign) CGFloat lineSpacing; //行间距
//: @property (nonatomic,assign) CGFloat paragraphSpacing; 
@property (nonatomic,assign) CGFloat paragraphSpacing; //段间距

//: @property (nonatomic,assign) BOOL isShowTextSelection; 
@property (nonatomic,assign) BOOL isShowTextSelection; //开始选择并复制 ，默认是no

//添加文本
//: - (void)appendText:(NSString *)text;
- (void)mixInText:(NSString *)text;
//: - (void)appendAttributedText:(NSAttributedString *)attributedText;
- (void)behindTitleText:(NSAttributedString *)attributedText;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END