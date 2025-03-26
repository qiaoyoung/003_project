
#import <Foundation/Foundation.h>

NSString *StringFromIndexData(Byte *data);


//: 按住查看
Byte str_hearingName[] = {20, 12, 9, 14, 128, 76, 89, 250, 159, 48, 34, 207, 197, 15, 239, 149, 146, 237, 198, 152, 239, 168, 174, 240, 165, 148, 43};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TutorialDisableView.m
//  NIM
//
//  Created by amao on 7/2/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESSessionSnapchatContentView.h"
#import "TutorialDisableView.h"
//: #import "NTESSnapchatAttachment.h"
#import "TopOfTap.h"
//: #import "NTESSessionUtil.h"
#import "ChildMark.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"

//: NSString *const NIMDemoEventNameOpenSnapPicture = @"NIMDemoEventNameOpenSnapPicture";
NSString *const k_eventMakeTempValue = @"NIMDemoEventNameOpenSnapPicture";
//: NSString *const NIMDemoEventNameCloseSnapPicture = @"NIMDemoEventNameCloseSnapPicture";
NSString *const k_submitValue = @"NIMDemoEventNameCloseSnapPicture";


//: @interface NTESSessionSnapchatContentView()
@interface TutorialDisableView()

//: @property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *imageView;

//: @property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UILabel *label;

//: @property (nonatomic,strong) UILongPressGestureRecognizer *longpressGesture;
@property (nonatomic,strong) UILongPressGestureRecognizer *longpressGesture;

//: @end
@end

//: @implementation NTESSessionSnapchatContentView
@implementation TutorialDisableView


//: - (instancetype)initSessionMessageContentView{
- (instancetype)initMessageOpen{
    //: self = [super initSessionMessageContentView];
    self = [super initMessageOpen];
    //: if (self) {
    if (self) {
        //: _longpressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPressDown:)];
        _longpressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(queries:)];
        //: [self addGestureRecognizer:_longpressGesture];
        [self addGestureRecognizer:_longpressGesture];
        //: _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        //: [self addSubview:_imageView];
        [self addSubview:_imageView];
        //: self.bubbleImageView.hidden = YES;
        self.bubbleImageView.hidden = YES;//图片背景自带气泡。。

        //: _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _label.font = [UIFont systemFontOfSize:13.f];
        _label.font = [UIFont systemFontOfSize:13.f];
        //: _label.textColor = [UIColor grayColor];
        _label.textColor = [UIColor grayColor];
        //: _label.text = @"按住查看".ntes_localized;
        _label.text = StringFromIndexData(str_hearingName).language;
        //: [_label sizeToFit];
        [_label sizeToFit];
        //: [self addSubview:_label];
        [self addSubview:_label];
    }
    //: return self;
    return self;
}

//: - (void)refresh:(BBBMessageModel *)model{
- (void)video:(AccumulationCenter *)model{
    //: [super refresh:model];
    [super video:model];
    //: NIMCustomObject * customObject = (NIMCustomObject*)model.message.messageObject;
    NIMCustomObject * customObject = (NIMCustomObject*)model.message.messageObject;
    //: NTESSnapchatAttachment *attachment = (NTESSnapchatAttachment *)customObject.attachment;
    TopOfTap *attachment = (TopOfTap *)customObject.attachment;
    //: self.imageView.image = attachment.showCoverImage;
    self.imageView.image = attachment.showCoverImage;
    //: self.label.hidden = attachment.isFired;
    self.label.hidden = attachment.isFired;
    //: self.longpressGesture.enabled = !attachment.isFired;
    self.longpressGesture.enabled = !attachment.isFired;

    //禁用掉CCCMessageCell中的长按手势，防止手势冲突
    //: [self disableMessageCellGesture:!attachment.isFired];
    [self range:!attachment.isFired];
}

