// __DEBUG__
// __CLOSE_PRINT__
//
//  NSData+Status.h
//  NIM
//
//  Created by amao on 7/2/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @interface NSData (NTES)
@interface NSData (Status)
//: - (NSString *)MD5String;
- (NSString *)view;

//: - (NSData *)aes256EncryptWithKey:(NSString *)key vector:(NSString *)vector;
- (NSData *)team:(NSString *)key with:(NSString *)vector;
//: - (NSData *)aes256DecryptWithKey:(NSString *)key vector:(NSString *)vector;
- (NSData *)nutsAndBoltsShow:(NSString *)key contentKey:(NSString *)vector;

//: - (NSData *)rc4EncryptWithKey:(NSString *)key;
- (NSData *)view:(NSString *)key;
//: - (NSData *)rc4DecryptWithKey:(NSString *)key;
- (NSData *)titleKey:(NSString *)key;

//: @end
@end