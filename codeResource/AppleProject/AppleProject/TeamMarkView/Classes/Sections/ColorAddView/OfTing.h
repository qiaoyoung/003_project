// __DEBUG__
// __CLOSE_PRINT__
//
//  OfTing.h
// Indicator
//
//  Created by Genning on 2020/9/25.
//  Copyright © 2020 NetEase. All rights reserved.
//
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

// __M_A_C_R_O__

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @protocol CCCKitMediaPickerDelegate <NSObject>
@protocol OfTing <NSObject>

//: - (void)onPickerSelectedWithType:(PHAssetMediaType)type
- (void)beggarMyNeighborPolicy:(PHAssetMediaType)type
                          //: images:(nullable NSArray *)images
                          iconArray:(nullable NSArray *)images
                            //: path:(nullable NSString *)path;
                            valueTing:(nullable NSString *)path;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END