//: - (void)disableMessageCellGesture:(BOOL)disable {
- (void)range:(BOOL)disable {
    //: if ([self.delegate respondsToSelector:@selector(disableLongPress:)]) {
    if ([self.delegate respondsToSelector:@selector(currents:)]) {
        //: [self.delegate disableLongPress:disable];
        [self.delegate currents:disable];
    }
}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: NIMCustomObject * customObject = (NIMCustomObject*)self.model.message.messageObject;
    NIMCustomObject * customObject = (NIMCustomObject*)self.model.message.messageObject;
    //: NTESSnapchatAttachment *attachment = (NTESSnapchatAttachment *)customObject.attachment;
    TopOfTap *attachment = (TopOfTap *)customObject.attachment;
    //: UIEdgeInsets contentInsets = self.model.contentViewInsets;
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    //: UIImage *showCoverImage = attachment.showCoverImage;
    UIImage *showCoverImage = attachment.showCoverImage;
    //: CGRect imageViewFrame = CGRectMake(contentInsets.left, contentInsets.top, showCoverImage.size.width, showCoverImage.size.height);
    CGRect imageViewFrame = CGRectMake(contentInsets.left, contentInsets.top, showCoverImage.size.width, showCoverImage.size.height);
    //: self.imageView.frame = imageViewFrame;
    self.imageView.frame = imageViewFrame;

    //: CGFloat customSnapMessageImageRightToText = 5.f;
    CGFloat customSnapMessageImageRightToText = 5.f;
    //: CGFloat customSnapMessageTextBottom = 20.f;
    CGFloat customSnapMessageTextBottom = 20.f;
    //: self.label.left = self.model.message.isOutgoingMsg ? self.imageView.left - customSnapMessageImageRightToText - self.label.width : self.imageView.right + customSnapMessageImageRightToText + 5;
    self.label.left = self.model.message.isOutgoingMsg ? self.imageView.left - customSnapMessageImageRightToText - self.label.width : self.imageView.right + customSnapMessageImageRightToText + 5;
    //: self.label.bottom = self.imageView.bottom - customSnapMessageTextBottom ;
    self.label.bottom = self.imageView.bottom - customSnapMessageTextBottom ;
}



//: - (void)onLongPressDown:(UILongPressGestureRecognizer *)recognizer
- (void)queries:(UILongPressGestureRecognizer *)recognizer
{
    //: NIMMessage *message = self.model.message;
    NIMMessage *message = self.model.message;
    //: if (!message.isReceivedMsg && message.deliveryState != NIMMessageDeliveryStateDeliveried) {
    if (!message.isReceivedMsg && message.deliveryState != NIMMessageDeliveryStateDeliveried) {
        //: return;
        return;
    }
    //: if (recognizer.state != UIGestureRecognizerStateBegan) {
    if (recognizer.state != UIGestureRecognizerStateBegan) {
        //: return;
        return;
    }
    //: recognizer.enabled = NO;
    recognizer.enabled = NO;
    //: [self goOpen];
    [self argument];
}


//: - (void)onTouchUpInside:(id)sender{
- (void)priceTag:(id)sender{
    //: if (self.presentedView) {
    if (self.pushTotalerval) {
        //: [self goClose];
        [self precessForOn];
    }
}

//: - (void)onTouchUpOutside:(id)sender{
- (void)shoulds:(id)sender{
    //: if (self.presentedView) {
    if (self.pushTotalerval) {
        //: [self goClose];
        [self precessForOn];
    }
}

//: - (void)goOpen{
- (void)argument{
    //: if ([self.delegate respondsToSelector:@selector(onCatchEvent:)]) {
    if ([self.delegate respondsToSelector:@selector(birthplaces:)]) {
        //: BBBKitEvent *event = [[BBBKitEvent alloc] init];
        MightHaveBeenAdd *event = [[MightHaveBeenAdd alloc] init];
        //: event.eventName = NIMDemoEventNameOpenSnapPicture;
        event.eventName = k_eventMakeTempValue;
        //: event.messageModel = self.model;
        event.messageModel = self.model;
        //: event.data = self;
        event.data = self;
        //: [self.delegate onCatchEvent:event];
        [self.delegate birthplaces:event];
    }
}

//: - (void)goClose{
- (void)precessForOn{
    //: if ([self.delegate respondsToSelector:@selector(onCatchEvent:)]) {
    if ([self.delegate respondsToSelector:@selector(birthplaces:)]) {
        //: BBBKitEvent *event = [[BBBKitEvent alloc] init];
        MightHaveBeenAdd *event = [[MightHaveBeenAdd alloc] init];
        //: event.eventName = NIMDemoEventNameCloseSnapPicture;
        event.eventName = k_submitValue;
        //: event.messageModel = self.model;
        event.messageModel = self.model;
        //: event.data = self;
        event.data = self;
        //: [self.delegate onCatchEvent:event];
        [self.delegate birthplaces:event];
    }
}


//: @end
@end

Byte * IndexDataToCache(Byte *data) {
    int cupOfTea = data[0];
    int purl = data[1];
    Byte headerPasta = data[2];
    int ziti = data[3];
    if (!cupOfTea) return data + ziti;
    for (int i = ziti; i < ziti + purl; i++) {
        int value = data[i] - headerPasta;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[ziti + purl] = 0;
    return data + ziti;
}

NSString *StringFromIndexData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)IndexDataToCache(data)];
}
