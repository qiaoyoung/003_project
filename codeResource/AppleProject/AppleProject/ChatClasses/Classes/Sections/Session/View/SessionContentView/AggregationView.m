
#import <Foundation/Foundation.h>
typedef struct {
    Byte elanSorry;
    Byte *worthConsume;
    unsigned int tabularArrayCell;
    bool spitMove;
	int toehold;
} WireData;

NSString *StringFromWireData(WireData *data);


//: invalid item selector!
WireData str_resourceIconObstacleContent = (WireData){76, (Byte []){37, 34, 58, 45, 32, 37, 40, 108, 37, 56, 41, 33, 108, 63, 41, 32, 41, 47, 56, 35, 62, 109, 76}, 22, false, 38};


//: NTESMessageTranslate
WireData str_threadViewValue = (WireData){205, (Byte []){131, 153, 136, 158, 128, 168, 190, 190, 172, 170, 168, 153, 191, 172, 163, 190, 161, 172, 185, 168, 230}, 20, false, 213};

// __DEBUG__
// __CLOSE_PRINT__
//
//  AggregationView.m
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionTextContentView.h"
#import "AggregationView.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "CCCGlobalMacro.h"
#import "CCCGlobalMacro.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "CCCTextView.h"
#import "LanguageWithPositionScrollView.h"
//: #import "CCCSessionConfig.h"
#import "FromConfig.h"
//: #import "NTESSessionViewController.h"
#import "PointBlankViewController.h"
//: #import "NSObject+tyl_internalIdentifier.h"
#import "NSObject+Ting.h"

//: NSString *const NIMTextMessageLabelLinkData = @"NIMTextMessageLabelLinkData";
NSString *const k_sizeCurrentTitle = @"NIMTextMessageLabelLinkData";

//: @interface CCCSessionTextContentView()<M80AttributedLabelDelegate>
@interface AggregationView()<DisableShowInput>

//: @property (nonatomic, strong) NSString *urlStr;
@property (nonatomic, strong) NSString *urlStr;
//: @property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSURL *url;

//: @end
@end

//: @implementation CCCSessionTextContentView
@implementation AggregationView

//: - (instancetype)initSessionMessageContentView
- (instancetype)initMessageOpen
{
    //: if (self = [super initSessionMessageContentView]) {
    if (self = [super initMessageOpen]) {
        //: _textView = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
        _textView = [[MessageEnableTextView alloc] initWithFrame:CGRectZero];
        //: _textView.M80delegate = self;
        _textView.M80delegate = self;
        //: _textView.numberOfLines = 0;
        _textView.numberOfLines = 0;
        //: _textView.autoDetectLinks = YES;
        _textView.autoDetectLinks = YES;
        //: _textView.underLineForLink = YES;
        _textView.underLineForLink = YES;
        //: _textView.lineBreakMode = NSLineBreakByWordWrapping;
        _textView.lineBreakMode = NSLineBreakByWordWrapping;
        //: _textView.backgroundColor = [UIColor clearColor];
        _textView.backgroundColor = [UIColor clearColor];
        //: _textView.isShowTextSelection = YES;
        _textView.isShowTextSelection = YES;
        //        _textView.selectable = YES;


        @
         //: autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
         autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
                      ;
        //: _textView.selectBlock = ^(BBBMediaItem *item) {
        _textView.selectBlock = ^(WithMin *item) {
            @
             //: try{} @finally{} __typeof__(self) self = __weak_self__;
             try{} @finally{} __typeof__(self) self = __weak_self__;
                            ;
            //: if (self.delegate && [self.delegate respondsToSelector:@selector(onLongTap:)]) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(tables:)]) {
                //: NSString *text = [self.textView.text substringWithRange:self.textView.selectedRange];
                NSString *text = [self.textView.text substringWithRange:self.textView.selectedRange];
                //: self.model.message.tyl_internalIdentifier = text;
                self.model.message.Ting = text;
                //: [self.delegate onLongTap:self.model.message];
                [self.delegate tables:self.model.message];
                //: if (self.textView.actionDelegate && [self.textView.actionDelegate respondsToSelector:@selector(onTapMediaItem:)]) {
                if (self.textView.actionDelegate && [self.textView.actionDelegate respondsToSelector:@selector(allOf:)]) {
                    //: BOOL handled = [self.textView.actionDelegate onTapMediaItem:item];
                    BOOL handled = [self.textView.actionDelegate allOf:item];
                    //: if (!handled) {
                    if (!handled) {
                        //: NSAssert(0, @"invalid item selector!");
                        NSAssert(0, StringFromWireData(&str_resourceIconObstacleContent));
                    }
                }
            }
        //: };
        };

        //: [self addSubview:_textView];
        [self addSubview:_textView];
    }
    //: return self;
    return self;
}

