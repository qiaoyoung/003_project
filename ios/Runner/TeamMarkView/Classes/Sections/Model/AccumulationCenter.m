// __DEBUG__
// __CLOSE_PRINT__
//
//  AccumulationCenter.m
// Indicator
//
//  Created by NetEase.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "AAAKitQuickCommentUtil.h"
#import "CaseOfMaxTeam.h"

//: @interface BBBMessageModel()
@interface AccumulationCenter()

//: @property (nonatomic,strong) NSMutableDictionary *contentSizeInfo;
@property (nonatomic,strong) NSMutableDictionary *contentSizeInfo;
//: @property (nonatomic,strong) NSMutableDictionary *replyContentSizeInfo;
@property (nonatomic,strong) NSMutableDictionary *replyContentSizeInfo;

//: @end
@end

//: @implementation BBBMessageModel
@implementation AccumulationCenter

//: @synthesize contentViewInsets = _contentViewInsets;
@synthesize contentViewInsets = _contentViewInsets;
//: @synthesize bubbleViewInsets = _bubbleViewInsets;
@synthesize bubbleViewInsets = _bubbleViewInsets;
//: @synthesize replyContentViewInsets = _replyContentViewInsets;
@synthesize replyContentViewInsets = _replyContentViewInsets;
//: @synthesize replyBubbleViewInsets = _replyBubbleViewInsets;
@synthesize replyBubbleViewInsets = _replyBubbleViewInsets;
//: @synthesize shouldShowAvatar = _shouldShowAvatar;
@synthesize shouldShowAvatar = _shouldShowAvatar;
//: @synthesize shouldShowNickName = _shouldShowNickName;
@synthesize shouldShowNickName = _shouldShowNickName;
//: @synthesize shouldShowLeft = _shouldShowLeft;
@synthesize shouldShowLeft = _shouldShowLeft;
//: @synthesize avatarMargin = _avatarMargin;
@synthesize avatarMargin = _avatarMargin;
//: @synthesize nickNameMargin = _nickNameMargin;
@synthesize nickNameMargin = _nickNameMargin;
//: @synthesize avatarSize = _avatarSize;
@synthesize avatarSize = _avatarSize;
//: @synthesize repliedMessage = _repliedMessage;
@synthesize repliedMessage = _repliedMessage;
//: @synthesize parentMessage = _parentMessage;
@synthesize parentMessage = _parentMessage;

//: - (instancetype)initWithMessage:(NIMMessage*)message
- (instancetype)initWithDisplacement:(NIMMessage*)message
{
    //: if (self = [self init])
    if (self = [self init])
    {
        //: _message = message;
        _message = message;
        //: _messageTime = message.timestamp;
        _messageTime = message.timestamp;
        //: _contentSizeInfo = [[NSMutableDictionary alloc] init];
        _contentSizeInfo = [[NSMutableDictionary alloc] init];
        //: _replyContentSizeInfo = [NSMutableDictionary dictionary];
        _replyContentSizeInfo = [NSMutableDictionary dictionary];
        //: _enableRepliedContent = YES;
        _enableRepliedContent = YES;
        //: _enableQuickComments = YES;
        _enableQuickComments = YES;
        //: _shouldShowPinContent = YES;
        _shouldShowPinContent = YES;
        //: _enableSubMessages = YES;
        _enableSubMessages = YES;
    }
    //: return self;
    return self;
}

//: - (void)cleanCache
- (void)cell
{
    //: [_contentSizeInfo removeAllObjects];
    [_contentSizeInfo removeAllObjects];
    //: _contentViewInsets = UIEdgeInsetsZero;
    _contentViewInsets = UIEdgeInsetsZero;
    //: _bubbleViewInsets = UIEdgeInsetsZero;
    _bubbleViewInsets = UIEdgeInsetsZero;
    //: _replyContentViewInsets = UIEdgeInsetsZero;
    _replyContentViewInsets = UIEdgeInsetsZero;
    //: _replyBubbleViewInsets = UIEdgeInsetsZero;
    _replyBubbleViewInsets = UIEdgeInsetsZero;
}

//: - (NSString*)description{
- (NSString*)description{
    //: return self.message.text;
    return self.message.text;
}

