// __DEBUG__
// __CLOSE_PRINT__
//
//  AggregationImageTitle.m
//  NIMDemo
//
//  Created by chris on 2017/6/27.
//  Copyright © 2017年 NetEase. All rights reserved.
//
//: #import "NTESSessionRobotContentView.h"
#import "AggregationImageTitle.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "NIMKitRobotDefaultTemplateParser.h"
#import "NIMKitRobotDefaultTemplateParser.h"
//: #import "NIMKit.h"
#import "NIMKit.h"
//: #import "M80AttributedLabel+NIMKit.h"
#import "M80AttributedLabel+NIMKit.h"
//: #import "UIImageView+WebCache.h"
#import "UIImageView+WebCache.h"
//: #import "NIMGlobalMacro.h"
#import "NIMGlobalMacro.h"

// __M_A_C_R_O__

//: @interface NTESSessionRobotButton : UIButton
@interface ClinicChildFasteningControl : UIButton

//: @property (nonatomic,copy) NSString *target;
@property (nonatomic,copy) NSString *target;

//: @property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *url;

//: @property (nonatomic,copy) NSString *param;
@property (nonatomic,copy) NSString *param;

//: @property (nonatomic,assign) NIMKitRobotTemplateItemType type;
@property (nonatomic,assign) NIMKitRobotTemplateItemType type;


//: @end
@end

//: @interface NTESSessionRobotContentView()
@interface AggregationImageTitle()

//: @property (nonatomic,strong) NSMutableSet *buttons;
@property (nonatomic,strong) NSMutableSet *buttons;

//: @property (nonatomic,strong) NSMutableSet *labels;
@property (nonatomic,strong) NSMutableSet *labels;

//: @property (nonatomic,strong) NSMutableSet *imageViews;
@property (nonatomic,strong) NSMutableSet *imageViews;

//: @property (nonatomic,strong) UIButton *continueButton;
@property (nonatomic,strong) UIButton *continueButton;

//: @property (nonatomic,strong) NIMKitRobotDefaultTemplateParser *parser;
@property (nonatomic,strong) NIMKitRobotDefaultTemplateParser *parser;

//: @end
@end

//: @implementation NTESSessionRobotContentView
@implementation AggregationImageTitle

//: - (instancetype)initSessionMessageContentView
- (instancetype)initPacketBound
{
    //: self = [super initSessionMessageContentView];
    self = [super initSessionMessageContentView];
    //: if (self)
    if (self)
    {
        //: _buttons = [[NSMutableSet alloc] init];
        _buttons = [[NSMutableSet alloc] init];
        //: _labels = [[NSMutableSet alloc] init];
        _labels = [[NSMutableSet alloc] init];
        //: _imageViews = [[NSMutableSet alloc] init];
        _imageViews = [[NSMutableSet alloc] init];
        //: _parser = [[NIMKitRobotDefaultTemplateParser alloc] init];
        _parser = [[NIMKitRobotDefaultTemplateParser alloc] init];

        //: _continueButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _continueButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_continueButton setTitle:@"继续对话" forState:UIControlStateNormal];
        [_continueButton setTitle:@"继续对话" forState:UIControlStateNormal];
        //: [_continueButton setTitleColor:NIMKit_UIColorFromRGB(0x168cf6) forState:UIControlStateNormal];
        [_continueButton setTitleColor:NIMKit_UIColorFromRGB(0x168cf6) forState:UIControlStateNormal];
        //: [_continueButton addTarget:self action:@selector(onContinue:) forControlEvents:UIControlEventTouchUpInside];
        [_continueButton addTarget:self action:@selector(onContinue:) forControlEvents:UIControlEventTouchUpInside];
    }
    //: return self;
    return self;
}


//: - (void)refresh:(NIMMessageModel *)data
- (void)day:(NIMMessageModel *)data
{
    //: [super refresh:data];
    [super refresh:data];
    //: [self setupRobot:data];
    [self replacement:data];
}


//: - (UIImage *)chatBubbleImageForState:(UIControlState)state outgoing:(BOOL)outgoing
- (UIImage *)title:(UIControlState)state outpost:(BOOL)outgoing
{
    //: return nil;
    return nil;
}


