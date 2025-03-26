// __DEBUG__
// __CLOSE_PRINT__
//
//  LandPickerController.h
// Indicator
//
//  Created by Genning on 2020/9/25.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "TZImagePickerController.h"
#import "TZImagePickerController.h"
//: #import "CCCKitMediaPickerDelegate.h"
#import "OfTing.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface BBBKitMediaPickerController : TZImagePickerController
@interface LandPickerController : TZImagePickerController

//: - (instancetype)initWithMaxImagesCount:(NSInteger)maxImagesCount;
- (instancetype)initWithLight:(NSInteger)maxImagesCount;

//: @property (nonatomic, weak) id<CCCKitMediaPickerDelegate> nim_delegate;
@property (nonatomic, weak) id<OfTing> nim_delegate;

//: @property(nonatomic, strong) NSArray<NSString *> *mediaTypes;
@property(nonatomic, strong) NSArray<NSString *> *mediaTypes;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END