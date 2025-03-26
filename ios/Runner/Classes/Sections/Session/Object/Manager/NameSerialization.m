
#import <Foundation/Foundation.h>

NSString *StringFromProviderData(Byte *data);


//: .txt
Byte str_comingKeyContent[] = {19, 4, 13, 53, 60, 72, 128, 99, 131, 61, 255, 138, 107, 116, 120, 116, 46, 56};


//: ntes.message.serialization
Byte str_immuneBlocName[] = {73, 26, 5, 242, 86, 110, 111, 105, 116, 97, 122, 105, 108, 97, 105, 114, 101, 115, 46, 101, 103, 97, 115, 115, 101, 109, 46, 115, 101, 116, 110, 155};


//: YYYYMMddhhmmssSSS
Byte str_statusShowContent[] = {67, 17, 6, 132, 69, 136, 83, 83, 83, 115, 115, 109, 109, 104, 104, 100, 100, 77, 77, 89, 89, 89, 89, 116};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NameSerialization.m
//  NIM
//
//  Created by Netease on 2019/10/16.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESMessageSerialization.h"
#import "NameSerialization.h"
//: #import "NTESFileLocationHelper.h"
#import "BubbleMaxContainer.h"
//: #import "NTESFileUtil.h"
#import "RegisterTop.h"
//: #import "NTESMigrateHeader.h"
#import "UpAt.h"
//: #import "NSData+NTES.h"
#import "NSData+Status.h"

//: static dispatch_queue_t NTESMessageSerializationQueue()
static dispatch_queue_t NTESMessageSerializationQueue()
{
    //: static dispatch_queue_t queue;
    static dispatch_queue_t queue;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: queue = dispatch_queue_create("nim.demo.message.serialization.queue", 0);
        queue = dispatch_queue_create("nim.demo.message.serialization.queue", 0);
    //: });
    });
    //: return queue;
    return queue;
}

//: @interface NTESMessageSerialization ()
@interface NameSerialization ()

//: @property (nonatomic, copy) NSString *targetFile;
@property (nonatomic, copy) NSString *targetFile;

//: @end
@end


//: @implementation NTESMessageSerialization
@implementation NameSerialization