//: - (void)onContinue:(UIButton *)button
- (void)team:(UIButton *)button
{
    //: NIMKitEvent *event = [[NIMKitEvent alloc] init];
    NIMKitEvent *event = [[NIMKitEvent alloc] init];
    //: event.eventName = NIMKitEventNameTapRobotContinueSession;
    event.eventName = NIMKitEventNameTapRobotContinueSession;
    //: event.messageModel = self.model;
    event.messageModel = self.model;
    //: [self.delegate onCatchEvent:event];
    [self.delegate onCatchEvent:event];
}

//: - (void)refreshContineButton:(NIMMessageModel *)data
- (void)image:(NIMMessageModel *)data
{
    //: if (!self.continueButton.superview)
    if (!self.continueButton.superview)
    {
        //: [self addSubview:self.continueButton];
        [self addSubview:self.continueButton];
    }
    //: NIMKitSetting *setting = [[NIMKit sharedKit].config setting:data.message];
    NIMKitSetting *setting = [[NIMKit sharedKit].config setting:data.message];
    //: self.continueButton.titleLabel.font = setting.font;
    self.continueButton.titleLabel.font = setting.font;
    //: [self.continueButton sizeToFit];
    [self.continueButton sizeToFit];
}


//: - (void)setupRobot:(NIMMessageModel *)data
- (void)replacement:(NIMMessageModel *)data
{
    //上行消息交给 TextContentView 处理了
    //一定是机器人下行消息
    //: [self recycleAllSubViews:self];
    [self show:self];
    //: NIMKitRobotTemplate *template = [[NIMKit sharedKit].robotTemplateParser robotTemplate:data.message];
    NIMKitRobotTemplate *template = [[NIMKit sharedKit].robotTemplateParser robotTemplate:data.message];
    //: if (![template.version isEqualToString:@"0.1"])
    if (![template.version isEqualToString:@"0.1"])
    {
        //: NSLog(@"robot template version incompatible!");
    }
    //: for (NIMKitRobotTemplateLayout *layout in template.items)
    for (NIMKitRobotTemplateLayout *layout in template.items)
    {
        //: for (NIMKitRobotTemplateItem *item in layout.items)
        for (NIMKitRobotTemplateItem *item in layout.items)
        {
            //: [self applyItem:item inView:self];
            [self applyItem:item inView:self];
        }
    }

    //: [self refreshContineButton:data];
    [self image:data];
}


