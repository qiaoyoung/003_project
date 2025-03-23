// __DEBUG__
// __CLOSE_PRINT__
//
//  ViewTitleAttachment.h
//  NIM
//
//  Created by 田玉龙 on 2022/8/22.
//  Copyright © 2022 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "NTESCustomAttachmentDefines.h"
#import "NTESCustomAttachmentDefines.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESShareCardAttachment : NSObject<NIMCustomAttachment,NTESCustomAttachmentInfo>
@interface ViewTitleAttachment : NSObject<NIMCustomAttachment,TingChild>

//: @property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *title;

//: @property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *content;

//: @property (nonatomic, copy) NSString *personCardId;
@property (nonatomic, copy) NSString *personCardId;

//: @property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *type;


//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END