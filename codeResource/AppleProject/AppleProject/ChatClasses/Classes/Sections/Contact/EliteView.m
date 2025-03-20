
#import <Foundation/Foundation.h>

NSString *StringFromAccordingData(Byte *data);        


//: #A148FF
Byte str_shouldTitleName[] = {58, 7, 46, 11, 26, 138, 204, 68, 9, 147, 208, 245, 19, 3, 6, 10, 24, 24, 251};


//: icon_cell_blue_normal
Byte str_jazzName[] = {71, 21, 4, 10, 30, 28, 71, 164, 169, 196, 101, 95, 107, 106, 91, 95, 97, 104, 104, 91, 94, 104, 113, 97, 91, 106, 107, 110, 105, 93, 104, 157};


//: contact_tag_fragment_sure
Byte str_artisticData[] = {7, 25, 5, 7, 45, 247, 176, 94, 106, 105, 111, 92, 94, 111, 90, 111, 92, 98, 90, 97, 109, 92, 98, 104, 96, 105, 111, 90, 110, 112, 109, 96, 228};


//: #D4F2FF
Byte str_bandCombineName[] = {17, 7, 52, 10, 184, 20, 74, 187, 202, 122, 239, 16, 0, 18, 254, 18, 18, 126};

// __DEBUG__
// __CLOSE_PRINT__
//
//  EliteView.m
// Indicator
//
//  Created by chris on 15/9/15.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAContactSelectTabView.h"
#import "EliteView.h"
//: #import "AAAContactPickedView.h"
#import "TeamMarkView.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "CCCGlobalMacro.h"
#import "CCCGlobalMacro.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @implementation AAAContactSelectTabView
@implementation EliteView

//: - (instancetype)initWithFrame:(CGRect)frame{
- (instancetype)initWithFrame:(CGRect)frame{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: _pickedView = [[AAAContactPickedView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _pickedView = [[TeamMarkView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        //: [self addSubview:_pickedView];
        [self addSubview:_pickedView];

        //: _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //: UIImage *doneButtonNormal = [UIImage grayImageWithName:@"icon_cell_blue_normal" color:[UIColor colorWithHexString:@"#A148FF"]];
        UIImage *doneButtonNormal = [UIImage size:StringFromAccordingData(str_jazzName) withMargin:[UIColor direction:StringFromAccordingData(str_shouldTitleName)]];
        //: UIImage *doneButtonHighlighted = [UIImage grayImageWithName:@"icon_cell_blue_normal" color:[UIColor colorWithHexString:@"#A148FF"]];
        UIImage *doneButtonHighlighted = [UIImage size:StringFromAccordingData(str_jazzName) withMargin:[UIColor direction:StringFromAccordingData(str_shouldTitleName)]];
        //: [_doneButton setBackgroundImage:doneButtonNormal forState:UIControlStateNormal];
        [_doneButton setBackgroundImage:doneButtonNormal forState:UIControlStateNormal];
        //: [_doneButton setBackgroundImage:doneButtonHighlighted forState:UIControlStateHighlighted];
        [_doneButton setBackgroundImage:doneButtonHighlighted forState:UIControlStateHighlighted];
        //: [_doneButton setTitle:[NTESLanguageManager getTextWithKey:@"contact_tag_fragment_sure"] forState:UIControlStateNormal];
        [_doneButton setTitle:[MaxInformation off:StringFromAccordingData(str_artisticData)] forState:UIControlStateNormal];
        //: [_doneButton sizeToFit];
        [_doneButton sizeToFit];
        //: _doneButton.nim_size = CGSizeMake(((doneButtonNormal.size.width) > (_doneButton.nim_width + 12.0) ? (doneButtonNormal.size.width) : (_doneButton.nim_width + 12.0)),
        _doneButton.nim_size = CGSizeMake(((doneButtonNormal.size.width) > (_doneButton.nim_width + 12.0) ? (doneButtonNormal.size.width) : (_doneButton.nim_width + 12.0)),
                                          //: doneButtonNormal.size.height);
                                          doneButtonNormal.size.height);
        //: [self addSubview:_doneButton];
        [self addSubview:_doneButton];
//        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"contact_bg"]];
        //: self.backgroundColor = [UIColor colorWithHexString:@"#D4F2FF"];
        self.backgroundColor = [UIColor direction:StringFromAccordingData(str_bandCombineName)];
    }
    //: return self;
    return self;
}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: CGFloat spacing = 15.f;
    CGFloat spacing = 15.f;
    //: _pickedView.nim_height = self.nim_height;
    _pickedView.nim_height = self.nim_height;
    //: _pickedView.nim_width = self.nim_width - _doneButton.nim_width - spacing;
    _pickedView.nim_width = self.nim_width - _doneButton.nim_width - spacing;
    //: CGFloat doneButtonRight = 15.f;
    CGFloat doneButtonRight = 15.f;
    //: _doneButton.nim_right = self.nim_width - doneButtonRight;
    _doneButton.nim_right = self.nim_width - doneButtonRight;
    //: _doneButton.nim_centerY = self.nim_height * .5f;
    _doneButton.nim_centerY = self.nim_height * .5f;
}

//: @end
@end

Byte * AccordingDataToCache(Byte *data) {
    int bubble = data[0];
    int naturalness = data[1];
    Byte jive = data[2];
    int coinsurance = data[3];
    if (!bubble) return data + coinsurance;
    for (int i = coinsurance; i < coinsurance + naturalness; i++) {
        int value = data[i] + jive;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[coinsurance + naturalness] = 0;
    return data + coinsurance;
}

NSString *StringFromAccordingData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)AccordingDataToCache(data)];
}