//: - (void)applyItem:(NIMKitRobotTemplateItem *)item
- (void)text:(NIMKitRobotTemplateItem *)item
           //: inView:(UIView *)view
           date:(UIView *)view
{
    //: switch (item.itemType) {
    switch (item.itemType) {
        //: case NIMKitRobotTemplateItemTypeText:
        case NIMKitRobotTemplateItemTypeText:
        {
            //: M80AttributedLabel *label = [self genLabel];
            MessageEnableTextView *label = [self genLabel];
            //: label.text = item.content;
            label.text = item.content;
            //: if ([view isKindOfClass:[UIButton class]])
            if ([view isKindOfClass:[UIButton class]])
            {
                // button 里头的 title 全部居中
                //: label.textAlignment = kCTTextAlignmentCenter;
                label.textAlignment = kCTTextAlignmentCenter;
                //: label.textColor = UIColorFromRGB(0x333333);
                label.textColor = UIColorFromRGB(0x333333);
                //: label.font = [UIFont systemFontOfSize:Message_Font_Size];
                label.font = [UIFont systemFontOfSize:Message_Font_Size];
            }
            //: [view addSubview:label];
            [view addSubview:label];
        }
            //: break;
            break;
        //: case NIMKitRobotTemplateItemTypeImage:
        case NIMKitRobotTemplateItemTypeImage:
        {
            //: UIImageView *imageView = [self genImageView];
            UIImageView *imageView = [self genImageView];
            //: imageView.size = CGSizeMake(item.width.floatValue, item.height.floatValue);
            imageView.size = CGSizeMake(item.width.floatValue, item.height.floatValue);
            //: imageView.image = nil;
            imageView.image = nil;
            //: if (item.url.length)
            if (item.url.length)
            {
                //: [imageView sd_setImageWithURL:[NSURL URLWithString:[[NIMSDK sharedSDK].resourceManager normalizeURLString:item.thumbUrl]] placeholderImage:nil options:SDWebImageRetryFailed];
                [imageView sd_setImageWithURL:[NSURL URLWithString:[[NIMSDK sharedSDK].resourceManager normalizeURLString:item.thumbUrl]] placeholderImage:nil options:SDWebImageRetryFailed];
            }
            //: [view addSubview:imageView];
            [view addSubview:imageView];
        }
            //: break;
            break;
        //: case NIMKitRobotTemplateItemTypeLinkURL:
        case NIMKitRobotTemplateItemTypeLinkURL:
        //: case NIMKitRobotTemplateItemTypeLinkBlock:
        case NIMKitRobotTemplateItemTypeLinkBlock:
        {
            //: NTESSessionRobotButton *button = [self genButton];
            ClinicChildFasteningControl *button = [self valueButton];
            //: NIMKitRobotTemplateLinkItem *link = (NIMKitRobotTemplateLinkItem *)item;
            NIMKitRobotTemplateLinkItem *link = (NIMKitRobotTemplateLinkItem *)item;
            //: button.target = link.target;
            button.target = link.target;
            //: button.param = link.params;
            button.param = link.params;
            //: button.url = link.url;
            button.url = link.url;
            //: button.type = link.itemType;
            button.type = link.itemType;

            //: for (NIMKitRobotTemplateItem *linkItem in link.items)
            for (NIMKitRobotTemplateItem *linkItem in link.items)
            {
                //: [self applyItem:linkItem inView:button];
                [self applyItem:linkItem inView:button];
            }
            //: [view addSubview:button];
            [view addSubview:button];
        }
            //: break;
            break;

        //: default:
        default:
            //: break;
            break;
    }
}


//: - (CGSize)sizeThatFits:(CGSize)size
- (CGSize)inputDomain:(CGSize)size
{
    //: CGFloat height = [NTESSessionRobotContentView itemSpacing];
    CGFloat height = [AggregationImageTitle itemSpacing];
    //: CGFloat width = 0;;
    CGFloat width = 0;;
    //: for (UIView *view in self.subviews) {
    for (UIView *view in self.subviews) {
        //: if (view == self.bubbleImageView)
        if (view == self.bubbleImageView)
        {
            //: continue;
            continue;
        }
        //: width = ((width) > (view.width) ? (width) : (view.width));
        width = ((width) > (view.width) ? (width) : (view.width));
        //: height += view.height;
        height += view.height;
        //: if (view == self.continueButton)
        if (view == self.continueButton)
        {
            //: height += [NTESSessionRobotContentView continueItemSpacing];
            height += [AggregationImageTitle continueItemSpacing];
        }
        //: else
        else
        {
            //: height += [NTESSessionRobotContentView itemSpacing];
            height += [AggregationImageTitle itemSpacing];
        }
    }
    //: UIEdgeInsets contentInsets = self.model.contentViewInsets;
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    //: height += (contentInsets.top + contentInsets.bottom);
    height += (contentInsets.top + contentInsets.bottom);
    //: return CGSizeMake(width, height);
    return CGSizeMake(width, height);
}

