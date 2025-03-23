//
//  AAAInputEmoticonTabView.m
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "AAAInputEmoticonTabView.h"
#import "AAAInputEmoticonManager.h"
#import "UIViewNimKit.h"
#import "UIImage+AppleProjectKit.h"
#import "CCCGlobalMacro.h"

const NSInteger AAAInputEmoticonTabViewHeight = 40;
const NSInteger NIMInputEmoticonSendButtonWidth = 48;

const CGFloat NIMInputLineBoarder = .5f;

@interface AAAInputEmoticonTabView()

@property (nonatomic,strong) NSMutableArray * tabs;

@property (nonatomic,strong) NSMutableArray * seps;

@end

#define sepColor NEEKIT_UIColorFromRGB(0x8A8E93)

@implementation AAAInputEmoticonTabView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectMake(0, 0, frame.size.width, AAAInputEmoticonTabViewHeight)];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
//        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"emoji_bar_bg"]];
        UIImageView *bg = [[UIImageView alloc]initWithFrame: self.bounds];
        bg.image = [UIImage imageNamed:@"emoji_bar_bg"];
        [self addSubview:bg];
        
        
        _tabs = [[NSMutableArray alloc] init];
        _seps = [[NSMutableArray alloc] init];
        
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendButton setImage:[UIImage imageNamed:@"emoji_delete"] forState:UIControlStateNormal];
//        [_sendButton setTitle:@"发送".nim_localized forState:UIControlStateNormal];
//        _sendButton.titleLabel.font = [UIFont systemFontOfSize:13.f];
//        [_sendButton setBackgroundColor:NEEKIT_UIColorFromRGB(0x0079FF)];
        
        _sendButton.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _sendButton.layer.cornerRadius = 10;
        _sendButton.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        _sendButton.layer.shadowOffset = CGSizeMake(0,1);
        _sendButton.layer.shadowOpacity = 1;
        _sendButton.layer.shadowRadius = 8;
        
        _sendButton.nim_height = AAAInputEmoticonTabViewHeight;
        _sendButton.nim_width = NIMInputEmoticonSendButtonWidth;
        [self addSubview:_sendButton];
        
//        self.layer.borderColor = sepColor.CGColor;
//        self.layer.borderWidth = NIMInputLineBoarder;
       
    }
    return self;
}


- (void)loadCatalogs:(NSArray*)emoticonCatalogs
{
    for (UIView *subView in [_tabs arrayByAddingObjectsFromArray:_seps]) {
        [subView removeFromSuperview];
    }
    [_tabs removeAllObjects];
    [_seps removeAllObjects];
    for (NIMInputEmoticonCatalog * catelog in emoticonCatalogs) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 48, 40);
        [button setImage:[UIImage nim_emoticonInKit:catelog.icon] forState:UIControlStateNormal];
        [button setImage:[UIImage nim_emoticonInKit:catelog.iconPressed] forState:UIControlStateHighlighted];
        [button setImage:[UIImage nim_emoticonInKit:catelog.iconPressed] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(onTouchTab:) forControlEvents:UIControlEventTouchUpInside];
        [button sizeToFit];
        [self addSubview:button];
        button.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        button.layer.cornerRadius = 10;
        button.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        button.layer.shadowOffset = CGSizeMake(0,1);
        button.layer.shadowOpacity = 1;
        button.layer.shadowRadius = 8;
 
        
        [_tabs addObject:button];
        
//        UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(0, 0, NIMInputLineBoarder, AAAInputEmoticonTabViewHeight)];
////        sep.backgroundColor = sepColor;
//        sep.backgroundColor = [UIColor whiteColor];
//        [_seps addObject:sep];
//        [self addSubview:sep];
    }
    [self selectTabIndex:0];
}

- (void)onTouchTab:(id)sender{
    NSInteger index = [self.tabs indexOfObject:sender];
    [self selectTabIndex:index];
    if ([self.delegate respondsToSelector:@selector(tabView:didSelectTabIndex:)]) {
        [self.delegate tabView:self didSelectTabIndex:index];
    }
}


- (void)selectTabIndex:(NSInteger)index{
    for (NSInteger i = 0; i < self.tabs.count ; i++) {
        UIButton *btn = self.tabs[i];
        btn.layer.borderWidth = 0;
        btn.selected = i == index;
        if(btn.selected){
            btn.layer.borderWidth = 1.5;
            btn.layer.borderColor = ThemeColor.CGColor;
        }
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat spacing = 10;
    CGFloat left    = spacing;
    for (NSInteger index = 0; index < self.tabs.count ; index++) {
        UIButton *button = self.tabs[index];
        button.nim_width = NIMInputEmoticonSendButtonWidth;
        button.nim_height = AAAInputEmoticonTabViewHeight;
        button.nim_left = left;
        button.nim_centerY = self.nim_height * .5f;
        
        left = (int)(button.nim_right + spacing);
        
//        UIView *sep = self.seps[index];
//        sep.nim_left = (int)(button.nim_right + spacing);
//        left = (int)(sep.nim_right + spacing);
    }
    _sendButton.nim_right = (int)self.nim_width;
}


@end

