//
//  AAAContactSelectTabView.m
// AppleProjectKit
//
//  Created by chris on 15/9/15.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "AAAContactSelectTabView.h"
#import "AAAContactPickedView.h"
#import "UIViewNimKit.h"
#import "UIImage+AppleProjectKit.h"
#import "CCCGlobalMacro.h"
#import "AppleProjectKit.h"

@implementation AAAContactSelectTabView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _pickedView = [[AAAContactPickedView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        [self addSubview:_pickedView];
        
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *doneButtonNormal      = [UIImage grayImageWithName:@"icon_cell_blue_normal" color:RGB_COLOR_String(kCommonBGColor_All)];
        UIImage *doneButtonHighlighted = [UIImage grayImageWithName:@"icon_cell_blue_normal" color:RGB_COLOR_String(kCommonBGColor_All)];
        [_doneButton setBackgroundImage:doneButtonNormal forState:UIControlStateNormal];
        [_doneButton setBackgroundImage:doneButtonHighlighted forState:UIControlStateHighlighted];
        [_doneButton setTitle:LangKey(@"contact_tag_fragment_sure") forState:UIControlStateNormal];
        [_doneButton sizeToFit];
        _doneButton.nim_size = CGSizeMake(MAX(doneButtonNormal.size.width, _doneButton.nim_width + 12.0),
                                          doneButtonNormal.size.height);
        [self addSubview:_doneButton];
//        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"contact_bg"]];
        self.backgroundColor = RGB_COLOR_String(@"#D4F2FF");
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat spacing = 15.f;
    _pickedView.nim_height  = self.nim_height;
    _pickedView.nim_width   = self.nim_width - _doneButton.nim_width - spacing;
    CGFloat doneButtonRight = 15.f;
    _doneButton.nim_right   = self.nim_width - doneButtonRight;
    _doneButton.nim_centerY = self.nim_height * .5f;
}

@end