//: - (void)onTouchButton:(NTESSessionRobotButton *)button
- (void)schemes:(ClinicChildFasteningControl *)button
{
    //: NIMKitEvent *event = [[NIMKitEvent alloc] init];
    NIMKitEvent *event = [[NIMKitEvent alloc] init];
    //: if (button.type == NIMKitRobotTemplateItemTypeLinkURL)
    if (button.type == NIMKitRobotTemplateItemTypeLinkURL)
    {
        //: event.eventName = NIMKitEventNameTapRobotLink;
        event.eventName = NIMKitEventNameTapRobotLink;
        //: event.data = button.target;
        event.data = button.target;
    }
    //: else
    else
    {
        //: event.eventName = NIMKitEventNameTapRobotBlock;
        event.eventName = NIMKitEventNameTapRobotBlock;
        //: NSMutableDictionary *data = [@{@"target":button.target} mutableCopy];
        NSMutableDictionary *data = [@{@"target":button.target} mutableCopy];
        //: NIMRobotObject *object = (NIMRobotObject *)self.model.message.messageObject;
        NIMRobotObject *object = (NIMRobotObject *)self.model.message.messageObject;
        //: [data setObject:object.robotId forKey:@"robotId"];
        [data setObject:object.robotId forKey:@"robotId"];
        //: if (button.param)
        if (button.param)
        {
            //: [data setObject:button.param forKey:@"param"];
            [data setObject:button.param forKey:@"param"];
        }
        //: NSString *text = @"";
        NSString *text = @"";
        //: for (M80AttributedLabel *label in button.subviews)
        for (MessageEnableTextView *label in button.subviews)
        {
            //: if ([label isKindOfClass:[M80AttributedLabel class]])
            if ([label isKindOfClass:[MessageEnableTextView class]])
            {
                //: text = [text stringByAppendingFormat:@"%@ ",label.text];
                text = [text stringByAppendingFormat:@"%@ ",label.text];
            }
        }
        //: [data setObject:text forKey:@"text"];
        [data setObject:text forKey:@"text"];
        //: event.data = data;
        event.data = data;
    }
    //: [self.delegate onCatchEvent:event];
    [self.delegate onCatchEvent:event];
}


//: - (void)layoutSubviews
- (void)monthInfo
{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: [self resizeAllSubView:self insets:self.model.contentViewInsets];
    [self resizeNeedMax:self model:self.model.contentViewInsets];

    //: UIEdgeInsets contentInsets = self.model.contentViewInsets;
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    //: CGFloat top = [NTESSessionRobotContentView itemSpacing] + contentInsets.top;
    CGFloat top = [AggregationImageTitle itemSpacing] + contentInsets.top;
    //: for (UIView *view in self.subviews)
    for (UIView *view in self.subviews)
    {
        //: if (view == self.bubbleImageView)
        if (view == self.bubbleImageView)
        {
            //: continue;
            continue;
        }
        //: if (view == self.continueButton)
        if (view == self.continueButton)
        {
            //: CGFloat rightMargin = 16.f;
            CGFloat rightMargin = 16.f;
            //: self.continueButton.right = self.width - rightMargin;
            self.continueButton.right = self.width - rightMargin;
            //: self.continueButton.bottom = self.height;
            self.continueButton.bottom = self.height;
            //: continue;
            continue;
        }
        //: view.left = self.model.contentViewInsets.left;
        view.left = self.model.contentViewInsets.left;
        //: view.top = top;
        view.top = top;
        //: top = view.bottom + [NTESSessionRobotContentView itemSpacing];
        top = view.bottom + [AggregationImageTitle itemSpacing];
    }
}


