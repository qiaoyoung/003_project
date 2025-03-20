
#import <Foundation/Foundation.h>

NSString *StringFromExcitedData(Byte *data);


//: ic_close_group
Byte str_estheticInsectValue[] = {80, 14, 69, 11, 132, 226, 191, 13, 67, 129, 209, 174, 168, 164, 168, 177, 180, 184, 170, 164, 172, 183, 180, 186, 181, 212};


//: contact_head_selected
Byte str_limpChantName[] = {84, 21, 5, 7, 42, 70, 73, 104, 116, 115, 121, 102, 104, 121, 100, 109, 106, 102, 105, 100, 120, 106, 113, 106, 104, 121, 106, 105, 106};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ContactPickedView.m
//  NIM
//
//  Created by ios on 10/23/13.
//  Copyright (c) 2013 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAContactPickedView.h"
#import "TeamMarkView.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"

//: enum RefreshType
enum RefreshType
{
    //: RefreshType_Remove,
    RefreshType_Remove,
    //: RefreshType_Add
    RefreshType_Add
//: };
};

//: @interface NIMContactSelectAvatarView : BBBAvatarImageView
@interface SControl : AvatarControl

//: @property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *userId;
//: @property (nonatomic, strong) UIImageView *deleteImg;
@property (nonatomic, strong) UIImageView *deleteImg;

//: @end
@end

//: @implementation NIMContactSelectAvatarView
@implementation SControl

//: - (instancetype)initWithFrame:(CGRect)frame {
- (instancetype)initWithFrame:(CGRect)frame {
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: self.deleteImg = [[UIImageView alloc] initWithFrame:CGRectMake(48 -22, 5, 17, 17)];
        self.deleteImg = [[UIImageView alloc] initWithFrame:CGRectMake(48 -22, 5, 17, 17)];
        //: self.deleteImg.image = [UIImage imageNamed:@"ic_close_group"];
        self.deleteImg.image = [UIImage imageNamed:StringFromExcitedData(str_estheticInsectValue)];
        //: [self addSubview:self.deleteImg];
        [self addSubview:self.deleteImg];

    }
    //: return self;
    return self;
}

//: @end
@end


//: @interface AAAContactPickedView()
@interface TeamMarkView()

//: @property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *scrollView;
//: @property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSMutableArray *array;
//: @property (nonatomic, assign) NSInteger currentPos;
@property (nonatomic, assign) NSInteger currentPos;
//: @property (nonatomic, strong) NIMContactSelectAvatarView *blankView;
@property (nonatomic, strong) SControl *blankView;

//: @end
@end

//: @implementation AAAContactPickedView
@implementation TeamMarkView

//: - (instancetype)initWithCoder:(NSCoder *)aDecoder {
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    //: self = [super initWithCoder:aDecoder];
    self = [super initWithCoder:aDecoder];
    //: if (self) {
    if (self) {
        //: [self initUI];
        [self initSomewhereUi];
    }
    //: return self;
    return self;
}

//: - (id)initWithFrame:(CGRect)frame
- (id)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: [self initUI];
        [self initSomewhereUi];
    }
    //: return self;
    return self;
}

//: - (void)initUI {
- (void)initSomewhereUi {
    //: UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    //: scrollView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                    //: UIViewAutoresizingFlexibleTopMargin |
                                    UIViewAutoresizingFlexibleTopMargin |
                                    //: UIViewAutoresizingFlexibleWidth |
                                    UIViewAutoresizingFlexibleWidth |
                                    //: UIViewAutoresizingFlexibleHeight;
                                    UIViewAutoresizingFlexibleHeight;

    //: [scrollView setContentSize:self.frame.size];
    [scrollView setContentSize:self.frame.size];
    //: [scrollView setScrollEnabled:YES];
    [scrollView setScrollEnabled:YES];
    //: [scrollView setScrollsToTop:NO];
    [scrollView setScrollsToTop:NO];
    //: [self addSubview:scrollView];
    [self addSubview:scrollView];
    //: self.scrollView = scrollView;
    self.scrollView = scrollView;

    //: self.array = [NSMutableArray array];
    self.array = [NSMutableArray array];
    //: self.currentPos = 10;
    self.currentPos = 10;
//    [self addBlankAvatarView];
}