//: - (void)encode:(NSArray <NIMMessage *>*)messages
- (void)circleEncrypt:(NSArray <NIMMessage *>*)messages
       //: encrypt:(BOOL)encrypt
       container:(BOOL)encrypt
      //: password:(NSString *)password
      listener:(NSString *)password
    //: completion:(NTESMessageEncodeResult)completion {
    interval:(NTESMessageEncodeResult)completion {

    //: dispatch_async(NTESMessageSerializationQueue(), ^{
    dispatch_async(NTESMessageSerializationQueue(), ^{
        //: NSMutableArray *datas = [NSMutableArray array];
        NSMutableArray *datas = [NSMutableArray array];
        //: __block NSError *error = nil;
        __block NSError *error = nil;

        //header
        //: NSData *headerRowData = [self fileHeaderWithCount:messages.count];
        NSData *headerRowData = [self concealed:messages.count];

        //: if (!headerRowData) {
        if (!headerRowData) {
            //: dispatch_async(dispatch_get_main_queue(), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                //: error = [NSError errorWithDomain:@"ntes.message.serialization" code:1000 userInfo:nil];
                error = [NSError errorWithDomain:StringFromProviderData(str_immuneBlocName) code:1000 userInfo:nil];
                //: if (completion) {
                if (completion) {
                    //: completion(error, nil);
                    completion(error, nil);
                }
            //: });
            });
            //: return;
            return;
        }
        //: [datas addObject:headerRowData];
        [datas addObject:headerRowData];

        //message
        //: NSArray *messageRowData = [self messageRowData:messages];
        NSArray *messageRowData = [self mailMessageAssemblage:messages];
        //: if (messageRowData.count == 0) {
        if (messageRowData.count == 0) {
            //: dispatch_async(dispatch_get_main_queue(), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                //: error = [NSError errorWithDomain:@"ntes.message.serialization" code:1001 userInfo:nil];
                error = [NSError errorWithDomain:StringFromProviderData(str_immuneBlocName) code:1001 userInfo:nil];
                //: if (completion) {
                if (completion) {
                    //: completion(error, nil);
                    completion(error, nil);
                }
            //: });
            });
            //: return;
            return;
        }
        //: [datas addObjectsFromArray:messageRowData];
        [datas addObjectsFromArray:messageRowData];

        //write
        //: NSString *file = [self writeRowDatasToFile:datas encrypt:encrypt password:password];
        NSString *file = [self size:datas tip:encrypt start:password];
        //: if (file == nil) {
        if (file == nil) {
            //: error = [NSError errorWithDomain:@"ntes.message.serialization" code:1002 userInfo:nil];
            error = [NSError errorWithDomain:StringFromProviderData(str_immuneBlocName) code:1002 userInfo:nil];
            //: dispatch_async(dispatch_get_main_queue(), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                //: if (completion) {
                if (completion) {
                    //: completion(error, nil);
                    completion(error, nil);
                }
            //: });
            });
            //: return;
            return;
        }

        //md5
        //: NSString *md5 = [NTESFileUtil fileMD5:file];
        NSString *md5 = [RegisterTop upMember:file];
        //: if (!md5) {
        if (!md5) {
            //delete
            //: [[NSFileManager defaultManager] removeItemAtPath:file error:nil];
            [[NSFileManager defaultManager] removeItemAtPath:file error:nil];

            //error
            //: error = [NSError errorWithDomain:@"ntes.message.serialization" code:1003 userInfo:nil];
            error = [NSError errorWithDomain:StringFromProviderData(str_immuneBlocName) code:1003 userInfo:nil];
            //: dispatch_async(dispatch_get_main_queue(), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                //: if (completion) {
                if (completion) {
                    //: completion(error, nil);
                    completion(error, nil);
                }
            //: });
            });
            //: return;
            return;
        }

        //callback
        //: NTESMessageSerializationInfo *info = [[NTESMessageSerializationInfo alloc] init];
        ContentState *info = [[ContentState alloc] init];
        //: info.filePath = file;
        info.filePath = file;
        //: info.md5 = md5;
        info.md5 = md5;
        //: info.encrypted = YES;
        info.encrypted = YES;
        //: info.password = password;
        info.password = password;
        //: dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            //: if (completion) {
            if (completion) {
                //: completion(error, info);
                completion(error, info);
            }
        //: });
        });
    //: });
    });

}

//: - (void)decode:(NSString *)filePath
- (void)message:(NSString *)filePath
       //: encrypt:(BOOL)encrypt
       pin:(BOOL)encrypt
      //: password:(NSString *)password
      max:(NSString *)password
    //: completion:(NTESMessageDecodeResult)completion {
    dateTool:(NTESMessageDecodeResult)completion {
    //: dispatch_async(NTESMessageSerializationQueue(), ^{
    dispatch_async(NTESMessageSerializationQueue(), ^{
        //: NSError *error = nil;
        NSError *error = nil;

        //: NSMutableArray *ret = [self readRowDatasFromFile:filePath encrypt:encrypt password:password];
        NSMutableArray *ret = [self of:filePath key:encrypt with:password];
        //: if (!ret) {
        if (!ret) {
            //: error = [NSError errorWithDomain:@"ntes.message.serialization" code:1003 userInfo:nil];
            error = [NSError errorWithDomain:StringFromProviderData(str_immuneBlocName) code:1003 userInfo:nil];
        }
        //: dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            //: if (completion) {
            if (completion) {
                //: completion(error, ret);
                completion(error, ret);
            }
        //: });
        });
    //: });
    });
}

//: #pragma mark - Export
#pragma mark - Export
//: - (NSString *)targetFile {
- (NSString *)targetFile {
    //: NSDate * date = [[NSDate alloc] init];
    NSDate * date = [[NSDate alloc] init];
    //: NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //: formatter.dateFormat = @"YYYYMMddhhmmssSSS";
    formatter.dateFormat = StringFromProviderData(str_statusShowContent);
    //: NSString *fileName = [[formatter stringFromDate:date] stringByAppendingString:@".txt"];
    NSString *fileName = [[formatter stringFromDate:date] stringByAppendingString:StringFromProviderData(str_comingKeyContent)];
    //: return [NTESFileLocationHelper filepathForMergeForwardFile:fileName];
    return [BubbleMaxContainer date:fileName];
}

