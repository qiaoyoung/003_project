//
//  SNLeadCompleteInfo.m
//  sohunews
//
//  Created by tianyulong on 2020/4/20.
//  Copyright © 2020 Sohu.com. All rights reserved.
//

#import "SNLeadCompleteInfo.h"


#define BACKGROUND_COLOR    [UIColor colorWithRed:231/255.0 green:184/255.0 blue:108/255.0 alpha:1.0];
#define TIP_TEXT_COLOR      [UIColor blackColor]
#define SHADOW_RADIUS       8

#define kSCREEN_BOUNDS [UIScreen mainScreen].bounds
#define kSCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kIs_iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define kIs_iPhoneX kSCREEN_WIDTH >=375.0f && kSCREEN_HEIGHT >=812.0f&& kIs_iphone
/*底部安全区域远离高度*/
#define kBottomSafeHeight (CGFloat)(kIs_iPhoneX?(34.0):(0))
/*TabBar高度*/
#define kTabBarHeight (CGFloat)(kIs_iPhoneX?(49.0 + 34.0):(49.0))

// 判断是否是iPhone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)]\
? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)\
|| CGSizeEqualToSize(CGSizeMake(1136, 640), [[UIScreen mainScreen] currentMode].size) : NO)


static NSAttributedString *NSAttributedStringFromTitle(__unsafe_unretained NSString *title)
{
    if (nil == title) {
        return nil;
    }
    
    UIFont *font = [UIFont systemFontOfSize:11];
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName: TIP_TEXT_COLOR,
                                 NSFontAttributeName: font};
    NSAttributedString *as = [[NSAttributedString alloc] initWithString:title attributes:attributes];
    return as;
}

@interface SNLeadCompleteInfo () <UUMarqueeViewDelegate>

@property (nonatomic, strong) UIImageView *noticeImageview;

@property (nonatomic, strong) UIButton *actionButton;

@end


@implementation SNLeadCompleteInfo

CGFloat SNStatusBarHeight(void) {
    static CGFloat statusBarHeight;
    if (statusBarHeight <= 0) {
        if (@available(iOS 13.0, *)) {
            UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
            statusBarHeight = statusBarManager.statusBarFrame.size.height;
        } else {
            statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
        }
    }
    
    return statusBarHeight;
}

CGFloat SNNavBarHeight(void) {
    return SNStatusBarHeight() + 44;
}


+ (instancetype)showTipViewForCompletingUserInfolWithDelay:(float)delay
                                                 superView:(UIView *)superView
                                    CompletingUserInfoType:(CompletingUserInfoType)type
                                               withMessage:(NSString *)msg
                                                 trueBlock:(void (^)(void))trueBlock
                                               cancleBlock:(void (^)(void))callback {
    
    SNLeadCompleteInfo *tipView = [[SNLeadCompleteInfo alloc] initWithFrame:(CGRect) {
        .origin.x = 5,
        .origin.y = SCREEN_TOP_HEIGHT+5,
        .size.width = UIScreen.mainScreen.bounds.size.width-10.f,
        .size.height = 46.f
    }];

    [tipView p_updateInTransaction:^(SNLeadCompleteInfo *tipView) {
        tipView.completeType = type;
        tipView.completion   = trueBlock;
        tipView.cancleCompletion  = callback;

        switch (type) {
            case CompletingUserInfoType_headicon:
                tipView.title = msg;
                tipView.actionTitle = @"click";
                break;

            default:
                break;
        }
    }];
    
    if (delay > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [tipView p_showOnView:superView];
        });
    } else {
        [tipView p_showOnView:superView];
    }
    
    return tipView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 4.f;
        self.layer.masksToBounds = YES;
        self.userInteractionEnabled = YES;
        {
            self.leftwardMarqueeView = [[UUMarqueeView alloc] initWithFrame:CGRectMake(54, 0, kSCREEN_WIDTH- 54 - 30 - 10, 46) direction:UUMarqueeViewDirectionLeftward];
            _leftwardMarqueeView.delegate = self;
            _leftwardMarqueeView.timeIntervalPerScroll = 3.0f;
            _leftwardMarqueeView.scrollSpeed = 40.0f;
            _leftwardMarqueeView.itemSpacing = 20.0f;
            _leftwardMarqueeView.touchEnabled = YES;
            _leftwardMarqueeView.backgroundColor = [UIColor whiteColor];
            [self addSubview:_leftwardMarqueeView];
        }
        
        // action button
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//            button.backgroundColor = [UIColor redColor];
            [button addTarget:self action:@selector(p_dismissActionTouched:) forControlEvents:UIControlEventTouchUpInside];