//: - (void)addBlankAvatarView
- (void)hitOrMiss
{
    //: self.blankView = [[NIMContactSelectAvatarView alloc]init];
    self.blankView = [[SControl alloc]init];
    //: [self.blankView setImage:[UIImage imageNamed:@"contact_head_selected"]];
    [self.blankView setImage:[UIImage imageNamed:StringFromExcitedData(str_limpChantName)]];
    //: [self.blankView setFrame:CGRectMake(self.currentPos, 7, 48, 48)];
    [self.blankView setFrame:CGRectMake(self.currentPos, 7, 48, 48)];
    //: self.blankView.userId = @"";
    self.blankView.userId = @"";
    //: [self.scrollView addSubview:self.blankView];
    [self.scrollView addSubview:self.blankView];
}

//: - (void)moveBlankAvatarView
- (void)to
{
    //: CGRect frame = self.blankView.frame;
    CGRect frame = self.blankView.frame;
    //: frame.origin.x = self.currentPos;
    frame.origin.x = self.currentPos;

    //: [UIView animateWithDuration:0.1 animations:^{
    [UIView animateWithDuration:0.1 animations:^{
        //: [self.blankView setFrame:frame];
        [self.blankView setFrame:frame];
    //: }];
    }];
}

//: - (void)addAvatarView:(NIMContactSelectAvatarView *)view
- (void)pin:(SControl *)view
{
    //: [view addTarget:self action:@selector(remove:) forControlEvents:UIControlEventTouchUpInside];
    [view addTarget:self action:@selector(banked:) forControlEvents:UIControlEventTouchUpInside];
    //: [self.array addObject:view];
    [self.array addObject:view];
    //: [self refreshView:RefreshType_Add];
    [self index:RefreshType_Add];
    //: [view setFrame:CGRectMake(self.currentPos, 7, 48, 48)];
    [view setFrame:CGRectMake(self.currentPos, 7, 48, 48)];
    //: view.layer.masksToBounds = YES;
    view.layer.masksToBounds = YES;
    //: view.layer.cornerRadius = 48/2;
    view.layer.cornerRadius = 48/2;
    //: [self.scrollView addSubview:view];
    [self.scrollView addSubview:view];
    //: self.currentPos = self.currentPos + 10 + 48;
    self.currentPos = self.currentPos + 10 + 48;
    //: [self moveBlankAvatarView];
    [self to];
}

//: - (void)removeAvatarView:(NIMContactSelectAvatarView *)view
- (void)position:(SControl *)view
{
    //: NSInteger i = [self.array indexOfObject:view];
    NSInteger i = [self.array indexOfObject:view];
    //: [self.array removeObject:view];
    [self.array removeObject:view];
    //: [self refreshView:RefreshType_Remove];
    [self index:RefreshType_Remove];
    //: [view removeFromSuperview];
    [view removeFromSuperview];

    //: for (NSInteger j = i; j < [self.array count]; j++) {
    for (NSInteger j = i; j < [self.array count]; j++) {
        //: NIMContactSelectAvatarView *view = [self.array objectAtIndex:j];
        SControl *view = [self.array objectAtIndex:j];
        //: CGRect frame = view.frame;
        CGRect frame = view.frame;
        //: frame.origin.x = frame.origin.x - 48 - 10;
        frame.origin.x = frame.origin.x - 48 - 10;
        //: [view setFrame:frame];
        [view setFrame:frame];
    }
    //: self.currentPos = self.currentPos - 10 - 48;
    self.currentPos = self.currentPos - 10 - 48;
    //: [self moveBlankAvatarView];
    [self to];
}


