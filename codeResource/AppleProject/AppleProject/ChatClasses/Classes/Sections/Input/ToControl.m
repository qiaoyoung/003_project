
#import <Foundation/Foundation.h>
typedef struct {
    Byte relax;
    Byte *impossible;
    unsigned int compartmentBet;
    bool attractLucky;
	int evolutionaryCell;
	int fesse;
	int brotherRefugee;
} WayData;

NSString *StringFromWayData(WayData *data);


//: emoji_delete
WayData str_definitionWidowSnowValue = (WayData){43, (Byte []){78, 70, 68, 65, 66, 116, 79, 78, 71, 78, 95, 78, 107}, 12, false, 5, 142, 121};


//: #2BBCFB
WayData str_achingVetValue = (WayData){104, (Byte []){75, 90, 42, 42, 43, 46, 42, 31}, 7, false, 1, 216, 11};


//: emoji_bar_bg
WayData str_oyText = (WayData){50, (Byte []){87, 95, 93, 88, 91, 109, 80, 83, 64, 109, 80, 85, 24}, 12, false, 137, 42, 79};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ToControl.m
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAInputEmoticonTabView.h"
#import "ToControl.h"
//: #import "AAAInputEmoticonManager.h"
#import "DataOf.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "CCCGlobalMacro.h"
#import "CCCGlobalMacro.h"

//: const NSInteger AAAInputEmoticonTabViewHeight = 40;
const NSInteger k_timeText = 40;
//: const NSInteger NIMInputEmoticonSendButtonWidth = 48;
const NSInteger k_backgroundText = 48;

//: const CGFloat NIMInputLineBoarder = .5f;
const CGFloat k_colorName = .5f;

//: @interface AAAInputEmoticonTabView()
@interface ToControl()

//: @property (nonatomic,strong) NSMutableArray * tabs;
@property (nonatomic,strong) NSMutableArray * tabs;

//: @property (nonatomic,strong) NSMutableArray * seps;
@property (nonatomic,strong) NSMutableArray * seps;

//: @end
@end



//: @implementation AAAInputEmoticonTabView
@implementation ToControl

//: - (instancetype)initWithFrame:(CGRect)frame{
- (instancetype)initWithFrame:(CGRect)frame{
    //: self = [super initWithFrame:CGRectMake(0, 0, frame.size.width, AAAInputEmoticonTabViewHeight)];
    self = [super initWithFrame:CGRectMake(0, 0, frame.size.width, k_timeText)];
    //: if (self) {
    if (self) {

        //: self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
//        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"emoji_bar_bg"]];
        //: UIImageView *bg = [[UIImageView alloc]initWithFrame: self.bounds];
        UIImageView *bg = [[UIImageView alloc]initWithFrame: self.bounds];
        //: bg.image = [UIImage imageNamed:@"emoji_bar_bg"];
        bg.image = [UIImage imageNamed:StringFromWayData(&str_oyText)];
        //: [self addSubview:bg];
        [self addSubview:bg];


        //: _tabs = [[NSMutableArray alloc] init];
        _tabs = [[NSMutableArray alloc] init];
        //: _seps = [[NSMutableArray alloc] init];
        _seps = [[NSMutableArray alloc] init];

        //: _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_sendButton setImage:[UIImage imageNamed:@"emoji_delete"] forState:UIControlStateNormal];
        [_sendButton setImage:[UIImage imageNamed:StringFromWayData(&str_definitionWidowSnowValue)] forState:UIControlStateNormal];
//        [_sendButton setTitle:@"发送".nim_localized forState:UIControlStateNormal];
//        _sendButton.titleLabel.font = [UIFont systemFontOfSize:13.f];
//        [_sendButton setBackgroundColor:NEEKIT_UIColorFromRGB(0x0079FF)];

        //: _sendButton.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _sendButton.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        //: _sendButton.layer.cornerRadius = 10;
        _sendButton.layer.cornerRadius = 10;
        //: _sendButton.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        _sendButton.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        //: _sendButton.layer.shadowOffset = CGSizeMake(0,1);
        _sendButton.layer.shadowOffset = CGSizeMake(0,1);
        //: _sendButton.layer.shadowOpacity = 1;
        _sendButton.layer.shadowOpacity = 1;
        //: _sendButton.layer.shadowRadius = 8;
        _sendButton.layer.shadowRadius = 8;

        //: _sendButton.nim_height = AAAInputEmoticonTabViewHeight;
        _sendButton.nim_height = k_timeText;
        //: _sendButton.nim_width = NIMInputEmoticonSendButtonWidth;
        _sendButton.nim_width = k_backgroundText;
        //: [self addSubview:_sendButton];
        [self addSubview:_sendButton];

//        self.layer.borderColor = sepColor.CGColor;
//        self.layer.borderWidth = NIMInputLineBoarder;

    }
    //: return self;
    return self;
}


