// __DEBUG__
// __CLOSE_PRINT__
//
//  NSData+Status.m
//  NIM
//
//  Created by amao on 7/2/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NSData+NTES.h"
#import "NSData+Status.h"
//: #import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonDigest.h>
//: #import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonCryptor.h>

//: @implementation NSData (NTES)
@implementation NSData (Status)

//: - (NSString *)MD5String {
- (NSString *)view {
    //: const char *cstr = [self bytes];
    const char *cstr = [self bytes];
    //: unsigned char result[16];
    unsigned char result[16];
    //: CC_MD5(cstr, (CC_LONG)[self length], result);
    CC_MD5(cstr, (CC_LONG)[self length], result);
    //: return [NSString stringWithFormat:
    return [NSString stringWithFormat:
            //: @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            //: result[0], result[1], result[2], result[3],
            result[0], result[1], result[2], result[3],
            //: result[4], result[5], result[6], result[7],
            result[4], result[5], result[6], result[7],
            //: result[8], result[9], result[10], result[11],
            result[8], result[9], result[10], result[11],
            //: result[12], result[13], result[14], result[15]
            result[12], result[13], result[14], result[15]
            //: ];
            ];
}

//: - (NSData *)aes256EncryptWithKey:(NSString *)key vector:(NSString *)vector {
- (NSData *)team:(NSString *)key with:(NSString *)vector {
    // 'key' should be 32 bytes for AES256, will be null-padded otherwise
    //: assert(key.length == 32);
    assert(key.length == 32);
    //: char keyPtr[kCCKeySizeAES256 + 1];
    char keyPtr[kCCKeySizeAES256 + 1];
    //: bzero(keyPtr, sizeof(keyPtr));
    bzero(keyPtr, sizeof(keyPtr));
    //: assert(vector.length == 16);
    assert(vector.length == 16);
    //: char ivPtr[kCCKeySizeAES128 + 1];
    char ivPtr[kCCKeySizeAES128 + 1];
    //: bzero(ivPtr, sizeof(vector));
    bzero(ivPtr, sizeof(vector));

    //: [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    //: [vector getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    [vector getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];

    //
    //: NSUInteger dataLength = self.length;
    NSUInteger dataLength = self.length;
    //: size_t bufferSize = dataLength + kCCBlockSizeAES128;
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    //: void *buffer = malloc(bufferSize);
    void *buffer = malloc(bufferSize);

    //: size_t numBytesEncrypted = 0;
    size_t numBytesEncrypted = 0;
    //: CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES, kCCOptionPKCS7Padding,
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES, kCCOptionPKCS7Padding,
                                          //: keyPtr, kCCKeySizeAES256,
                                          keyPtr, kCCKeySizeAES256,
                                          //: ivPtr /|* initialization vector (optional) *|/,
                                          ivPtr /* initialization vector (optional) */,
                                          //: self.bytes, dataLength, /|* input *|/
                                          self.bytes, dataLength, /* input */
                                          //: buffer, bufferSize, /|* output *|/
                                          buffer, bufferSize, /* output */
                                          //: &numBytesEncrypted);
                                          &numBytesEncrypted);
    //: if (cryptStatus == kCCSuccess) {
    if (cryptStatus == kCCSuccess) {
        //: return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }

    //: free(buffer);
    free(buffer);
    //: return nil;
    return nil;
}

