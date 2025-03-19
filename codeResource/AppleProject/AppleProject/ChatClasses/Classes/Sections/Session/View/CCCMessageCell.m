//
//  CCCMessageCell.m
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "CCCMessageCell.h"
#import "BBBMessageModel.h"
#import "BBBAvatarImageView.h"
#import "BBBBadgeView.h"
#import "CCCSessionMessageContentView.h"
#import "AAAKitUtil.h"
#import "CCCSessionAudioContentView.h"
#import "UIViewNimKit.h"
#import "CCCKitDependency.h"
#import "M80AttributedLabel.h"
#import "UIImage+AppleProjectKit.h"
#import "CCCSessionUnknowContentView.h"
#import "CCCKitConfig.h"
#import "AppleProjectKit.h"
#import "CCCSessionTextContentView.h"

@interface CCCMessageCell()<NIMPlayAudioUIDelegate,NIMMessageContentViewDelegate>
{
    UILongPressGestureRecognizer *_longPressGesture;
    UIMenuController             *_menuController;
}

@property (nonatomic,strong) BBBMessageModel *model;

@property (nonatomic,copy)   NSArray *customViews;

@end



@implementation CCCMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;        
        [self makeComponents];
        [self makeGesture];

    }
    return self;
}

- (void)dealloc
{
    [self removeGestureRecognizer:_longPressGesture];
}

- (void)makeComponents
{
    static UIImage *NIMRetryButtonImage;
    static UIImage *NIMSelectButtonNormalImage;
    static UIImage *NIMSelectButtonHighImage;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NIMRetryButtonImage = [UIImage imageNamed:@"icon_message_cell_error"];
        NIMSelectButtonNormalImage = [UIImage imageNamed:@"icon_accessory_normal"];
        NIMSelectButtonHighImage = [UIImage imageNamed:@"icon_accessory_selected"];
    });
    //retyrBtn
    _retryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_retryButton setImage:NIMRetryButtonImage forState:UIControlStateNormal];
    [_retryButton setImage:NIMRetryButtonImage forState:UIControlStateHighlighted];
    [_retryButton setFrame:CGRectMake(0, 0, 20, 20)];
    [_retryButton addTarget:self action:@selector(onRetryMessage:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_retryButton];
    
    //audioPlayedIcon
    _audioPlayedIcon = [BBBBadgeView viewWithBadgeTip:@""];
//    _audioPlayedIcon.badgeBackgroundColor = RGB_COLOR_String(@"#612CF9");
//    [self.contentView addSubview:_audioPlayedIcon];
    
    //traningActivityIndicator
    _traningActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0,0,20,20)];
    [self.contentView addSubview:_traningActivityIndicator];
    
    //headerView
    _headImageView = [[BBBAvatarImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [_headImageView addTarget:self action:@selector(onTapAvatar:) forControlEvents:UIControlEventTouchUpInside];
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPressAvatar:)];
    [_headImageView addGestureRecognizer:gesture];
    [self.contentView addSubview:_headImageView];
    
    //nicknamel
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.opaque = YES;
    _nameLabel.font   = [AppleProjectKit sharedKit].config.nickFont;
    _nameLabel.textColor = [AppleProjectKit sharedKit].config.nickColor;
    [_nameLabel setHidden:YES];
    [self.contentView addSubview:_nameLabel];
    
    //readlabel
    _readButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _readButton.opaque = YES;
    _readButton.titleLabel.font   = [AppleProjectKit sharedKit].config.receiptFont;
    [_readButton setTitleColor:[AppleProjectKit sharedKit].config.receiptColor forState:UIControlStateNormal];
    [_readButton setTitleColor:[AppleProjectKit sharedKit].config.receiptColor forState:UIControlStateHighlighted];
    [_readButton setHidden:YES];
    [_readButton addTarget:self action:@selector(onPressReadButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_readButton];
    
    //selectButton
    _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selectButton setImage:NIMSelectButtonNormalImage forState:UIControlStateNormal];
    [_selectButton setImage:NIMSelectButtonHighImage forState:UIControlStateSelected];
    [_selectButton sizeToFit];
    [self.contentView addSubview:_selectButton];
    _selectButton.hidden = YES;
    
    //bubblesBackgroundView
    _bubblesBackgroundView = [[UIImageView alloc] init];
    
    [self.contentView addSubview:_bubblesBackgroundView];
    
    //selectButtonMask
    _selectButtonMask = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selectButtonMask setBackgroundColor:[UIColor clearColor]];
    [_selectButtonMask addTarget:self action:@selector(onTapSelectedButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_selectButtonMask];
    _selectButtonMask.hidden = YES;
    
    
}