//: - (void)loadCatalogs:(NSArray*)emoticonCatalogs
- (void)size:(NSArray*)emoticonCatalogs
{
    //: for (UIView *subView in [_tabs arrayByAddingObjectsFromArray:_seps]) {
    for (UIView *subView in [_tabs arrayByAddingObjectsFromArray:_seps]) {
        //: [subView removeFromSuperview];
        [subView removeFromSuperview];
    }
    //: [_tabs removeAllObjects];
    [_tabs removeAllObjects];
    //: [_seps removeAllObjects];
    [_seps removeAllObjects];
    //: for (NIMInputEmoticonCatalog * catelog in emoticonCatalogs) {
    for (TinCanTeam * catelog in emoticonCatalogs) {
        //: UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //: button.frame = CGRectMake(0, 0, 48, 40);
        button.frame = CGRectMake(0, 0, 48, 40);
        //: [button setImage:[UIImage nim_emoticonInKit:catelog.icon] forState:UIControlStateNormal];
        [button setImage:[UIImage pickings:catelog.icon] forState:UIControlStateNormal];
        //: [button setImage:[UIImage nim_emoticonInKit:catelog.iconPressed] forState:UIControlStateHighlighted];
        [button setImage:[UIImage pickings:catelog.iconPressed] forState:UIControlStateHighlighted];
        //: [button setImage:[UIImage nim_emoticonInKit:catelog.iconPressed] forState:UIControlStateSelected];
        [button setImage:[UIImage pickings:catelog.iconPressed] forState:UIControlStateSelected];
        //: [button addTarget:self action:@selector(onTouchTab:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(viewFor:) forControlEvents:UIControlEventTouchUpInside];
        //: [button sizeToFit];
        [button sizeToFit];
        //: [self addSubview:button];
        [self addSubview:button];
        //: button.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        button.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        //: button.layer.cornerRadius = 10;
        button.layer.cornerRadius = 10;
        //: button.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        button.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        //: button.layer.shadowOffset = CGSizeMake(0,1);
        button.layer.shadowOffset = CGSizeMake(0,1);
        //: button.layer.shadowOpacity = 1;
        button.layer.shadowOpacity = 1;
        //: button.layer.shadowRadius = 8;
        button.layer.shadowRadius = 8;


        //: [_tabs addObject:button];
        [_tabs addObject:button];

//        UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(0, 0, NIMInputLineBoarder, AAAInputEmoticonTabViewHeight)];
////        sep.backgroundColor = sepColor;
//        sep.backgroundColor = [UIColor whiteColor];
//        [_seps addObject:sep];
//        [self addSubview:sep];
    }
    //: [self selectTabIndex:0];
    [self vitaminPill:0];
}

//: - (void)onTouchTab:(id)sender{
- (void)viewFor:(id)sender{
    //: NSInteger index = [self.tabs indexOfObject:sender];
    NSInteger index = [self.tabs indexOfObject:sender];
    //: [self selectTabIndex:index];
    [self vitaminPill:index];
    //: if ([self.delegate respondsToSelector:@selector(tabView:didSelectTabIndex:)]) {
    if ([self.delegate respondsToSelector:@selector(event:bar:)]) {
        //: [self.delegate tabView:self didSelectTabIndex:index];
        [self.delegate event:self bar:index];
    }
}


//: - (void)selectTabIndex:(NSInteger)index{
- (void)vitaminPill:(NSInteger)index{
    //: for (NSInteger i = 0; i < self.tabs.count ; i++) {
    for (NSInteger i = 0; i < self.tabs.count ; i++) {
        //: UIButton *btn = self.tabs[i];
        UIButton *btn = self.tabs[i];
        //: btn.layer.borderWidth = 0;
        btn.layer.borderWidth = 0;
        //: btn.selected = i == index;
        btn.selected = i == index;
        //: if(btn.selected){
        if(btn.selected){
            //: btn.layer.borderWidth = 1.5;
            btn.layer.borderWidth = 1.5;
            //: btn.layer.borderColor = [UIColor colorWithHexString:@"#2BBCFB"].CGColor;
            btn.layer.borderColor = [UIColor direction:StringFromWayData(&str_achingVetValue)].CGColor;
        }
    }
}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: CGFloat spacing = 10;
    CGFloat spacing = 10;
    //: CGFloat left = spacing;
    CGFloat left = spacing;
    //: for (NSInteger index = 0; index < self.tabs.count ; index++) {
    for (NSInteger index = 0; index < self.tabs.count ; index++) {
        //: UIButton *button = self.tabs[index];
        UIButton *button = self.tabs[index];
        //: button.nim_width = NIMInputEmoticonSendButtonWidth;
        button.nim_width = k_backgroundText;
        //: button.nim_height = AAAInputEmoticonTabViewHeight;
        button.nim_height = k_timeText;
        //: button.nim_left = left;
        button.nim_left = left;
        //: button.nim_centerY = self.nim_height * .5f;
        button.nim_centerY = self.nim_height * .5f;

        //: left = (int)(button.nim_right + spacing);
        left = (int)(button.nim_right + spacing);

//        UIView *sep = self.seps[index];
//        sep.nim_left = (int)(button.nim_right + spacing);
//        left = (int)(sep.nim_right + spacing);
    }
    //: _sendButton.nim_right = (int)self.nim_width;
    _sendButton.nim_right = (int)self.nim_width;
}


//: @end
@end

Byte *WayDataToByte(WayData *data) {
    if (data->attractLucky) return data->impossible;
    for (int i = 0; i < data->compartmentBet; i++) {
        data->impossible[i] ^= data->relax;
    }
    data->impossible[data->compartmentBet] = 0;
    data->attractLucky = true;
	if (data->compartmentBet >= 3) {
		data->evolutionaryCell = data->impossible[0];
		data->fesse = data->impossible[1];
		data->brotherRefugee = data->impossible[2];
	}
    return data->impossible;
}

NSString *StringFromWayData(WayData *data) {
    return [NSString stringWithUTF8String:(char *)WayDataToByte(data)];
}