//: - (NSData *)fileHeaderWithCount:(NSInteger)count {
- (NSData *)concealed:(NSInteger)count {
    //: NTESMigrateHeader *header = [NTESMigrateHeader initWithDefaultConfig];
    UpAt *header = [UpAt initWithDefault];
    //: header.totalInfoCount = count;
    header.totalInfoCount = count;
    //: return [header toRawContent];
    return [header name];
}

//: - (NSMutableArray <NSData *>*)messageRowData:(NSArray <NIMMessage *>*)messages {
- (NSMutableArray <NSData *>*)mailMessageAssemblage:(NSArray <NIMMessage *>*)messages {
    //: NSMutableArray *ret = [NSMutableArray array];
    NSMutableArray *ret = [NSMutableArray array];
    //: [messages enumerateObjectsUsingBlock:^(NIMMessage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    [messages enumerateObjectsUsingBlock:^(NIMMessage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //: NSData *data = [[NIMSDK sharedSDK].conversationManager encodeMessageToData:obj];
        NSData *data = [[NIMSDK sharedSDK].conversationManager encodeMessageToData:obj];
        //: if (data) {
        if (data) {
            //: [ret addObject:data];
            [ret addObject:data];
        }
    //: }];
    }];
    //: return ret;
    return ret;
}

//: - (NSString *)writeRowDatasToFile:(NSMutableArray *)datas
- (NSString *)size:(NSMutableArray *)datas
                          //: encrypt:(BOOL)encrypt
                          tip:(BOOL)encrypt
                         //: password:(NSString *)password {
                         start:(NSString *)password {
    //: NSString *filePath = [self targetFile];
    NSString *filePath = [self targetFile];
    //: FILE *fp = fopen([filePath UTF8String], "wb");
    FILE *fp = fopen([filePath UTF8String], "wb");
    //: if (!fp) {
    if (!fp) {
        //: return nil;
        return nil;
    }
    //: NSMutableData *temp = [NSMutableData data];
    NSMutableData *temp = [NSMutableData data];
    //: NSString *newlineStr = @"\n";
    NSString *newlineStr = @"\n";
    //: NSData *newline = [newlineStr dataUsingEncoding:NSUTF8StringEncoding];
    NSData *newline = [newlineStr dataUsingEncoding:NSUTF8StringEncoding];
    //: [datas enumerateObjectsUsingBlock:^(NSData *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    [datas enumerateObjectsUsingBlock:^(NSData *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //: [temp appendData:obj];
        [temp appendData:obj];
        //: [temp appendData:newline];
        [temp appendData:newline];
    //: }];
    }];

    //: if (temp.length != 0) {
    if (temp.length != 0) {
        //: if (encrypt) {
        if (encrypt) {
            //: NSData *encryptData = [temp rc4EncryptWithKey:password];
            NSData *encryptData = [temp view:password];
            //: fwrite(encryptData.bytes, 1, encryptData.length, fp);
            fwrite(encryptData.bytes, 1, encryptData.length, fp);
        //: } else {
        } else {
            //: fwrite(temp.bytes, 1, temp.length, fp);
            fwrite(temp.bytes, 1, temp.length, fp);
        }
        //: [temp resetBytesInRange:NSMakeRange(0, temp.length)];
        [temp resetBytesInRange:NSMakeRange(0, temp.length)];
        //: [temp setLength:0];
        [temp setLength:0];
    }

    //: fclose(fp);
    fclose(fp);
    //: return filePath;
    return filePath;
}