- (void)makeGesture{
    _longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longGesturePress:)];
    [self addGestureRecognizer:_longPressGesture];
}

- (void)refreshData:(BBBMessageModel *)data
{
    self.model = data;
    if ([self checkData])
    {
        [self.model updateLayoutConfig];
        [self refresh];
    }
}

- (BOOL)checkData{
    return [self.model isKindOfClass:[BBBMessageModel class]];
}

- (void)refresh
{
    self.contentView.hidden = NO;

    // 撤回的消息 发送自定义消息
    if (self.model.message.messageType == NIMMessageTypeCustom && self.model.message.messageSubType == 20) {
        self.contentView.hidden = YES;
    }
    // 撤回的消息 发送自定义消息
    if (self.model.message.messageType == NIMMessageTypeCustom) {
        self.contentView.hidden = YES;
    }
    
    NIMNotificationObject *object = self.model.message.messageObject;
    if (object && [object isKindOfClass:NIMNotificationObject.class] && object.notificationType == NIMNotificationTypeTeam)
    {
        self.contentView.hidden = YES;
    }

    if(!self.model.shouldShowLeft){
        self.model.shouldShowAvatar = NO;
    }else{
        self.model.shouldShowAvatar = YES;
    }
   
    
    [self refreshBubblesBackgroundView];
    [self addReplyedContentViewIfNotExist];
    [self addContentViewIfNotExist];
    [self addUserCustomViews];
    
//    self.backgroundColor = [AppleProjectKit sharedKit].config.cellBackgroundColor;
    self.backgroundColor = [UIColor clearColor];
    
    if ([self needShowSelectButton]) {
        _selectButton.selected = self.model.selected;
        _selectButtonMask.hidden = NO;
    }
    if ([self needShowAvatar])
    {
        [_headImageView setAvatarByMessage:self.model.message];
    }

    if([self needShowNickName])
    {
        NSString *nick = [AAAKitUtil showNick:self.model.message.from inMessage:self.model.message];
        [self.nameLabel setText:nick];
    }
    [_nameLabel setHidden:![self needShowNickName]];
    
    
    BOOL isActivityIndicatorHidden = [self activityIndicatorHidden];
    if (isActivityIndicatorHidden)
    {
        [_traningActivityIndicator stopAnimating];
    }
    else
    {
        [_traningActivityIndicator startAnimating];
    }
//    [_traningActivityIndicator setHidden:isActivityIndicatorHidden];
    [_traningActivityIndicator setHidden:YES];
    [_retryButton setHidden:[self retryButtonHidden]];
    [_audioPlayedIcon setHidden:[self unreadHidden]];
    
    [self refreshReadButton];
    
    if ([_bubbleView isKindOfClass:[CCCSessionTextContentView class]]) {
        [self disableLongPress:YES];
    } else {
        [self disableLongPress:NO];
    }
    
    [self setNeedsLayout];
}

