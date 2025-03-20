// __DEBUG__
// __CLOSE_PRINT__
//
//  MaxOnStatusAttachment.h
//  NIM
//
//  Created by amao on 7/2/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "NTESCustomAttachmentDefines.h"
#import "NTESCustomAttachmentDefines.h"

//: typedef NS_ENUM(NSInteger, CustomJanKenPonValue) {
typedef NS_ENUM(NSInteger, CustomJanKenPonValue) {
    //: CustomJanKenPonValueKen = 1,
    CustomJanKenPonValueKen = 1,//石头
    //: CustomJanKenPonValueJan = 2,
    CustomJanKenPonValueJan = 2,//剪子
    //: CustomJanKenPonValuePon = 3,
    CustomJanKenPonValuePon = 3,//布
//: };
};

//: @interface NTESJanKenPonAttachment : NSObject<NIMCustomAttachment,NTESCustomAttachmentInfo>
@interface MaxOnStatusAttachment : NSObject<NIMCustomAttachment,TingChild>

//: @property (nonatomic,assign) CustomJanKenPonValue value;
@property (nonatomic,assign) CustomJanKenPonValue value;

//: @property (nonatomic,strong) UIImage *showCoverImage;
@property (nonatomic,strong) UIImage *showCoverImage;

//: @end
@end