//: -(void)gotoUrl
-(void)textMarginButton
{
    //: if ([[UIApplication sharedApplication] canOpenURL:self.url]) {
    if ([[UIApplication sharedApplication] canOpenURL:self.url]) {
        //: [[UIApplication sharedApplication] openURL:self.url options:@{} completionHandler:^(BOOL success) {
        [[UIApplication sharedApplication] openURL:self.url options:@{} completionHandler:^(BOOL success) {
        //: }];
        }];
    }
}

//: - (BOOL)checkUrlWithString:(NSString *)str
- (BOOL)image:(NSString *)str
{
    //: __block BOOL isUrl = NO;
    __block BOOL isUrl = NO;
    //: NSError *error = nil;
    NSError *error = nil;
    //: NSDataDetector *detector = [NSDataDetector
    NSDataDetector *detector = [NSDataDetector
                                //: dataDetectorWithTypes:NSTextCheckingTypeLink
                                dataDetectorWithTypes:NSTextCheckingTypeLink
                                //: error:&error];
                                error:&error];

    //: [detector enumerateMatchesInString:str
    [detector enumerateMatchesInString:str
                               //: options:0
                               options:0
                                 //: range:NSMakeRange(0, str.length)
                                 range:NSMakeRange(0, str.length)
                            //: usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                            usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {

        //: if (result.resultType == NSTextCheckingTypeLink) {
        if (result.resultType == NSTextCheckingTypeLink) {
            //: isUrl = YES;
            isUrl = YES;
            //: self.url = result.URL;
            self.url = result.URL;
        }
    //: }];
    }];

    //: return isUrl;
    return isUrl;
}

//: - (void)refresh:(BBBMessageModel *)data
- (void)video:(AccumulationCenter *)data
{
    //: if (self.model == data) {
    if (self.model == data) {
        //: return;
        return;
    }

    //: [super refresh:data];
    [super video:data];

    //: NSString *text = self.model.message.text;
    NSString *text = self.model.message.text;
    //: CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:data.message];
    CenterShould *setting = [[Indicator reach].config info:data.message];
    //: self.textView.textColor = setting.textColor;
    self.textView.textColor = setting.textColor;
    //: self.textView.font = setting.font;
    self.textView.font = setting.font;
    //: [self.textView nim_setText:text];
    [self.textView showName:text];

    //: if ([self.delegate respondsToSelector:@selector(onLongTap:complete:)]) {
    if ([self.delegate respondsToSelector:@selector(view:to:)]) {
        //: BOOL shouldShowMenuByMessage = [self.delegate onLongTap:data.message complete:^(id data) {
        BOOL shouldShowMenuByMessage = [self.delegate view:data.message to:^(id data) {
            //: if ([data isKindOfClass:[NTESSessionViewController class]]) {
            if ([data isKindOfClass:[PointBlankViewController class]]) {
                //: NTESSessionViewController *vc = (NTESSessionViewController *)data;
                PointBlankViewController *vc = (PointBlankViewController *)data;
                //: self.textView.actionDelegate = vc;
                self.textView.actionDelegate = vc;
                //: self.textView.config = vc.sessionConfig;
                self.textView.config = vc.iconConfig;
            }
        //: }];
        }];

        //: self.textView.isShowTextSelection = shouldShowMenuByMessage;
        self.textView.isShowTextSelection = shouldShowMenuByMessage;
        //: if (shouldShowMenuByMessage) {
        if (shouldShowMenuByMessage) {
            //: [self.textView genMediaButtonsWithMessage:data.message];
            [self.textView infoMonth:data.message];
        }
    }

    //: BOOL isValid = [self checkUrlWithString:self.model.message.text];
    BOOL isValid = [self image:self.model.message.text];
    //: if(isValid){
    if(isValid){
        //: _textView.userInteractionEnabled = YES;
        _textView.userInteractionEnabled = YES;
        //: UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoUrl)];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(textMarginButton)];
        //: [_textView addGestureRecognizer:singleTap];
        [_textView addGestureRecognizer:singleTap];
    }
}