- (void)refreshBubblesBackgroundView
{
    if (self.model.message.messageType == 1) {
//    if (self.model.message.messageSubType == 77) {
        _bubblesBackgroundView.hidden = YES;
    }else{
        _bubblesBackgroundView.hidden = ![[AppleProjectKit sharedKit].layoutConfig shouldDisplayBubbleBackground:self.model];;
        [_bubblesBackgroundView setImage:[self chatBubbleImageForState:UIControlStateNormal]];
        [_bubblesBackgroundView setHighlightedImage:[self chatBubbleImageForState:UIControlStateHighlighted]];
    }
}


-(void)refreshReadButton{
    BOOL isreade = self.model.message.isRemoteRead;
    BOOL showMessageRead = [[NIMUserDefaults standardUserDefaults].showMessageRead boolValue];
    if (self.model.message.isOutgoingMsg && showMessageRead) {
//        if (self.model.message.isOutgoingMsg) {
        [_readButton setHidden:NO];
        [_readButton setImage:[UIImage imageNamed:@"message_read_yes"] forState:UIControlStateNormal];

        if (self.model.message.session.sessionType == NIMSessionTypeP2P)
        {
            if (isreade == NO) {
                [_readButton setImage:[UIImage imageNamed:@"message_read_no"] forState:UIControlStateNormal];//@"已读".nim_localized
            }
            [_readButton sizeToFit];
        }
        else if(self.model.message.session.sessionType == NIMSessionTypeTeam)
        {
            [_readButton setTitle:[NSString stringWithFormat:@"%zd%@",self.model.message.teamReceiptInfo.unreadCount,LangKey(@"msg_view_4")] forState:UIControlStateNormal];//人未读".nim_localized
            [_readButton sizeToFit];
            [_readButton layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyleLeft) imageTitleSpace:3];
            [_readButton setHidden:YES];
        }
    }else{
        [_readButton setHidden:YES];
    }
}

- (void)refreshReadButton_2
{
    BOOL hidden = [self readLabelHidden];
    [_readButton setHidden:hidden];
    if (!hidden)
    {
        if (self.model.message.session.sessionType == NIMSessionTypeP2P)
        {
            [_readButton setTitle:@"已读" forState:UIControlStateNormal];//@"已读".nim_localized
            [_readButton sizeToFit];
        }
        else if(self.model.message.session.sessionType == NIMSessionTypeTeam)
        {
            [_readButton setTitle:[NSString stringWithFormat:@"%zd人未读".nim_localized,self.model.message.teamReceiptInfo.unreadCount] forState:UIControlStateNormal];
            [_readButton sizeToFit];
        }
    }
}

- (void)addReplyedContentViewIfNotExist
{
    if ([self.model needShowRepliedContent])
    {
        if (!_replyedBubbleView)
        {
            id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
            NSString *contentStr = [layoutConfig replyContent:self.model];
            NSAssert([contentStr length] > 0, @"should offer cell content class name");
            Class clazz = NSClassFromString(contentStr);
            CCCSessionMessageContentView *contentView =  [[clazz alloc] initSessionMessageContentView];
            NSAssert(contentView, @"can not init content view");
            _replyedBubbleView = contentView;
            _replyedBubbleView.delegate = self;
            [self.contentView insertSubview:_replyedBubbleView belowSubview:_selectButtonMask];
        }
        [_replyedBubbleView refresh:self.model];
        [_replyedBubbleView setNeedsLayout];
    }
    else if (_replyedBubbleView)
    {
        [_replyedBubbleView removeFromSuperview];
        _replyedBubbleView = nil;
    }
}

- (void)addContentViewIfNotExist
{
    if (_bubbleView == nil)
    {
        id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
        NSString *contentStr = [layoutConfig cellContent:self.model];
        NSAssert([contentStr length] > 0, @"should offer cell content class name");
        Class clazz = NSClassFromString(contentStr);
        CCCSessionMessageContentView *contentView =  [[clazz alloc] initSessionMessageContentView];
        NSAssert(contentView, @"can not init content view");
        _bubbleView = contentView;
        _bubbleView.delegate = self;
        NIMMessageType messageType = self.model.message.messageType;
        if (messageType == NIMMessageTypeAudio) {
            ((CCCSessionAudioContentView *)_bubbleView).audioUIDelegate = self;
        }
        [self.contentView insertSubview:_bubbleView belowSubview:_selectButtonMask];
    }
    
    [_bubbleView refresh:self.model];
    [_bubbleView setNeedsLayout];
}

