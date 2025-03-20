//
//  KEKEProject
//  KEKEChat
//
//  Created by tyl.
//  Copyright © 2024 Ali. All rights reserved.
//
#import "SGScanViewConfigure.h"

@implementation SGScanViewConfigure

- (instancetype)init {
    if (self = [super init]) {
//        _isShowBorder = NO;
        _isShowBorder = YES;
    }
    return self;
}

+ (instancetype)configure {
    return [[self alloc] init];
}

- (NSString *)scanline {
    if (!_scanline) {
        return @"scan_scanline_wc";
    }
    return _scanline;
}

- (CGFloat)scanlineStep {
    if (!_scanlineStep) {
        return 3.5;
    }
    return _scanlineStep;
}

- (UIColor *)color {
    if (!_color) {
        return [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    return _color;
}

- (UIColor *)borderColor {
    if (!_borderColor) {
        return [UIColor whiteColor];
    }
    return _borderColor;
}

- (CGFloat)borderWidth {
    if (!_borderWidth) {
        return 0.2;
    }
    return _borderWidth;
}

- (SGCornerLoaction)cornerLocation {
    if (!_cornerLocation) {
        return SGCornerLoactionDefault;
    }
    return _cornerLocation;
}

- (UIColor *)cornerColor {
    if (!_cornerColor) {
//        _cornerColor = [UIColor greenColor];
        _cornerColor = RGB_COLOR_String(@"#24E8B9");
    }
    return _cornerColor;
}

- (CGFloat)cornerWidth {
    if (!_cornerWidth) {
        return 2.0;
    }
    return _cornerWidth;
}

- (CGFloat)cornerLength {
    if (!_cornerLength) {
//        return 20.0;
        return 40.0;
    }
    return _cornerLength;
}

@end
