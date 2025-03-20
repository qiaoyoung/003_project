
#import <Foundation/Foundation.h>

NSString *StringFromDrivingData(Byte *data);        


//: Clear_color_image
Byte str_bottomPointText[] = {21, 17, 21, 6, 63, 147, 46, 87, 80, 76, 93, 74, 78, 90, 87, 90, 93, 74, 84, 88, 76, 82, 80, 153};

// __DEBUG__
// __CLOSE_PRINT__
//
//  UIImage+Color.m
//  yixin_iphone
//
//  Created by Xuhui on 14-3-17.
//  Copyright (c) 2014年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <sys/stat.h>
#import <sys/stat.h>
//: #import "UIImage+NTESColor.h"
#import "UIImage+ChemicalElement.h"

//: @interface UIColorCache : NSObject
@interface StatusHideInformation : NSObject
//: @property (nonatomic,strong) NSCache *colorImageCache;
@property (nonatomic,strong) NSCache *colorImageCache;
//: @end
@end

//: @implementation UIColorCache
@implementation StatusHideInformation
//: + (instancetype)sharedCache
+ (instancetype)cellSize
{
    //: static UIColorCache *instance = nil;
    static StatusHideInformation *instance = nil;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: instance = [[UIColorCache alloc] init];
        instance = [[StatusHideInformation alloc] init];
    //: });
    });
    //: return instance;
    return instance;
}

//: - (instancetype)init
- (instancetype)init
{
    //: if (self = [super init])
    if (self = [super init])
    {
        //: _colorImageCache = [[NSCache alloc] init];
        _colorImageCache = [[NSCache alloc] init];
    }
    //: return self;
    return self;
}

//: - (UIImage *)image:(UIColor *)color
- (UIImage *)dueDate:(UIColor *)color
{
    //: return color ? [_colorImageCache objectForKey:[color description]] : nil;
    return color ? [_colorImageCache objectForKey:[color description]] : nil;
}

//: - (void)setImage:(UIImage *)image
- (void)max:(UIImage *)image
        //: forColor:(UIColor *)color
        zarf:(UIColor *)color
{
    //: [_colorImageCache setObject:image
    [_colorImageCache setObject:image
                         //: forKey:[color description]];
                         forKey:[color description]];
}
//: @end
@end

//: @implementation UIImage (NTESColor)
@implementation UIImage (ChemicalElement)

//: + (UIImage *)clearColorImage {
+ (UIImage *)accountOrigin {
    //: return [UIImage imageNamed:@"Clear_color_image"];
    return [UIImage imageNamed:StringFromDrivingData(str_bottomPointText)];
}

//: + (UIImage *)imageWithColor:(UIColor *)color {
+ (UIImage *)backgroundEdge:(UIColor *)color {
    //: if (color == nil)
    if (color == nil)
    {
        //: assert(0);
        assert(0);
        //: return nil;
        return nil;
    }
    //: UIImage *image = [[UIColorCache sharedCache] image:color];
    UIImage *image = [[StatusHideInformation cellSize] dueDate:color];
    //: if (image == nil)
    if (image == nil)
    {
        //: CGFloat alphaChannel;
        CGFloat alphaChannel;
        //: [color getRed:NULL green:NULL blue:NULL alpha:&alphaChannel];
        [color getRed:NULL green:NULL blue:NULL alpha:&alphaChannel];
        //: BOOL opaqueImage = (alphaChannel == 1.0);
        BOOL opaqueImage = (alphaChannel == 1.0);
        //: CGRect rect = CGRectMake(0, 0, 1, 1);
        CGRect rect = CGRectMake(0, 0, 1, 1);
        //: UIGraphicsBeginImageContextWithOptions(rect.size, opaqueImage, [UIScreen mainScreen].scale);
        UIGraphicsBeginImageContextWithOptions(rect.size, opaqueImage, [UIScreen mainScreen].scale);
        //: [color setFill];
        [color setFill];
        //: UIRectFill(rect);
        UIRectFill(rect);
        //: image = UIGraphicsGetImageFromCurrentImageContext();
        image = UIGraphicsGetImageFromCurrentImageContext();
        //: UIGraphicsEndImageContext();
        UIGraphicsEndImageContext();
        //: [[UIColorCache sharedCache] setImage:image
        [[StatusHideInformation cellSize] max:image
                                    //: forColor:color];
                                    zarf:color];
    }
    //: return image;
    return image;
}


//: @end
@end

Byte * DrivingDataToCache(Byte *data) {
    int minimumEgret = data[0];
    int maturity = data[1];
    Byte heavy = data[2];
    int wasteLink = data[3];
    if (!minimumEgret) return data + wasteLink;
    for (int i = wasteLink; i < wasteLink + maturity; i++) {
        int value = data[i] + heavy;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[wasteLink + maturity] = 0;
    return data + wasteLink;
}

NSString *StringFromDrivingData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)DrivingDataToCache(data)];
}
