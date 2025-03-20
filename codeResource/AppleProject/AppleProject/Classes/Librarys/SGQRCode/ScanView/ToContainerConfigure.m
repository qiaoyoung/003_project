
#import <Foundation/Foundation.h>

NSString *StringFromOnConsumeData(Byte *data);        


//: #24E8B9
Byte str_helloChemicalData[] = {33, 7, 35, 5, 114, 0, 15, 17, 34, 21, 31, 22, 62};


//: scan_scanline_wc
Byte str_axTitle[] = {82, 16, 5, 14, 189, 16, 170, 200, 91, 188, 192, 137, 76, 121, 110, 94, 92, 105, 90, 110, 94, 92, 105, 103, 100, 105, 96, 90, 114, 94, 141};

// __DEBUG__
// __CLOSE_PRINT__
//
//  KEKEProject
//  KEKEChat
//
//  Created by tyl.
//  Copyright © 2024 Ali. All rights reserved.
//

// __M_A_C_R_O__
//: #import "SGScanViewConfigure.h"
#import "ToContainerConfigure.h"

//: @implementation SGScanViewConfigure
@implementation ToContainerConfigure

//: - (instancetype)init {
- (instancetype)init {
    //: if (self = [super init]) {
    if (self = [super init]) {
//        _isShowBorder = NO;
        //: _isShowBorder = YES;
        _isShowBorder = YES;
    }
    //: return self;
    return self;
}

//: + (instancetype)configure {
+ (instancetype)misapply {
    //: return [[self alloc] init];
    return [[self alloc] init];
}

//: - (NSString *)scanline {
- (NSString *)scanline {
    //: if (!_scanline) {
    if (!_scanline) {
        //: return @"scan_scanline_wc";
        return StringFromOnConsumeData(str_axTitle);
    }
    //: return _scanline;
    return _scanline;
}

//: - (CGFloat)scanlineStep {
- (CGFloat)scanlineStep {
    //: if (!_scanlineStep) {
    if (!_scanlineStep) {
        //: return 3.5;
        return 3.5;
    }
    //: return _scanlineStep;
    return _scanlineStep;
}

//: - (UIColor *)color {
- (UIColor *)color {
    //: if (!_color) {
    if (!_color) {
        //: return [[UIColor blackColor] colorWithAlphaComponent:0.5];
        return [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    //: return _color;
    return _color;
}

//: - (UIColor *)borderColor {
- (UIColor *)borderColor {
    //: if (!_borderColor) {
    if (!_borderColor) {
        //: return [UIColor whiteColor];
        return [UIColor whiteColor];
    }
    //: return _borderColor;
    return _borderColor;
}

//: - (CGFloat)borderWidth {
- (CGFloat)borderWidth {
    //: if (!_borderWidth) {
    if (!_borderWidth) {
        //: return 0.2;
        return 0.2;
    }
    //: return _borderWidth;
    return _borderWidth;
}

//: - (SGCornerLoaction)cornerLocation {
- (SGCornerLoaction)cornerLocation {
    //: if (!_cornerLocation) {
    if (!_cornerLocation) {
        //: return SGCornerLoactionDefault;
        return SGCornerLoactionDefault;
    }
    //: return _cornerLocation;
    return _cornerLocation;
}

//: - (UIColor *)cornerColor {
- (UIColor *)cornerColor {
    //: if (!_cornerColor) {
    if (!_cornerColor) {
//        _cornerColor = [UIColor greenColor];
        //: _cornerColor = [UIColor colorWithHexString:@"#24E8B9"];
        _cornerColor = [UIColor direction:StringFromOnConsumeData(str_helloChemicalData)];
    }
    //: return _cornerColor;
    return _cornerColor;
}

//: - (CGFloat)cornerWidth {
- (CGFloat)cornerWidth {
    //: if (!_cornerWidth) {
    if (!_cornerWidth) {
        //: return 2.0;
        return 2.0;
    }
    //: return _cornerWidth;
    return _cornerWidth;
}

//: - (CGFloat)cornerLength {
- (CGFloat)cornerLength {
    //: if (!_cornerLength) {
    if (!_cornerLength) {
//        return 20.0;
        //: return 40.0;
        return 40.0;
    }
    //: return _cornerLength;
    return _cornerLength;
}

//: @end
@end

Byte * OnConsumeDataToCache(Byte *data) {
    int customLab = data[0];
    int chemicalMissing = data[1];
    Byte cornerPasta = data[2];
    int favourite = data[3];
    if (!customLab) return data + favourite;
    for (int i = favourite; i < favourite + chemicalMissing; i++) {
        int value = data[i] + cornerPasta;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[favourite + chemicalMissing] = 0;
    return data + favourite;
}

NSString *StringFromOnConsumeData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)OnConsumeDataToCache(data)];
}
