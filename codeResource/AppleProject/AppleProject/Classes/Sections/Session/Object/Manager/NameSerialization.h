// __DEBUG__
// __CLOSE_PRINT__
//
//  NameSerialization.h
//  NIM
//
//  Created by Netease on 2019/10/16.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @class NTESMessageSerializationInfo;
@class ContentState;

//: typedef void(^NTESMessageEncodeResult)(NSError * _Nullable error, NTESMessageSerializationInfo * _Nullable info);
typedef void(^NTESMessageEncodeResult)(NSError * _Nullable error, ContentState * _Nullable info);
//: typedef void(^NTESMessageDecodeResult)(NSError * _Nullable error, NSMutableArray<NIMMessage *> * _Nullable messages);
typedef void(^NTESMessageDecodeResult)(NSError * _Nullable error, NSMutableArray<NIMMessage *> * _Nullable messages);

//: @interface NTESMessageSerialization : NSObject
@interface NameSerialization : NSObject

//: - (void)encode:(NSArray <NIMMessage *>*)messages
- (void)circleEncrypt:(NSArray <NIMMessage *>*)messages
       //: encrypt:(BOOL)encrypt
       container:(BOOL)encrypt
      //: password:(NSString *)password
      listener:(NSString *)password
    //: completion:(NTESMessageEncodeResult)completion;
    interval:(NTESMessageEncodeResult)completion;

//: - (void)decode:(NSString *)filePath
- (void)message:(NSString *)filePath
       //: encrypt:(BOOL)encrypt
       pin:(BOOL)encrypt
      //: password:(NSString *)password
      max:(NSString *)password
    //: completion:(NTESMessageDecodeResult)completion;
    dateTool:(NTESMessageDecodeResult)completion;

//: @end
@end

//: @interface NTESMessageSerializationInfo : NSObject
@interface ContentState : NSObject

//: @property (nonatomic, copy) NSString *filePath;
@property (nonatomic, copy) NSString *filePath;

//: @property (nonatomic, copy) NSString *md5;
@property (nonatomic, copy) NSString *md5;

//: @property (nonatomic, assign) BOOL encrypted;
@property (nonatomic, assign) BOOL encrypted;

//: @property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *password;

//: @property (nonatomic, assign) BOOL compressed;
@property (nonatomic, assign) BOOL compressed;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END