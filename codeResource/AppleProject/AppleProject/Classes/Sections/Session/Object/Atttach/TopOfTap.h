// __DEBUG__
// __CLOSE_PRINT__
//
//  SnapchatAttachment.h
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

//: @interface NTESSnapchatAttachment : NSObject<NIMCustomAttachment,NTESCustomAttachmentInfo>
@interface TopOfTap : NSObject<NIMCustomAttachment,TingChild>

//: @property (nonatomic,copy) NSString *md5;
@property (nonatomic,copy) NSString *md5;

//: @property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *url;

//: @property (nonatomic,assign) BOOL isFired; 
@property (nonatomic,assign) BOOL isFired; //是否焚毁

//: @property (nonatomic,strong) UIImage *showCoverImage;
@property (nonatomic,strong) UIImage *showCoverImage;

//: - (void)setImage:(UIImage *)image;
- (void)setOption:(UIImage *)image;

//: - (void)setImageFilePath:(NSString *)path;
- (void)setBelowMonth:(NSString *)path;

//: - (NSString *)filepath;
- (NSString *)eventFilepath;


//: @end
@end