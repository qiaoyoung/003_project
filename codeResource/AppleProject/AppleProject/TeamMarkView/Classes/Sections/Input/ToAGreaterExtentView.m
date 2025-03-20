
#import <Foundation/Foundation.h>

NSString *StringFromAuraData(Byte *data);


//: invalid item selector!
Byte str_significanceTitle[] = {55, 22, 37, 8, 28, 59, 150, 30, 142, 147, 155, 134, 145, 142, 137, 69, 142, 153, 138, 146, 69, 152, 138, 145, 138, 136, 153, 148, 151, 70, 74};


//: #612CF9
Byte str_centerValue[] = {53, 7, 54, 14, 224, 129, 207, 238, 217, 170, 237, 14, 82, 183, 89, 108, 103, 104, 121, 124, 111, 35};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESInputMoreContainerView.m
//  NIMDemo
//
//  Created by chris.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAInputMoreContainerView.h"
#import "ToAGreaterExtentView.h"
//: #import "BBBPageView.h"
#import "ColorAddView.h"
//: #import "BBBMediaItem.h"
#import "WithMin.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: NSInteger NIMMaxItemCountInPage = 8;
NSInteger k_groupSessionSearchData = 8;
//: NSInteger NIMButtonItemWidth = 75;
NSInteger k_objectValue = 75;
//: NSInteger NIMButtonItemHeight = 85;
NSInteger k_cellRetToValue = 85;
//: NSInteger NIMPageRowCount = 2;
NSInteger k_labelValue = 2;
//: NSInteger NIMPageColumnCount = 4;
NSInteger k_frameData = 4;
//: NSInteger NIMButtonBegintLeftX = 11;
NSInteger k_controlData = 11;




//: @interface AAAInputMoreContainerView() <BBBPageViewDataSource,BBBPageViewDelegate>
@interface ToAGreaterExtentView() <TingFacingPagesSource,MinDelegate>
{
    //: NSArray *_mediaButtons;
    NSArray *_mediaButtons;
    //: NSArray *_mediaItems;
    NSArray *_mediaItems;
}

//: @property (nonatomic, strong) BBBPageView *pageView;
@property (nonatomic, strong) ColorAddView *pageView;

//: @end
@end

//: @implementation AAAInputMoreContainerView
@implementation ToAGreaterExtentView

//: - (instancetype)initWithFrame:(CGRect)frame
- (instancetype)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: _pageView = [[BBBPageView alloc] initWithFrame:CGRectZero];
        _pageView = [[ColorAddView alloc] initWithFrame:CGRectZero];
        //: _pageView.dataSource = self;
        _pageView.dataSource = self;
        //: [self addSubview:_pageView];
        [self addSubview:_pageView];
    }
    //: return self;
    return self;
}

//: - (void)setConfig:(id<CCCSessionConfig>)config
- (void)setConfig:(id<FromConfig>)config
{
    //: _config = config;
    _config = config;
    //: [self genMediaButtons];
    [self crownQuick];
    //: [self.pageView reloadData];
    [self.pageView reload];
}


//: - (CGSize)sizeThatFits:(CGSize)size
- (CGSize)sizeThatFits:(CGSize)size
{
    //: return CGSizeMake(size.width, 105.f);
    return CGSizeMake(size.width, 105.f);
}


//: - (void)genMediaButtons
- (void)crownQuick
{
    //: NSMutableArray *mediaButtons = [NSMutableArray array];
    NSMutableArray *mediaButtons = [NSMutableArray array];
    //: NSMutableArray *mediaItems = [NSMutableArray array];
    NSMutableArray *mediaItems = [NSMutableArray array];
    //: NSArray *items;
    NSArray *items;
    //: if (!self.config)
    if (!self.config)
    {
        //: items = [AppleProjectKit sharedKit].config.defaultMediaItems;
        items = [Indicator reach].config.cellItems;
    }
    //: else if([self.config respondsToSelector:@selector(mediaItems)])
    else if([self.config respondsToSelector:@selector(titleView)])
    {
        //: items = [self.config mediaItems];
        items = [self.config titleView];
    }
    //: [items enumerateObjectsUsingBlock:^(BBBMediaItem *item, NSUInteger idx, BOOL *stop) {
    [items enumerateObjectsUsingBlock:^(WithMin *item, NSUInteger idx, BOOL *stop) {
        //: [mediaItems addObject:item];
        [mediaItems addObject:item];

        //: UIButton *btn = [[UIButton alloc] init];
        UIButton *btn = [[UIButton alloc] init];
        //: btn.tag = idx;
        btn.tag = idx;
        //: [btn setImage:item.normalImage forState:UIControlStateNormal];
        [btn setImage:item.normalImage forState:UIControlStateNormal];
        //: [btn setImage:item.selectedImage forState:UIControlStateHighlighted];
        [btn setImage:item.selectedImage forState:UIControlStateHighlighted];
        //: [btn setTitle:item.title forState:UIControlStateNormal];
        [btn setTitle:item.title forState:UIControlStateNormal];
        //: [btn setTitleColor:[UIColor colorWithHexString:@"#612CF9"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor direction:StringFromAuraData(str_centerValue)] forState:UIControlStateNormal];
        //: btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//        [btn setTitleEdgeInsets:UIEdgeInsetsMake(76, -75, 0, 0)];
        //: [btn setTitleEdgeInsets:UIEdgeInsetsMake(44, -44, 0, 0)];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(44, -44, 0, 0)];
        //: [btn setImageEdgeInsets:UIEdgeInsetsMake(-16, 0, 0, -[self calculateWidthWithFont:14 Text:item.title])];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(-16, 0, 0, -[self item:14 red:item.title])];

        //: [btn.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
        //: btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        //: [mediaButtons addObject:btn];
        [mediaButtons addObject:btn];

    //: }];
    }];
    //: _mediaButtons = mediaButtons;
    _mediaButtons = mediaButtons;
    //: _mediaItems = mediaItems;
    _mediaItems = mediaItems;
}