//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: UIEdgeInsets contentInsets = self.model.contentViewInsets;
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    //: CGFloat tableViewWidth = self.superview.nim_width;
    CGFloat tableViewWidth = self.superview.nim_width;
    //: CGSize contentsize = [self.model contentSize:tableViewWidth];
    CGSize contentsize = [self.model aggregation:tableViewWidth];
    //    CGSize contentsize         = [self contentSize:tableViewWidth message:self.model.message];
    //: CGRect labelFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    CGRect labelFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    //: self.textView.frame = labelFrame;
    self.textView.frame = labelFrame;
}

//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)color:(CGFloat)cellWidth info:(NIMMessage *)message
{
    //: NSString *text = message.text;
    NSString *text = message.text;
    //: if ([message.localExt.allKeys containsObject:@"NTESMessageTranslate"])
    if ([message.localExt.allKeys containsObject:StringFromWireData(&str_threadViewValue)])
    {
        //: text = [NSString stringWithFormat:@"%@\n%@",text,[message.localExt objectForKey:@"NTESMessageTranslate"]];
        text = [NSString stringWithFormat:@"%@\n%@",text,[message.localExt objectForKey:StringFromWireData(&str_threadViewValue)]];
    }
    //: self.textView.font = [[AppleProjectKit sharedKit].config setting:message].font;
    self.textView.font = [[Indicator reach].config info:message].font;
    //: [self.textView nim_setText:text];
    [self.textView showName:text];
    //: CGFloat msgBubbleMaxWidth = (cellWidth - 130);
    CGFloat msgBubbleMaxWidth = (cellWidth - 130);
    //: CGFloat bubbleLeftToContent = 14;
    CGFloat bubbleLeftToContent = 14;
    //: CGFloat contentRightToBubble = 14;
    CGFloat contentRightToBubble = 14;
    //: CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
    CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);

    //: return [self.textView sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
    return [self.textView sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
}

//: #pragma mark - M80AttributedLabelDelegate
#pragma mark - DisableShowInput
//: - (void)m80AttributedLabel:(M80AttributedLabel *)label
- (void)success:(MessageEnableTextView *)label
             //: clickedOnLink:(id)linkData{
             touch:(id)linkData{
    //: BBBKitEvent *event = [[BBBKitEvent alloc] init];
    MightHaveBeenAdd *event = [[MightHaveBeenAdd alloc] init];
    //: event.eventName = BBBKitEventNameTapLabelLink;
    event.eventName = k_managerContent;
    //: event.messageModel = self.model;
    event.messageModel = self.model;
    //: event.data = linkData;
    event.data = linkData;
    //: [self.delegate onCatchEvent:event];
    [self.delegate birthplaces:event];
}

//: @end
@end

Byte *WireDataToByte(WireData *data) {
    if (data->spitMove) return data->worthConsume;
    for (int i = 0; i < data->tabularArrayCell; i++) {
        data->worthConsume[i] ^= data->elanSorry;
    }
    data->worthConsume[data->tabularArrayCell] = 0;
    data->spitMove = true;
	if (data->tabularArrayCell >= 1) {
		data->toehold = data->worthConsume[0];
	}
    return data->worthConsume;
}

NSString *StringFromWireData(WireData *data) {
    return [NSString stringWithUTF8String:(char *)WireDataToByte(data)];
}