//: - (void)resizeAllSubView:(UIView *)superView insets:(UIEdgeInsets)insets
- (void)resizeNeedMax:(UIView *)superView model:(UIEdgeInsets)insets
{
    //: CGFloat width = superView.width - insets.left - insets.right;
    CGFloat width = superView.width - insets.left - insets.right;

    //: for (UIView *subView in superView.subviews)
    for (UIView *subView in superView.subviews)
    {
        //: if (subView.height == 0)
        if (subView.height == 0)
        {
            //: if ([subView isKindOfClass:[M80AttributedLabel class]])
            if ([subView isKindOfClass:[MessageEnableTextView class]])
            {
                //: M80AttributedLabel *label = (M80AttributedLabel *)subView;
                MessageEnableTextView *label = (MessageEnableTextView *)subView;
                //: CGSize size = [label sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)];
                CGSize size = [label sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)];
                //: label.size = CGSizeMake(size.width, size.height);
                label.size = CGSizeMake(size.width, size.height);

                //: [self resizeAllSubView:label insets:UIEdgeInsetsZero];
                [self resizeAllSubView:label insets:UIEdgeInsetsZero];
            }
            //: else if ([subView isKindOfClass:[UIImageView class]])
            else if ([subView isKindOfClass:[UIImageView class]])
            {
                //: UIImageView *imageView = (UIImageView *)subView;
                UIImageView *imageView = (UIImageView *)subView;
                //: CGFloat defaultImageWidth = 75.f;
                CGFloat defaultImageWidth = 75.f;
                //: CGFloat defaultImageHeight = 75.f;
                CGFloat defaultImageHeight = 75.f;
                //: imageView.size = CGSizeMake(defaultImageWidth, defaultImageHeight);
                imageView.size = CGSizeMake(defaultImageWidth, defaultImageHeight);

                //: [self resizeAllSubView:imageView insets:UIEdgeInsetsZero];
                [self resizeAllSubView:imageView insets:UIEdgeInsetsZero];
            }
            //: else if ([subView isKindOfClass:[NTESSessionRobotButton class]])
            else if ([subView isKindOfClass:[ClinicChildFasteningControl class]])
            {
                //: NTESSessionRobotButton *button = (NTESSessionRobotButton *)subView;
                ClinicChildFasteningControl *button = (ClinicChildFasteningControl *)subView;
                //: button.width = width;
                button.width = width;

                //: [self resizeAllSubView:button insets:UIEdgeInsetsZero];
                [self resizeAllSubView:button insets:UIEdgeInsetsZero];

                //: [button sizeToFit];
                [button sizeToFit];
            }
        }
    }
}