//: -(CGFloat)calculateWidthWithFont:(NSInteger)Font Text:(NSString *)text{
-(CGFloat)item:(NSInteger)Font red:(NSString *)text{
    //: NSDictionary *attr = @{NSFontAttributeName : [UIFont systemFontOfSize:Font]};
    NSDictionary *attr = @{NSFontAttributeName : [UIFont systemFontOfSize:Font]};
    //: CGRect rect = [text boundingRectWithSize:CGSizeMake(0x1.fffffep+127f, Font + 2)
    CGRect rect = [text boundingRectWithSize:CGSizeMake(0x1.fffffep+127f, Font + 2)
                                     //: options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                     options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                  //: attributes:attr
                                  attributes:attr
                                     //: context:nil];
                                     context:nil];
    //: return rect.size.width;
    return rect.size.width;
}



//: - (void)setFrame:(CGRect)frame{
- (void)setFrame:(CGRect)frame{
    //: CGFloat originalWidth = self.frame.size.width;
    CGFloat originalWidth = self.frame.size.width;
    //: [super setFrame:frame];
    [super setFrame:frame];
    //: if (originalWidth != frame.size.width)
    if (originalWidth != frame.size.width)
    {
        //: self.pageView.frame = self.bounds;
        self.pageView.frame = self.bounds;
        //: [self.pageView reloadData];
        [self.pageView reload];
    }
}

//: - (void)dealloc
- (void)dealloc
{
    //: _pageView.dataSource = nil;
    _pageView.dataSource = nil;
}


//: #pragma mark PageViewDataSource
#pragma mark PageViewDataSource
//: - (NSInteger)numberOfPages: (BBBPageView *)pageView
- (NSInteger)titles: (ColorAddView *)pageView
{
    //: NSInteger count = [_mediaButtons count] / NIMMaxItemCountInPage;
    NSInteger count = [_mediaButtons count] / k_groupSessionSearchData;
    //: count = ([_mediaButtons count] % NIMMaxItemCountInPage == 0) ? count: count + 1;
    count = ([_mediaButtons count] % k_groupSessionSearchData == 0) ? count: count + 1;
    //: return ((count) > (1) ? (count) : (1));
    return ((count) > (1) ? (count) : (1));
}

//: - (UIView*)mediaPageView:(BBBPageView*)pageView beginItem:(NSInteger)begin endItem:(NSInteger)end
- (UIView*)object:(ColorAddView*)pageView vanishGetToViewItemListPageInstrumentality:(NSInteger)begin ting:(NSInteger)end
{
    //: UIView *subView = [[UIView alloc] init];
    UIView *subView = [[UIView alloc] init];
    //: NSInteger span = (self.nim_width - NIMPageColumnCount * NIMButtonItemWidth) / (NIMPageColumnCount +1);
    NSInteger span = (self.nim_width - k_frameData * k_objectValue) / (k_frameData +1);
    //: CGFloat startY = NIMButtonBegintLeftX;
    CGFloat startY = k_controlData;
    //: NSInteger coloumnIndex = 0;
    NSInteger coloumnIndex = 0;
    //: NSInteger rowIndex = 0;
    NSInteger rowIndex = 0;
    //: NSInteger indexInPage = 0;
    NSInteger indexInPage = 0;
    //: for (NSInteger index = begin; index < end; index ++)
    for (NSInteger index = begin; index < end; index ++)
    {
        //: UIButton *button = [_mediaButtons objectAtIndex:index];
        UIButton *button = [_mediaButtons objectAtIndex:index];
        //: [button addTarget:self action:@selector(onTouchButton:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(schemes:) forControlEvents:UIControlEventTouchUpInside];
        //计算位置
        //: rowIndex = indexInPage / NIMPageColumnCount;
        rowIndex = indexInPage / k_frameData;
        //: coloumnIndex= indexInPage % NIMPageColumnCount;
        coloumnIndex= indexInPage % k_frameData;
        //: CGFloat x = span + (NIMButtonItemWidth + span) * coloumnIndex;
        CGFloat x = span + (k_objectValue + span) * coloumnIndex;
        //: CGFloat y = 0.0;
        CGFloat y = 0.0;
        //: if (rowIndex > 0)
        if (rowIndex > 0)
        {
            //: y = rowIndex * NIMButtonItemHeight + startY + 15;
            y = rowIndex * k_cellRetToValue + startY + 15;
        }
        //: else
        else
        {
            //: y = rowIndex * NIMButtonItemHeight + startY;
            y = rowIndex * k_cellRetToValue + startY;
        }
        //: [button setFrame:CGRectMake(x, y, NIMButtonItemWidth, NIMButtonItemHeight)];
        [button setFrame:CGRectMake(x, y, k_objectValue, k_cellRetToValue)];
        //: [subView addSubview:button];
        [subView addSubview:button];
        //: indexInPage ++;
        indexInPage ++;
    }
    //: return subView;
    return subView;
}