//: - (NSData *)aes256DecryptWithKey:(NSString *)key vector:(NSString *)vector {
- (NSData *)nutsAndBoltsShow:(NSString *)key contentKey:(NSString *)vector {
    // 'key' should be 32 bytes for AES256, will be null-padded otherwise
    //: assert(key.length == 32);
    assert(key.length == 32);
    //: char keyPtr[kCCKeySizeAES256 + 1];
    char keyPtr[kCCKeySizeAES256 + 1];
    //: bzero(keyPtr, sizeof(keyPtr));
    bzero(keyPtr, sizeof(keyPtr));
    //: assert(vector.length == 16);
    assert(vector.length == 16);
    //: char ivPtr[kCCKeySizeAES128 + 1];
    char ivPtr[kCCKeySizeAES128 + 1];
    //: bzero(ivPtr, sizeof(vector));
    bzero(ivPtr, sizeof(vector));

    //: [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    //: [vector getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    [vector getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];

    //
    //: NSUInteger dataLength = self.length;
    NSUInteger dataLength = self.length;
    //: size_t bufferSize = dataLength + kCCBlockSizeAES128;
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    //: void *buffer = malloc(bufferSize);
    void *buffer = malloc(bufferSize);

    //: size_t numBytesDecrypted = 0;
    size_t numBytesDecrypted = 0;
    //: CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES, kCCOptionPKCS7Padding,
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES, kCCOptionPKCS7Padding,
                                          //: keyPtr, kCCKeySizeAES256,
                                          keyPtr, kCCKeySizeAES256,
                                          //: ivPtr /|* initialization vector (optional) *|/,
                                          ivPtr /* initialization vector (optional) */,
                                          //: self.bytes, dataLength, /|* input *|/
                                          self.bytes, dataLength, /* input */
                                          //: buffer, bufferSize, /|* output *|/
                                          buffer, bufferSize, /* output */
                                          //: &numBytesDecrypted);
                                          &numBytesDecrypted);

    //: if (cryptStatus == kCCSuccess) {
    if (cryptStatus == kCCSuccess) {
        //: return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }

    //: free(buffer);
    free(buffer);
    //: return nil;
    return nil;
}
//: void _NTES_RC4(const char *key, int keylen, char* output, const char* input, int len)
void _NTES_RC4(const char *key, int keylen, char* output, const char* input, int len)
{
    // 设置密钥
    //: char key_[256];
    char key_[256];
    //: memset(key_, 0, 256);
    memset(key_, 0, 256);
    //: for (int i = 0; i < 256; i++)
    for (int i = 0; i < 256; i++)
    {
        //: key_[i] = i;
        key_[i] = i;
    }
    //: int j = 0;
    int j = 0;
    //: for (int i = 0; i < 256; i++)
    for (int i = 0; i < 256; i++)
    {
        //: j = (j + key_[i] + key[i%keylen]) & 0xff; 
        j = (j + key_[i] + key[i%keylen]) & 0xff; // (j + key_[i] + key[i%keylen]) % 256;
        //: { char tmp = key_[i]; key_[i] = key_[j]; key_[j] = tmp; };
        { char tmp = key_[i]; key_[i] = key_[j]; key_[j] = tmp; };
    }
    // 加/解密
    //: int i = 0;
    int i = 0;
    //: j = 0;
    j = 0;
    //: for (int k = 0; k < len; k++)
    for (int k = 0; k < len; k++)
    {
        //: i = (i+1) & 0xff; 
        i = (i+1) & 0xff; // (i + 1) % 256;
        //: j = (j + key_[i]) & 0xff; 
        j = (j + key_[i]) & 0xff; // (j + key_[i]) % 256;
        //: { char tmp = key_[i]; key_[i] = key_[j]; key_[j] = tmp; };
        { char tmp = key_[i]; key_[i] = key_[j]; key_[j] = tmp; };
        //: unsigned char subkey = key_[(key_[i] + key_[j]) & 0xff]; 
        unsigned char subkey = key_[(key_[i] + key_[j]) & 0xff]; // key_[(key_[i] + key_[j]) % 256];
        //: output[k] = subkey ^ input[k];
        output[k] = subkey ^ input[k];
    }

    //: return;
    return;
}

//: - (NSData *)rc4EncryptWithKey:(NSString *)key {
- (NSData *)view:(NSString *)key {
    //: const char *pwd = [key UTF8String];
    const char *pwd = [key UTF8String];
    //: char *outdata = (char *)calloc(self.length, 1);
    char *outdata = (char *)calloc(self.length, 1);
    //: _NTES_RC4(pwd, (int)key.length, outdata, self.bytes, (int)self.length);
    _NTES_RC4(pwd, (int)key.length, outdata, self.bytes, (int)self.length);
    //: NSData *ret = [NSMutableData dataWithBytes:outdata length:self.length];
    NSData *ret = [NSMutableData dataWithBytes:outdata length:self.length];
    //: free(outdata);
    free(outdata);
    //: return ret;
    return ret;
}

//: - (NSData *)rc4DecryptWithKey:(NSString *)key {
- (NSData *)titleKey:(NSString *)key {
     //: const char *pwd = [key UTF8String];
     const char *pwd = [key UTF8String];
     //: char *outdata = (char *)calloc(self.length + 1, 1);
     char *outdata = (char *)calloc(self.length + 1, 1);
     //: _NTES_RC4(pwd, (int)key.length, outdata, self.bytes, (int)self.length);
     _NTES_RC4(pwd, (int)key.length, outdata, self.bytes, (int)self.length);
     //: outdata[self.length] = 0;
     outdata[self.length] = 0;
     //: NSData *ret = [NSMutableData dataWithBytes:outdata length:self.length];
     NSData *ret = [NSMutableData dataWithBytes:outdata length:self.length];
     //: free(outdata);
     free(outdata);
     //: return ret;}
     return ret;}

//: @end
@end