- (void)addUserCustomViews
{
    for (UIView *view in self.customViews) {
        [view removeFromSuperview];
    }
    id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
    self.customViews = [layoutConfig customViews:self.model];

    for (UIView *view in self.customViews) {
        [self.contentView addSubview:view];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self layoutSelectButton];
    [self layoutAvatar];
    [self layoutNameLabel];
    [self layoutReplyBubbleView];
    [self layoutBubbleView];
    [self fixReplyBubbleAndBubbleLeft];
    [self layoutBubblesBackgroundView];
    [self layoutRetryButton];
    [self layoutAudioPlayedIcon];
    [self layoutActivityIndicator];
    [self layoutReadButton];
}

- (void)layoutSelectButton {
    BOOL needShow = [self needShowSelectButton];
    if (needShow) {
        _selectButton.hidden = self.model.disableSelected;
        _selectButtonMask.hidden = NO;
        _selectButtonMask.userInteractionEnabled = !self.model.disableSelected;
        _selectButton.frame = [self selectButtonRect];
        _selectButtonMask.frame = self.contentView.bounds;
    } else {
        _selectButton.hidden = YES;
        _selectButtonMask.hidden = YES;
    }
}

- (void)layoutAvatar
{
    BOOL needShow = [self needShowAvatar];
    _headImageView.hidden = !needShow;
    if (needShow) {
        _headImageView.frame = [self avatarViewRect];
    }
}

- (void)layoutNameLabel
{
    if ([self needShowNickName]) {
        CGFloat otherBubbleOriginX  = ![self needShowSelectButton] ? self.cellPaddingToNick.x : _selectButton.nim_right + self.cellPaddingToNick.x;
        CGFloat otherBubbleOriginy  = self.cellPaddingToNick.y;
        CGFloat otherNickNameWidth  = 200.f;
        CGFloat otherNickNameHeight = 20.f;
        CGFloat cellPaddingToProtrait = self.cellPaddingToAvatar.x;
        CGFloat avatarWidth = self.headImageView.nim_width;
        CGFloat myBubbleOriginX = self.nim_width - cellPaddingToProtrait - avatarWidth - self.cellPaddingToNick.x;
        _nameLabel.frame = self.model.shouldShowLeft ? CGRectMake(otherBubbleOriginX,otherBubbleOriginy,
                                                                  otherNickNameWidth, otherNickNameHeight) :        CGRectMake(myBubbleOriginX,otherBubbleOriginy,                   otherNickNameWidth,otherNickNameHeight) ;
    }
}

- (void)layoutReplyBubbleView
{
    if (!_replyedBubbleView)
    {
        return;
    }
    
    CGSize size  = [self.model replyContentSize:self.nim_width];
    UIEdgeInsets insets = self.model.replyContentViewInsets;
    size.width  = size.width + insets.left * 2 + insets.right;
    size.height = size.height + insets.top + insets.bottom;
    _replyedBubbleView.nim_size = size;
    
    UIEdgeInsets contentInsets = self.model.replyBubbleViewInsets;
    CGFloat left = 0;
    CGFloat protraitRightToBubble = 5.f;
    if (!self.model.shouldShowLeft)
    {
        CGFloat right = self.model.shouldShowAvatar? CGRectGetMinX(self.headImageView.frame)  - protraitRightToBubble : self.nim_width;
        left = right - CGRectGetWidth(self.replyedBubbleView.bounds);
    } else {
        if (![self needShowSelectButton]) {
            left = contentInsets.left;
        } else {
            left = contentInsets.left + _selectButton.nim_right + protraitRightToBubble;
        }
    }
    
    _replyedBubbleView.nim_left = left;
    _replyedBubbleView.nim_top  = contentInsets.top;
}

