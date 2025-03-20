// __DEBUG__
// __CLOSE_PRINT__
//
//  WithMin.m
// Indicator
//
//  Created by amao on 8/11/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBMediaItem.h"
#import "WithMin.h"

//: @implementation BBBMediaItem
@implementation WithMin

//: + (BBBMediaItem *)item:(NSString *)selector
+ (WithMin *)more:(NSString *)selector
           //: normalImage:(UIImage *)normalImage
           title:(UIImage *)normalImage
         //: selectedImage:(UIImage *)selectedImage
         back:(UIImage *)selectedImage
                 //: title:(NSString *)title
                 scheme:(NSString *)title
{
    //: BBBMediaItem *item = [[BBBMediaItem alloc] init];
    WithMin *item = [[WithMin alloc] init];
    //: item.selctor = NSSelectorFromString(selector);
    item.selctor = NSSelectorFromString(selector);
    //: item.normalImage = normalImage;
    item.normalImage = normalImage;
    //: item.selectedImage = selectedImage;
    item.selectedImage = selectedImage;
    //: item.title = title;
    item.title = title;
    //: return item;
    return item;
}

//: @end
@end