//            [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [self addSubview:button];
            self.actionButton = button;
        }
        
        {
            UIImageView *noticeImageview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 6, 34, 34)];
            noticeImageview.image = [UIImage imageNamed:@"speaker"];
            [self addSubview:noticeImageview];
            self.noticeImageview = noticeImageview;
        }
        
        
    }
    return self;
}

- (void)p_updateInTransaction:(void (^)(SNLeadCompleteInfo *tipView))transactionBlock
{
    if (nil == transactionBlock) {
        return;
    }
    
    transactionBlock(self);
    
    [_actionButton setImage:[UIImage imageNamed:@"lead_close"] forState:(UIControlStateNormal)];
        
    // 设置 action button 的 frame
    {
                
        CGRect frame = CGRectMake(0, 0, 30, 30);
        frame.origin.x = CGRectGetMaxX(self.bounds) - frame.size.width;
        frame.origin.y = (self.bounds.size.height - frame.size.height) * 0.5;
        
        _actionButton.frame = CGRectIntegral(frame);
    }
    
    [_leftwardMarqueeView reloadData];
    [_leftwardMarqueeView start];
}


#pragma mark -
#pragma mark Prviate

- (void)p_showOnView:(UIView *)superView
{
    [superView addSubview:self];
    
    [UIView animateWithDuration:0.5 delay:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
        CGRect frame = self.frame;
        frame.origin.y = SNStatusBarHeight() + 44 + 5;
        self.frame = frame;
    } completion:nil];
}

- (void)p_dismissWith:(BOOL)callback
{
    [self.leftwardMarqueeView pause];

    if (!self.hidden && nil != self.superview) {

        [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.90 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
            CGRect frame = self.frame;
            frame.origin.y = SNStatusBarHeight();
            self.frame = frame;
        } completion:^(BOOL finished) {
            self.hidden = YES;
            [self removeFromSuperview];
            
            if (self.cancleCompletion) {
                self.cancleCompletion();
            }
            
            if (callback){
                if (self.completion) {
                    self.completion();
                }
            }
        }];
    }
}


#pragma mark -
#pragma mark Target-Action

- (void)p_dismiss {
    [self p_dismissWith:NO];
}

- (void)p_dismissActionTouched:(UIButton *)button {
    [self p_dismissWith:NO];
}

#pragma mark - UUMarqueeViewDelegate
- (NSUInteger)numberOfVisibleItemsForMarqueeView:(UUMarqueeView*)marqueeView {
    return 1;
}

- (NSUInteger)numberOfDataForMarqueeView:(UUMarqueeView*)marqueeView {
    return 1;
}

- (void)createItemView:(UIView*)itemView forMarqueeView:(UUMarqueeView*)marqueeView {
    // for leftwardMarqueeView
    itemView.backgroundColor = [UIColor clearColor];

    UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake(5.0f , 0.0f, CGRectGetWidth(itemView.bounds) - 5.0f - 5.0f, CGRectGetHeight(itemView.bounds))];
    content.font = [UIFont systemFontOfSize:13.0f];
    content.tag = 1001;
    content.textColor = [UIColor darkGrayColor];
    [itemView addSubview:content];
}

- (void)updateItemView:(UIView*)itemView atIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView {
    // for leftwardMarqueeView
    UILabel *content = [itemView viewWithTag:1001];
    content.text = self.title;

}

- (CGFloat)itemViewHeightAtIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView {
    // for upwardDynamicHeightMarqueeView
    UILabel *content = [[UILabel alloc] init];
    content.numberOfLines = 0;
    content.font = [UIFont systemFontOfSize:13.0f];
    content.text = self.title;
    CGSize contentFitSize = [content sizeThatFits:CGSizeMake(CGRectGetWidth(marqueeView.frame) - 5.0f - 5.0f, MAXFLOAT)];
    return contentFitSize.height + 20.0f;
}

- (CGFloat)itemViewWidthAtIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView {
    // for leftwardMarqueeView
    UILabel *content = [[UILabel alloc] init];
    content.font = [UIFont systemFontOfSize:13.0f];
    content.text = self.title;
    return (5.0f + 5.0f) + content.intrinsicContentSize.width;  // icon width + label width (it's perfect to cache them all)
}

- (void)didTouchItemViewAtIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView {
    [self p_dismissWith:YES];
}

@end