- (void)layoutBubbleView
{
    CGSize size  = [self.model contentSize:self.nim_width];
    UIEdgeInsets insets = self.model.contentViewInsets;
    size.width  = size.width + insets.left + insets.right;
    size.height = size.height + insets.top + insets.bottom;
    _bubbleView.nim_size = size;
    
    UIEdgeInsets contentInsets = self.model.bubbleViewInsets;
    CGFloat left = 0;
    CGFloat protraitRightToBubble = 5.f;
    if (!self.model.shouldShowLeft)
    {
        CGFloat right = self.model.shouldShowAvatar? CGRectGetMinX(self.headImageView.frame)  - protraitRightToBubble : self.nim_width;
        left = right - CGRectGetWidth(self.bubbleView.bounds);
    } else {
        if (![self needShowSelectButton]) {
            left = contentInsets.left;
        } else {
            left = contentInsets.left + _selectButton.nim_right + protraitRightToBubble;
        }
    }
    
    _bubbleView.nim_left = left;
    if (_replyedBubbleView)
    {
        _bubbleView.nim_top  = self.replyedBubbleView.nim_bottom;
    }
    else
    {
        _bubbleView.nim_top  = contentInsets.top;
    }

}

- (void)fixReplyBubbleAndBubbleLeft
{
    if (!self.replyedBubbleView)
    {
        return;
    }
    
    CGFloat left = 0;
    if (!self.model.shouldShowLeft)
    {
        
        left = self.replyedBubbleView.nim_left < self.bubbleView.nim_left ? self.replyedBubbleView.nim_left : self.bubbleView.nim_left;
    }
    else
    {
        left = self.replyedBubbleView.nim_left > self.bubbleView.nim_left ? self.replyedBubbleView.nim_left : self.bubbleView.nim_left;
    }
    
    self.replyedBubbleView.nim_left = left;
    self.bubbleView.nim_left = left;
}

- (void)layoutBubblesBackgroundView
{
    CGFloat height = self.replyedBubbleView.nim_height + self.bubbleView.nim_height;
    CGFloat width = self.replyedBubbleView.nim_width > self.bubbleView.nim_width ? self.replyedBubbleView.nim_width : self.bubbleView.nim_width;
    self.bubblesBackgroundView.nim_size = CGSizeMake(width, height);
    self.bubblesBackgroundView.nim_left = self.bubbleView.nim_left;
    
    if (self.replyedBubbleView)
    {
        self.bubblesBackgroundView.nim_top = self.replyedBubbleView.nim_top;
    }
    else
    {
        self.bubblesBackgroundView.nim_top = self.bubbleView.nim_top;
    }
}


- (void)layoutActivityIndicator
{
    if (_traningActivityIndicator.isAnimating) {
        CGFloat centerX = 0;
        if (!self.model.shouldShowLeft)
        {
            centerX = CGRectGetMinX(_bubblesBackgroundView.frame) - [self retryButtonBubblePadding] - CGRectGetWidth(_traningActivityIndicator.bounds)/2;;
        }
        else
        {
            centerX = CGRectGetMaxX(_bubblesBackgroundView.frame) + [self retryButtonBubblePadding] +  CGRectGetWidth(_traningActivityIndicator.bounds)/2;
        }
        self.traningActivityIndicator.center = CGPointMake(centerX,
                                                           _bubblesBackgroundView.center.y);
    }
}

- (void)layoutRetryButton
{
    if (!_retryButton.isHidden) {
        CGFloat centerX = 0;
        if (self.model.shouldShowLeft)
        {
            centerX = CGRectGetMaxX(_bubblesBackgroundView.frame) + [self retryButtonBubblePadding] +CGRectGetWidth(_retryButton.bounds)/2;
        }
        else
        {
            centerX = CGRectGetMinX(_bubblesBackgroundView.frame) - [self retryButtonBubblePadding] - CGRectGetWidth(_retryButton.bounds)/2;
        }
        
        _retryButton.center = CGPointMake(centerX, _bubblesBackgroundView.center.y);
    }
}