//: - (UIView*)oneLineMediaInPageView:(BBBPageView *)pageView
- (UIView*)rivetLineValue:(ColorAddView *)pageView
                       //: viewInPage: (NSInteger)index
                       framePosition: (NSInteger)index
                            //: count:(NSInteger)count
                            forefront:(NSInteger)count
{
    //: UIView *subView = [[UIView alloc] init];
    UIView *subView = [[UIView alloc] init];
    //: NSInteger span = (self.nim_width - count * NIMButtonItemWidth) / (count +1);
    NSInteger span = (self.nim_width - count * k_objectValue) / (count +1);

    //: for (NSInteger btnIndex = 0; btnIndex < count; btnIndex ++)
    for (NSInteger btnIndex = 0; btnIndex < count; btnIndex ++)
    {
        //: UIButton *button = [_mediaButtons objectAtIndex:btnIndex];
        UIButton *button = [_mediaButtons objectAtIndex:btnIndex];
        //: [button addTarget:self action:@selector(onTouchButton:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(schemes:) forControlEvents:UIControlEventTouchUpInside];
        //: CGRect iconRect = CGRectMake(span + (NIMButtonItemWidth + span) * btnIndex, 0, NIMButtonItemWidth, NIMButtonItemHeight);
        CGRect iconRect = CGRectMake(span + (k_objectValue + span) * btnIndex, 0, k_objectValue, k_cellRetToValue);
        //: [button setFrame:iconRect];
        [button setFrame:iconRect];
        //: [subView addSubview:button];
        [subView addSubview:button];
    }
    //: return subView;
    return subView;
}

//: - (UIView *)pageView: (BBBPageView *)pageView viewInPage: (NSInteger)index
- (UIView *)comment: (ColorAddView *)pageView designatePage: (NSInteger)index
{
    //: if ([_mediaButtons count] == 2 || [_mediaButtons count] == 3) 
    if ([_mediaButtons count] == 2 || [_mediaButtons count] == 3) //一行显示2个或者3个
    {
        //: return [self oneLineMediaInPageView:pageView viewInPage:index count:[_mediaButtons count]];
        return [self rivetLineValue:pageView framePosition:index forefront:[_mediaButtons count]];
    }

    //: if (index < 0)
    if (index < 0)
    {
        //: assert(0);
        assert(0);
        //: index = 0;
        index = 0;
    }
    //: NSInteger begin = index * NIMMaxItemCountInPage;
    NSInteger begin = index * k_groupSessionSearchData;
    //: NSInteger end = (index + 1) * NIMMaxItemCountInPage;
    NSInteger end = (index + 1) * k_groupSessionSearchData;
    //: if (end > [_mediaButtons count])
    if (end > [_mediaButtons count])
    {
        //: end = [_mediaButtons count];
        end = [_mediaButtons count];
    }
    //: return [self mediaPageView:pageView beginItem:begin endItem:end];
    return [self object:pageView vanishGetToViewItemListPageInstrumentality:begin ting:end];
}

//: #pragma mark - button actions
#pragma mark - button actions
//: - (void)onTouchButton:(id)sender
- (void)schemes:(id)sender
{
    //: NSInteger index = [(UIButton *)sender tag];
    NSInteger index = [(UIButton *)sender tag];
    //: BBBMediaItem *item = _mediaItems[index];
    WithMin *item = _mediaItems[index];
    //: if (_actionDelegate && [_actionDelegate respondsToSelector:@selector(onTapMediaItem:)]) {
    if (_actionDelegate && [_actionDelegate respondsToSelector:@selector(allOf:)]) {
        //: BOOL handled = [_actionDelegate onTapMediaItem:item];
        BOOL handled = [_actionDelegate allOf:item];
        //: if (!handled) {
        if (!handled) {
            //: NSAssert(0, @"invalid item selector!");
            NSAssert(0, StringFromAuraData(str_significanceTitle));
        }
    }

}

//: @end
@end

Byte * AuraDataToCache(Byte *data) {
    int scapeGoal = data[0];
    int blow = data[1];
    Byte broody = data[2];
    int saintElmoSLight = data[3];
    if (!scapeGoal) return data + saintElmoSLight;
    for (int i = saintElmoSLight; i < saintElmoSLight + blow; i++) {
        int value = data[i] - broody;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[saintElmoSLight + blow] = 0;
    return data + saintElmoSLight;
}

NSString *StringFromAuraData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)AuraDataToCache(data)];
}