//: #pragma mark - Import
#pragma mark - Import
//: - (NSString *)readFileString:(NSString *)file
- (NSString *)voiceAcross:(NSString *)file
                     //: encrypt:(BOOL)encrypt
                     fromIn:(BOOL)encrypt
                    //: password:(NSString *)password{
                    markPassword:(NSString *)password{
    //: FILE *fp = NULL;
    FILE *fp = NULL;
    //: char szBlock[1024*100] = {0};
    char szBlock[1024*100] = {0};
    //: size_t len = 0;
    size_t len = 0;
    //: NSMutableString *ret = [NSMutableString string];
    NSMutableString *ret = [NSMutableString string];

    //: fp = fopen(file.UTF8String, "r");
    fp = fopen(file.UTF8String, "r");
    //: if (fp == NULL) {
    if (fp == NULL) {
        //: return nil;
        return nil;
    }

    //: while (!feof(fp)) {
    while (!feof(fp)) {
        //: len = fread(szBlock, 1, sizeof(szBlock), fp);
        len = fread(szBlock, 1, sizeof(szBlock), fp);
        //: NSData *fileData = [NSData dataWithBytes:szBlock length:len];
        NSData *fileData = [NSData dataWithBytes:szBlock length:len];
        //: if (encrypt) {
        if (encrypt) {
            //: NSData *decryptData = [fileData rc4DecryptWithKey:password];
            NSData *decryptData = [fileData titleKey:password];
            //: NSString *decryptStr = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
            NSString *decryptStr = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
            //: if (decryptStr) {
            if (decryptStr) {
                //: [ret appendString:decryptStr];
                [ret appendString:decryptStr];
            }
        //: } else {
        } else {
            //: NSString *fileStr = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
            NSString *fileStr = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
            //: if (fileStr) {
            if (fileStr) {
                //: [ret appendString:fileStr];
                [ret appendString:fileStr];
            }
        }
    }

    //: fclose(fp);
    fclose(fp);
    //: return ret;
    return ret;
}


//: - (NSMutableArray <NIMMessage *>*)readRowDatasFromFile:(NSString *)file
- (NSMutableArray <NIMMessage *>*)of:(NSString *)file
                                               //: encrypt:(BOOL)encrypt
                                               key:(BOOL)encrypt
                                              //: password:(NSString *)password {
                                              with:(NSString *)password {

    //: NSMutableArray *ret = nil;
    NSMutableArray *ret = nil;
    //: NSString *fileString = [self readFileString:file encrypt:encrypt password:password];
    NSString *fileString = [self voiceAcross:file fromIn:encrypt markPassword:password];
    //: NSArray *subStrings = [fileString componentsSeparatedByString:@"\n"];
    NSArray *subStrings = [fileString componentsSeparatedByString:@"\n"];
    //: NTESMigrateHeader *header = nil;
    UpAt *header = nil;
    //: NSInteger count = 0;
    NSInteger count = 0;
    //: if (subStrings.count == 0) {
    if (subStrings.count == 0) {
        //: return ret;
        return ret;
    }

    //: for (int i = 0; i < subStrings.count; i++) {
    for (int i = 0; i < subStrings.count; i++) {
        //: NSString *jsonString = subStrings[i];
        NSString *jsonString = subStrings[i];
        //: if (i == 0) {
        if (i == 0) {
            //: NSData *headerData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            NSData *headerData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            //: header = [NTESMigrateHeader initWithRawContent:headerData];
            header = [UpAt initWithAtShow:headerData];
            //: if (header == nil) {
            if (header == nil) {
                //: break;
                break;
            }
        //: } else {
        } else {
            //: if (count++ == header.totalInfoCount) {
            if (count++ == header.totalInfoCount) {
                //: break;
                break;
            }
            //: if (!ret) {
            if (!ret) {
                //: ret = [NSMutableArray array];
                ret = [NSMutableArray array];
            }
            //: NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            //: NIMMessage *message = [[NIMSDK sharedSDK].conversationManager decodeMessageFromData:data];
            NIMMessage *message = [[NIMSDK sharedSDK].conversationManager decodeMessageFromData:data];
            //: if (message) {
            if (message) {
                //: [ret addObject:message];
                [ret addObject:message];
            }
        }
    }
    //: return ret;
    return ret;
}

//: @end
@end


//: @implementation NTESMessageSerializationInfo
@implementation ContentState

//: @end
@end

Byte * ProviderDataToCache(Byte *data) {
    int coming = data[0];
    int yield = data[1];
    int valueDoing = data[2];
    if (!coming) return data + valueDoing;
    for (int i = 0; i < yield / 2; i++) {
        int begin = valueDoing + i;
        int end = valueDoing + yield - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[valueDoing + yield] = 0;
    return data + valueDoing;
}

NSString *StringFromProviderData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ProviderDataToCache(data)];
}  