//: - (void)addMemberInfo:(CCCKitInfo *)info
- (void)message:(TitleInfo *)info
{

    //: NIMContactSelectAvatarView *avatar = [[NIMContactSelectAvatarView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    SControl *avatar = [[SControl alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    //: NSURL *url = info.avatarUrlString ? [NSURL URLWithString:info.avatarUrlString] : nil;
    NSURL *url = info.avatarUrlString ? [NSURL URLWithString:info.avatarUrlString] : nil;
    //: [avatar nim_setImageWithURL:url placeholderImage:info.avatarImage options:SDWebImageRetryFailed];
    [avatar ofOptions:url complete:info.avatarImage image:SDWebImageRetryFailed];
    //: avatar.userId = info.infoId;
    avatar.userId = info.infoId;
    //: [self addAvatarView:avatar];
    [self pin:avatar];
}

//: - (void)removeMemberInfo:(CCCKitInfo *)info
- (void)atShowInfo:(TitleInfo *)info
{
    //: NSInteger i = 0;
    NSInteger i = 0;
    //: for (i = 0;i<[self.array count];i++) {
    for (i = 0;i<[self.array count];i++) {
        //: NIMContactSelectAvatarView *view = [self.array objectAtIndex:i];
        SControl *view = [self.array objectAtIndex:i];
        //: if ([view.userId isEqualToString:info.infoId]) {
        if ([view.userId isEqualToString:info.infoId]) {
            //: [self removeAvatarView:view];
            [self position:view];
            //: break;
            break;
        }
    }
}

//: - (void)refreshView:(enum RefreshType)refreshType
- (void)index:(enum RefreshType)refreshType
{
    //: NSInteger width = ([self.array count]+1)*(48 +10)+10;
    NSInteger width = ([self.array count]+1)*(48 +10)+10;
    //: CGSize size = self.scrollView.contentSize;
    CGSize size = self.scrollView.contentSize;
    //: size.width = width;
    size.width = width;
    //: [self.scrollView setContentSize:size];
    [self.scrollView setContentSize:size];

    //: CGPoint offset = self.scrollView.contentOffset;
    CGPoint offset = self.scrollView.contentOffset;
    //: if (width> self.scrollView.frame.size.width) {
    if (width> self.scrollView.frame.size.width) {
        //: int offsetX = width - self.scrollView.frame.size.width;
        int offsetX = width - self.scrollView.frame.size.width;
        //: if (!(refreshType == RefreshType_Remove && offsetX > offset.x)) {
        if (!(refreshType == RefreshType_Remove && offsetX > offset.x)) {
            //: offset.x = offsetX;
            offset.x = offsetX;
        }
    }
    //: else {
    else {
        //: offset.x = 0;
        offset.x = 0;
    }
    //: [self.scrollView setContentOffset:offset animated:YES];
    [self.scrollView setContentOffset:offset animated:YES];
}

//: #pragma mark - action
#pragma mark - action
//: - (IBAction)remove:(id)sender
- (IBAction)banked:(id)sender
{
    //: NIMContactSelectAvatarView *view = (NIMContactSelectAvatarView *)sender;
    SControl *view = (SControl *)sender;
    //: [self.delegate removeUser:view.userId];
    [self.delegate array:view.userId];
    //: [self removeAvatarView:view];
    [self position:view];
}

//: @end
@end

Byte * ExcitedDataToCache(Byte *data) {
    int tingSeventh = data[0];
    int tantamount = data[1];
    Byte scienceLab = data[2];
    int pest = data[3];
    if (!tingSeventh) return data + pest;
    for (int i = pest; i < pest + tantamount; i++) {
        int value = data[i] - scienceLab;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[pest + tantamount] = 0;
    return data + pest;
}

NSString *StringFromExcitedData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ExcitedDataToCache(data)];
}