//: - (BOOL)isEqual:(id)object
- (BOOL)isEqual:(id)object
{
    //: if (![object isKindOfClass:[BBBMessageModel class]])
    if (![object isKindOfClass:[AccumulationCenter class]])
    {
        //: return NO;
        return NO;
    }
    //: else
    else
    {
        //: BBBMessageModel *model = object;
        AccumulationCenter *model = object;
        //: return [self.message isEqual:model.message];
        return [self.message isEqual:model.message];
    }
}

//: - (CGSize)contentSize:(CGFloat)width
- (CGSize)aggregation:(CGFloat)width
{
    //: CGSize size = [self.contentSizeInfo[@(width)] CGSizeValue];
    CGSize size = [self.contentSizeInfo[@(width)] CGSizeValue];
    //: if (__CGSizeEqualToSize(size, CGSizeZero))
    if (__CGSizeEqualToSize(size, CGSizeZero))
    {
        //: [self updateLayoutConfig];
        [self green];
        //: id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
        id<OffConfig> layoutConfig = [[Indicator reach] layoutConfig];
        //: size = [layoutConfig contentSize:self cellWidth:width];
        size = [layoutConfig sendWidth:self showFloat:width];
        //: [self.contentSizeInfo setObject:[NSValue valueWithCGSize:size] forKey:@(width)];
        [self.contentSizeInfo setObject:[NSValue valueWithCGSize:size] forKey:@(width)];
    }
    //: return size;
    return size;
}


//: - (UIEdgeInsets)contentViewInsets{
- (UIEdgeInsets)contentViewInsets{
    //: if (UIEdgeInsetsEqualToEdgeInsets(_contentViewInsets, UIEdgeInsetsZero))
    if (UIEdgeInsetsEqualToEdgeInsets(_contentViewInsets, UIEdgeInsetsZero))
    {
        //: id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
        id<OffConfig> layoutConfig = [[Indicator reach] layoutConfig];
        //: _contentViewInsets = [layoutConfig contentViewInsets:self];
        _contentViewInsets = [layoutConfig handicapped:self];
    }
    //: return _contentViewInsets;
    return _contentViewInsets;
}

//: - (UIEdgeInsets)bubbleViewInsets{
- (UIEdgeInsets)bubbleViewInsets{
    //: if (UIEdgeInsetsEqualToEdgeInsets(_bubbleViewInsets, UIEdgeInsetsZero))
    if (UIEdgeInsetsEqualToEdgeInsets(_bubbleViewInsets, UIEdgeInsetsZero))
    {
        //: id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
        id<OffConfig> layoutConfig = [[Indicator reach] layoutConfig];
        //: _bubbleViewInsets = [layoutConfig cellInsets:self];
        _bubbleViewInsets = [layoutConfig top:self];
    }
    //: return _bubbleViewInsets;
    return _bubbleViewInsets;
}

//: - (CGSize)replyContentSize:(CGFloat)width
- (CGSize)standard:(CGFloat)width
{
    //: id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
    id<OffConfig> layoutConfig = [[Indicator reach] layoutConfig];
    //: CGSize size = [layoutConfig replyContentSize:self cellWidth:width];
    CGSize size = [layoutConfig with:self recordingOfWidth:width];
    //: return size;
    return size;
}

//: - (UIEdgeInsets)replyContentViewInsets{
- (UIEdgeInsets)replyContentViewInsets{
    //: if (UIEdgeInsetsEqualToEdgeInsets(_replyContentViewInsets, UIEdgeInsetsZero))
    if (UIEdgeInsetsEqualToEdgeInsets(_replyContentViewInsets, UIEdgeInsetsZero))
    {
        //: id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
        id<OffConfig> layoutConfig = [[Indicator reach] layoutConfig];
        //: _replyContentViewInsets = [layoutConfig replyContentViewInsets:self];
        _replyContentViewInsets = [layoutConfig pull:self];
    }
    //: return _replyContentViewInsets;
    return _replyContentViewInsets;
}

//: - (UIEdgeInsets)replyBubbleViewInsets{
- (UIEdgeInsets)replyBubbleViewInsets{
    //: if (UIEdgeInsetsEqualToEdgeInsets(_replyBubbleViewInsets, UIEdgeInsetsZero))
    if (UIEdgeInsetsEqualToEdgeInsets(_replyBubbleViewInsets, UIEdgeInsetsZero))
    {
        //: id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
        id<OffConfig> layoutConfig = [[Indicator reach] layoutConfig];
        //: _replyBubbleViewInsets = [layoutConfig replyCellInsets:self];
        _replyBubbleViewInsets = [layoutConfig weltanschauung:self];
    }
    //: return _replyBubbleViewInsets;
    return _replyBubbleViewInsets;
}