- (void)layoutAudioPlayedIcon{
    if (!_audioPlayedIcon.hidden) {
        CGFloat padding = [self audioPlayedIconBubblePadding];
        if (self.model.shouldShowLeft)
        {
            _audioPlayedIcon.nim_left = _bubblesBackgroundView.nim_right + padding;
        }
        else
        {
            _audioPlayedIcon.nim_right = _bubblesBackgroundView.nim_left - padding;
        }
//        _audioPlayedIcon.nim_top = _bubblesBackgroundView.nim_top;
        _audioPlayedIcon.nim_centerY = _bubblesBackgroundView.nim_centerY;
    }
}

- (void)layoutReadButton{
    
    if (!_readButton.isHidden) {
        
        CGFloat left = _bubblesBackgroundView.nim_left;
        CGFloat bottom = _bubblesBackgroundView.nim_bottom;
        
        _readButton.nim_left = left - CGRectGetWidth(_readButton.bounds) - [self readButtonBubblePadding];
//        _readButton.nim_bottom = bottom;
        _readButton.nim_centerY = _bubblesBackgroundView.nim_centerY;

    }
}

#pragma mark - NIMMessageContentViewDelegate
- (void)onCatchEvent:(BBBKitEvent *)event{
    if ([self.delegate respondsToSelector:@selector(onTapCell:)]) {
        [self.delegate onTapCell:event];
    }
}

- (void)disableLongPress:(BOOL)disable {
    _longPressGesture.enabled = !disable;
}

- (BOOL)onLongTap:(NIMMessage *)message complete:(void(^)(id data))complete; {
    if ([self.delegate respondsToSelector:@selector(onLongPressCell:complete:)]) {
        return  [self.delegate onLongPressCell:message complete:complete];
    }
    return NO;
}

- (BOOL)onLongTap:(NIMMessage *)message; {
    if ([self.delegate respondsToSelector:@selector(onLongPressCell:)]) {
        return [self.delegate onLongPressCell:message];
    }
    return NO;
}



#pragma mark - Action
- (void)onRetryMessage:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(onRetryMessage:)]) {
        [self.delegate onRetryMessage:self.model.message];
    }
}

- (void)longGesturePress:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]] &&
        gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(onLongPressCell:inView:)]) {
            [self.delegate onLongPressCell:self.model.message
                                       inView:_bubbleView];
        }
    }
}

#pragma mark - NIMPlayAudioUIDelegate
- (void)startPlayingAudioUI
{
    [self refreshData:self.model];
}

- (void)retryDownloadMsg
{
    [self onRetryMessage:nil];
}

#pragma mark - Private

- (UIImage *)chatBubbleImageForState:(UIControlState)state
{
    
    CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:self.model.message];
    if (state == UIControlStateNormal)
    {
        return setting.normalBackgroundImage;
    }
    else
    {
        return setting.highLightBackgroundImage;
    }
}

- (CGRect)selectButtonRect {
    CGSize size = _selectButton.nim_size;
    CGRect avatarRect = [self avatarViewRect];
    CGFloat y = (avatarRect.size.height - size.height)/2 + avatarRect.origin.y;
    CGFloat x = [self selectButtonPadding];
    return CGRectMake(x, y, size.width, size.height);
}

- (CGRect)avatarViewRect
{
    CGFloat cellWidth = self.bounds.size.width;
    CGFloat protraitImageWidth = [self avatarSize].width;
    CGFloat protraitImageHeight = [self avatarSize].height;
    CGFloat selfProtraitOriginX = 0;
    
    if (self.model.shouldShowLeft) {
        if (![self needShowSelectButton]) {
            selfProtraitOriginX = self.cellPaddingToAvatar.x;
        } else {
            selfProtraitOriginX = self.cellPaddingToAvatar.x + _selectButton.nim_right;
        }
    } else {
        selfProtraitOriginX = cellWidth - self.cellPaddingToAvatar.x - protraitImageWidth;
    }
    return CGRectMake(selfProtraitOriginX, self.cellPaddingToAvatar.y,protraitImageWidth,protraitImageHeight);
}