//: - (void)recycleAllSubViews:(UIView *)view
- (void)show:(UIView *)view
{
    //: for (UIView *subView in view.subviews)
    for (UIView *subView in view.subviews)
    {
        //: if (subView == self.bubbleImageView || subView == self.continueButton) {
        if (subView == self.bubbleImageView || subView == self.continueButton) {
            //: continue;
            continue;
        }
        //: [subView removeFromSuperview];
        [subView removeFromSuperview];

        //: subView.frame = CGRectZero;
        subView.frame = CGRectZero;
        //: if ([subView isKindOfClass:[NTESSessionRobotButton class]])
        if ([subView isKindOfClass:[ClinicChildFasteningControl class]])
        {
            //: NTESSessionRobotButton *btn = (NTESSessionRobotButton *)subView;
            ClinicChildFasteningControl *btn = (ClinicChildFasteningControl *)subView;
            //: btn.target = nil;
            btn.target = nil;
            //: btn.url = nil;
            btn.url = nil;
            //: btn.param = nil;
            btn.param = nil;
            //: [btn removeTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
            [btn removeTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
            //: [_buttons addObject:subView];
            [_buttons addObject:subView];
        }
        //: if ([subView isKindOfClass:[UILabel class]])
        if ([subView isKindOfClass:[UILabel class]])
        {
            //: [_labels addObject:subView];
            [_labels addObject:subView];
        }
        //: if ([subView isKindOfClass:[UIImageView class]])
        if ([subView isKindOfClass:[UIImageView class]])
        {
            //: [_imageViews addObject:subView];
            [_imageViews addObject:subView];
        }

        //: [self recycleAllSubViews:subView];
        [self recycleAllSubViews:subView];
    }
}

//: - (M80AttributedLabel *)genLabel
- (MessageEnableTextView *)background
{
    //: M80AttributedLabel *label = nil;
    MessageEnableTextView *label = nil;
    //: if (self.labels.count)
    if (self.labels.count)
    {
        //: label = self.labels.anyObject;
        label = self.labels.anyObject;
        //: [self.labels removeObject:label];
        [self.labels removeObject:label];
    }
    //: else
    else
    {
        //: label = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
        label = [[MessageEnableTextView alloc] initWithFrame:CGRectZero];
        //: label.numberOfLines = 0;
        label.numberOfLines = 0;
        //: label.lineBreakMode = NSLineBreakByWordWrapping;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        //: label.backgroundColor = [UIColor clearColor];
        label.backgroundColor = [UIColor clearColor];
        //: label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    //: label.textAlignment = kCTTextAlignmentLeft;
    label.textAlignment = kCTTextAlignmentLeft;
    //: label.font = [UIFont systemFontOfSize:Chatroom_Message_Font_Size];
    label.font = [UIFont systemFontOfSize:Chatroom_Message_Font_Size];
    //: label.textColor = [UIColor blackColor];
    label.textColor = [UIColor blackColor];

    //: return label;
    return label;
}

//: - (NTESSessionRobotButton *)genButton
- (ClinicChildFasteningControl *)valueButton
{
    //: NTESSessionRobotButton *button = nil;
    ClinicChildFasteningControl *button = nil;
    //: if (self.buttons.count)
    if (self.buttons.count)
    {
        //: button = self.buttons.anyObject;
        button = self.buttons.anyObject;
        //: [self.buttons removeObject:button];
        [self.buttons removeObject:button];
    }
    //: else
    else
    {
        //: button = [[NTESSessionRobotButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        button = [[ClinicChildFasteningControl alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        //: button.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        button.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    //: [button addTarget:self action:@selector(onTouchButton:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(onTouchButton:) forControlEvents:UIControlEventTouchUpInside];
    //: return button;
    return button;
}

//: - (UIImageView *)genImageView
- (UIImageView *)we
{
    //: UIImageView *view = nil;
    UIImageView *view = nil;
    //: if (self.imageViews.count)
    if (self.imageViews.count)
    {
        //: view = self.imageViews.anyObject;
        view = self.imageViews.anyObject;
        //: [self.imageViews removeObject:view];
        [self.imageViews removeObject:view];
    }
    //: else
    else
    {
        //: view = [[UIImageView alloc] initWithFrame:CGRectZero];
        view = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    //: return view;
    return view;
}

//: + (CGFloat)itemSpacing
+ (CGFloat)user
{
    //: return 7.f;
    return 7.f;
}

//: + (CGFloat)continueItemSpacing
+ (CGFloat)info
{
    //: return 5.f;
    return 5.f;
}



//: @end
@end

//: @implementation NTESSessionRobotButton
@implementation ClinicChildFasteningControl

//: - (instancetype)initWithFrame:(CGRect)frame
- (instancetype)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self)
    if (self)
    {
        //: self.layer.borderColor = [UIColor clearColor].CGColor;
        self.layer.borderColor = [UIColor clearColor].CGColor;
        //: self.layer.borderWidth = 1.f;
        self.layer.borderWidth = 1.f;
        //: self.layer.cornerRadius = 18;
        self.layer.cornerRadius = 18;
        //: self.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
    }
    //: return self;
    return self;
}

//: - (CGSize)sizeThatFits:(CGSize)size
- (CGSize)sizeThatFits:(CGSize)size
{
    //: CGFloat height = [self itemSpacing];
    CGFloat height = [self itemSpacing];
    //: for (UIView *subView in self.subviews) {
    for (UIView *subView in self.subviews) {
        //: height += subView.height;
        height += subView.height;
        //: height += [self itemSpacing];
        height += [self itemSpacing];
    }
    //: return CGSizeMake(self.width, height);
    return CGSizeMake(self.width, height);
}

//: - (void)setHighlighted:(BOOL)highlighted
- (void)setHighlighted:(BOOL)highlighted
{
    //: [super setHighlighted:highlighted];
    [super setHighlighted:highlighted];
    //: self.alpha = highlighted? 0.5f : 1.0f;
    self.alpha = highlighted? 0.5f : 1.0f;
}


//: - (void)layoutSubviews
- (void)layoutSubviews
{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: CGFloat top = [self itemSpacing];
    CGFloat top = [self itemSpacing];
    //: for (UIView *view in self.subviews)
    for (UIView *view in self.subviews)
    {
        //: view.centerX = self.width * .5;
        view.centerX = self.width * .5;
        //: view.top = top;
        view.top = top;
        //: top = view.bottom + [self itemSpacing];
        top = view.bottom + [self itemSpacing];
    }
}

//: - (CGFloat)itemSpacing
- (CGFloat)item
{
    //: return 5.f;
    return 5.f;
}

//: @end
@end