//: - (void)updateLayoutConfig
- (void)green
{
    //: id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
    id<OffConfig> layoutConfig = [[Indicator reach] layoutConfig];

    //: _shouldShowAvatar = [layoutConfig shouldShowAvatar:self];
    _shouldShowAvatar = [layoutConfig box:self];
    //: _shouldShowNickName = _focreShowNickName ? YES : [layoutConfig shouldShowNickName:self];
    _shouldShowNickName = _focreShowNickName ? YES : [layoutConfig nickToInput:self];
    //: _shouldShowLeft = _focreShowLeft ? YES : [layoutConfig shouldShowLeft:self];
    _shouldShowLeft = _focreShowLeft ? YES : [layoutConfig reason:self];
    //: _avatarMargin = [layoutConfig avatarMargin:self];
    _avatarMargin = [layoutConfig action:self];
    //: _nickNameMargin = [layoutConfig nickNameMargin:self];
    _nickNameMargin = [layoutConfig contentImage:self];
    //: _avatarSize = [layoutConfig avatarSize:self];
    _avatarSize = [layoutConfig show:self];
}


//: - (BOOL)shouldShowReadLabel
- (BOOL)shouldShowReadLabel
{
    //: if (self.message.session.sessionType == NIMSessionTypeP2P)
    if (self.message.session.sessionType == NIMSessionTypeP2P)
    {
        //: return _shouldShowReadLabel && self.message.isRemoteRead;
        return _shouldShowReadLabel && self.message.isRemoteRead;
    }
    //: else if (self.message.session.sessionType == NIMSessionTypeSuperTeam) { 
    else if (self.message.session.sessionType == NIMSessionTypeSuperTeam) { //超大群这个功能还没做
        //: return NO;
        return NO;
    }
    //: else
    else
    {
        //: return _shouldShowReadLabel;
        return _shouldShowReadLabel;
    }

}

//: - (BOOL)needShowReplyCountContent
- (BOOL)beginContent
{
    //: return self.enableSubMessages;
    return self.enableSubMessages;
}

//: - (BOOL)needShowRepliedContent
- (BOOL)frank
{
    //: BOOL should = self.message.messageType == NIMMessageTypeTip;
    BOOL should = self.message.messageType == NIMMessageTypeTip;
    //: return !should && self.enableRepliedContent &&
    return !should && self.enableRepliedContent &&
    //: self.message.repliedMessageId.length > 0;
    self.message.repliedMessageId.length > 0;
}

//: - (BOOL)needShowEmoticonsView
- (BOOL)viewNeedNetShow
{
    //: return self.enableQuickComments && !__CGSizeEqualToSize(CGSizeZero, self.emoticonsContainerSize);
    return self.enableQuickComments && !__CGSizeEqualToSize(CGSizeZero, self.emoticonsContainerSize);
}

//: - (void)quickComments:(NIMMessage *)message
- (void)comments:(NIMMessage *)message
           //: completion:(void(^)(NSMapTable *))completion
           title:(void(^)(NSMapTable *))completion
{
    //: [[NIMSDK sharedSDK].chatExtendManager quickCommentsByMessage:message
    [[NIMSDK sharedSDK].chatExtendManager quickCommentsByMessage:message
                                                      //: completion:^(NSError * _Nullable error, NSMapTable<NSNumber *,NIMQuickComment *> * _Nullable result)
                                                      completion:^(NSError * _Nullable error, NSMapTable<NSNumber *,NIMQuickComment *> * _Nullable result)
    {
        //: if (completion)
        if (completion)
        {
            //: if (result.count > 0)
            if (result.count > 0)
            {
                //: _emoticonsContainerSize = [AAAKitQuickCommentUtil containerSizeWithComments:result];
                _emoticonsContainerSize = [CaseOfMaxTeam childComments:result];
            }
            //: completion(result);
            completion(result);
        }
    //: }];
    }];
}

//: @end
@end