- (BOOL)needShowSelectButton {
    return self.model.shouldShowSelect;
}

- (BOOL)needShowAvatar
{
    return self.model.shouldShowAvatar;
}

- (BOOL)needShowNickName
{
    return self.model.shouldShowNickName;
}


- (BOOL)retryButtonHidden
{
    id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
    BOOL disable = NO;
    if ([layoutConfig respondsToSelector:@selector(disableRetryButton:)])
    {
        disable = [layoutConfig disableRetryButton:self.model];
    }
    return disable;    
}

- (CGFloat)retryButtonBubblePadding {
    BOOL isFromMe = !self.model.shouldShowLeft;
    if (self.model.message.messageType == NIMMessageTypeAudio) {
        return isFromMe ? 15 : 13;
    }
    return isFromMe ? 8 : 10;
}

- (BOOL)activityIndicatorHidden
{
    if (!self.model.message.isReceivedMsg)
    {
        return self.model.message.deliveryState != NIMMessageDeliveryStateDelivering;
    }
    else
    {
        return self.model.message.attachmentDownloadState != NIMMessageAttachmentDownloadStateDownloading;
    }
}


- (BOOL)unreadHidden {
    if (self.model.message.messageType == NIMMessageTypeAudio) 
    { //音频
        BOOL disable = NO;
        if ([self.delegate respondsToSelector:@selector(disableAudioPlayedStatusIcon:)]) {
            disable = [self.delegate disableAudioPlayedStatusIcon:self.model.message];
        }
        
        //BOOL hideIcon = self.model.message.attachmentDownloadState != NIMMessageAttachmentDownloadStateDownloaded || disable;

        return (disable || self.model.message.isOutgoingMsg || [self.model.message isPlayed]);
    }
    return YES;
}

- (BOOL)readLabelHidden
{
    if (self.model.shouldShowReadLabel &&
        [self activityIndicatorHidden] &&
        [self retryButtonHidden] &&
        [self unreadHidden] &&
        [[NIMUserDefaults standardUserDefaults].showMessageRead boolValue])
    {
        return NO;
    }
    return YES;
}


- (CGFloat)audioPlayedIconBubblePadding{
    return 10.0;
}

- (CGFloat)readButtonBubblePadding{
    return 2.0;
}

- (CGFloat)selectButtonPadding{
    return 8.0;
}

- (CGPoint)cellPaddingToAvatar
{
    return self.model.avatarMargin;
}

- (CGPoint)cellPaddingToNick
{
    return self.model.nickNameMargin;
}

- (CGSize)avatarSize {
    return self.model.avatarSize;
}

- (void)onTapAvatar:(id)sender{
    if ([self.delegate respondsToSelector:@selector(onTapAvatar:)])
    {
        [self.delegate onTapAvatar:self.model.message];
    }
}

- (void)onLongPressAvatar:(UIGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]] &&
        gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        if ([self.delegate respondsToSelector:@selector(onLongPressAvatar:)])
        {
            [self.delegate onLongPressAvatar:self.model.message];
        }
    }
}

- (void)onPressReadButton:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(onPressReadLabel:)])
    {
        [self.delegate onPressReadLabel:self.model.message];
    }
}

- (void)onTapSelectedButton:(id)sender
{
    _selectButton.selected = !_selectButton.selected;
    self.model.selected = _selectButton.selected;
    if ([self.delegate respondsToSelector:@selector(onSelectedMessage:message:)]) {
        [self.delegate onSelectedMessage:self.model.selected message:self.model.message];
    }
}


@end
