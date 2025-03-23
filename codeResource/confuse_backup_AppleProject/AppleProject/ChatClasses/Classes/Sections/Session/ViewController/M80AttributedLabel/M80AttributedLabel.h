//
//  M80AttributedLabel.h
//  M80AttributedLabel
//
//  Created by amao on 13-9-1.
//  Copyright (c) 2013年 www.xiangwangfeng.com. All rights reserved.
//

#import "M80AttributedLabelDefines.h"
#import "NSMutableAttributedString+M80.h"
#import "CCCTextView.h"

NS_ASSUME_NONNULL_BEGIN

@class M80AttributedLabelURL;

@interface M80AttributedLabel : CCCTextView
@property (nonatomic,weak)         id<M80AttributedLabelDelegate> M80delegate;
@property (nonatomic,strong)       UIColor *highlightColor;               //链接点击时背景高亮色
@property (nonatomic,strong)       UIColor *linkColor;                    //链接色
@property (nonatomic,strong)       UIColor *shadowColor;                  //阴影颜色
@property (nonatomic,assign)       CGSize  shadowOffset;                   //阴影offset
@property (nonatomic,assign)       CGFloat shadowBlur;                     //阴影半径
@property (nonatomic,assign)       BOOL    underLineForLink;               //链接是否带下划线
@property (nonatomic,assign)       BOOL    autoDetectLinks;                //自动检测

@property (nonatomic,assign)       NSInteger   numberOfLines;              //行数
@property (nonatomic,assign)       NSLineBreakMode lineBreakMode;          //LineBreakMode

@property (nonatomic,assign)       CGFloat lineSpacing;                    //行间距
@property (nonatomic,assign)       CGFloat paragraphSpacing;               //段间距

@property (nonatomic,assign)       BOOL    isShowTextSelection;            //开始选择并复制 ，默认是no

//添加文本
- (void)appendText:(NSString *)text;
- (void)appendAttributedText:(NSAttributedString *)attributedText;

@end

NS_ASSUME_NONNULL_END
