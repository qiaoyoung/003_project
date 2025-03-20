//
//  CCCSessionTextContentView.m
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "CCCSessionTextContentView.h"
#import "M80AttributedLabel+AppleProjectKit.h"
#import "BBBMessageModel.h"
#import "CCCGlobalMacro.h"
#import "UIViewNimKit.h"
#import "AppleProjectKit.h"
#import "CCCTextView.h"
#import "CCCSessionConfig.h"
#import "NTESSessionViewController.h"
#import "NSObject+tyl_internalIdentifier.h"

NSString *const NIMTextMessageLabelLinkData = @"NIMTextMessageLabelLinkData";

@interface CCCSessionTextContentView()<M80AttributedLabelDelegate>

@property (nonatomic, strong) NSString *urlStr;
@property (nonatomic, strong) NSURL *url;

@end

@implementation CCCSessionTextContentView

- (instancetype)initSessionMessageContentView
{
    if (self = [super initSessionMessageContentView]) {
        _textView = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
        _textView.M80delegate = self;
        _textView.numberOfLines = 0;
        _textView.autoDetectLinks = YES;
        _textView.underLineForLink = YES;
        _textView.lineBreakMode = NSLineBreakByWordWrapping;
        _textView.backgroundColor = [UIColor clearColor];
        _textView.isShowTextSelection = YES;
        //        _textView.selectable = YES;
        
        
        @weakify(self);
        _textView.selectBlock = ^(BBBMediaItem *item) {
            @strongify(self);
            if (self.delegate && [self.delegate respondsToSelector:@selector(onLongTap:)]) {
                NSString *text = [self.textView.text substringWithRange:self.textView.selectedRange];
                self.model.message.tyl_internalIdentifier = text;
                [self.delegate onLongTap:self.model.message];
                if (self.textView.actionDelegate && [self.textView.actionDelegate respondsToSelector:@selector(onTapMediaItem:)]) {
                    BOOL handled = [self.textView.actionDelegate onTapMediaItem:item];
                    if (!handled) {
                        NSAssert(0, @"invalid item selector!");
                    }
                }
            }
        };
        
        [self addSubview:_textView];
    }
    return self;
}

-(void)gotoUrl
{
    if ([[UIApplication sharedApplication] canOpenURL:self.url]) {
        [[UIApplication sharedApplication] openURL:self.url options:@{} completionHandler:^(BOOL success) {
        }];
    }
}

- (BOOL)checkUrlWithString:(NSString *)str
{
    __block BOOL isUrl = NO;
    NSError *error = nil;
    NSDataDetector *detector = [NSDataDetector
                                dataDetectorWithTypes:NSTextCheckingTypeLink
                                error:&error];
    
    [detector enumerateMatchesInString:str
                               options:0
                                 range:NSMakeRange(0, str.length)
                            usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        
        if (result.resultType == NSTextCheckingTypeLink) {
            isUrl = YES;
            self.url = result.URL;
        }
    }];
    
    return isUrl;
}

- (void)refresh:(BBBMessageModel *)data
{
    if (self.model == data) {
        return;
    }
    
    [super refresh:data];
 
    NSString *text = self.model.message.text;
    CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:data.message];
    self.textView.textColor = setting.textColor;
    self.textView.font = setting.font;
    [self.textView nim_setText:text];
    
    if ([self.delegate respondsToSelector:@selector(onLongTap:complete:)]) {
        BOOL shouldShowMenuByMessage = [self.delegate onLongTap:data.message complete:^(id data) {
            if ([data isKindOfClass:[NTESSessionViewController class]]) {
                NTESSessionViewController *vc = (NTESSessionViewController *)data;
                self.textView.actionDelegate = vc;
                self.textView.config = vc.sessionConfig;
            }
        }];
        
        self.textView.isShowTextSelection = shouldShowMenuByMessage;
        if (shouldShowMenuByMessage) {
            [self.textView genMediaButtonsWithMessage:data.message];
        }
    }
    
    BOOL isValid = [self checkUrlWithString:self.model.message.text];
    if(isValid){
        _textView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoUrl)];
        [_textView addGestureRecognizer:singleTap];
    }
}




- (void)layoutSubviews{
    [super layoutSubviews];
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    CGFloat tableViewWidth = self.superview.nim_width;
    CGSize contentsize         = [self.model contentSize:tableViewWidth];
    //    CGSize contentsize         = [self contentSize:tableViewWidth message:self.model.message];
    CGRect labelFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    self.textView.frame = labelFrame;
}

- (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
{
    NSString *text = message.text;
    if ([message.localExt.allKeys containsObject:@"NTESMessageTranslate"])
    {
        text = [NSString stringWithFormat:@"%@\n%@",text,[message.localExt objectForKey:@"NTESMessageTranslate"]];
    }
    self.textView.font = [[AppleProjectKit sharedKit].config setting:message].font;
    [self.textView nim_setText:text];
    CGFloat msgBubbleMaxWidth    = (cellWidth - 130);
    CGFloat bubbleLeftToContent  = 14;
    CGFloat contentRightToBubble = 14;
    CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
    
    return [self.textView sizeThatFits:CGSizeMake(msgContentMaxWidth, CGFLOAT_MAX)];
}

#pragma mark - M80AttributedLabelDelegate
- (void)m80AttributedLabel:(M80AttributedLabel *)label
             clickedOnLink:(id)linkData{
    BBBKitEvent *event = [[BBBKitEvent alloc] init];
    event.eventName = BBBKitEventNameTapLabelLink;
    event.messageModel = self.model;
    event.data = linkData;
    [self.delegate onCatchEvent:event];
}

@end
