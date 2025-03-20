
#import <Foundation/Foundation.h>

NSString *StringFromWorthyData(Byte *data);


//: url
Byte str_yardName[] = {92, 3, 25, 4, 142, 139, 133, 34};


//: fileName
Byte str_refugeeImageContent[] = {22, 8, 60, 7, 157, 16, 105, 162, 165, 168, 161, 138, 157, 169, 161, 191};


//: sessionName
Byte str_marbleValue[] = {1, 11, 93, 12, 223, 142, 68, 52, 63, 255, 59, 31, 208, 194, 208, 208, 198, 204, 203, 171, 190, 202, 194, 16};


//: type
Byte str_concerningSchemeData[] = {73, 4, 81, 14, 188, 147, 201, 238, 203, 45, 159, 94, 38, 94, 197, 202, 193, 182, 6};


//: md5
Byte str_attendanceRecordText[] = {70, 3, 12, 14, 196, 91, 20, 56, 242, 209, 135, 238, 160, 175, 121, 112, 65, 222};


//: compressed
Byte str_imposeWidowInsuranceContent[] = {73, 10, 1, 5, 234, 100, 112, 110, 113, 115, 102, 116, 116, 102, 101, 26};


//: encrypted
Byte str_worthName[] = {93, 9, 25, 9, 64, 178, 85, 42, 98, 126, 135, 124, 139, 146, 137, 141, 126, 125, 45};


//: messageAbstract
Byte str_orationValueName[] = {48, 15, 31, 7, 255, 34, 239, 140, 132, 146, 146, 128, 134, 132, 96, 129, 146, 147, 145, 128, 130, 147, 39};


//: message
Byte str_linkCampTitle[] = {87, 7, 84, 10, 217, 215, 111, 36, 117, 40, 193, 185, 199, 199, 181, 187, 185, 97};


//: 聊天记录
Byte str_quitMediaContent[] = {6, 12, 7, 5, 174, 239, 136, 145, 236, 171, 176, 239, 181, 183, 236, 196, 156, 248};


//: null
Byte str_popularHareText[] = {91, 4, 39, 5, 241, 149, 156, 147, 147, 168};


//: sender
Byte str_reportedName[] = {80, 6, 95, 14, 102, 42, 71, 62, 123, 12, 187, 108, 163, 108, 210, 196, 205, 195, 196, 209, 229};


//: password
Byte str_duringModeValue[] = {49, 8, 94, 6, 33, 86, 206, 191, 209, 209, 213, 205, 208, 194, 176};


//: sessionId
Byte str_comingLeaderName[] = {73, 9, 53, 9, 243, 170, 33, 139, 250, 168, 154, 168, 168, 158, 164, 163, 126, 153, 202};


//: data
Byte str_relateName[] = {75, 4, 18, 13, 42, 162, 163, 49, 61, 168, 217, 2, 101, 118, 115, 134, 115, 120};

// __DEBUG__
// __CLOSE_PRINT__
//
//  AttachmentHide.m
//  NIM
//
//  Created by Netease on 2019/10/16.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESMultiRetweetAttachment.h"
#import "AttachmentHide.h"
//: #import "NTESFileLocationHelper.h"
#import "BubbleMaxContainer.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"
//: #import "NSDictionary+NTESJson.h"
#import "NSDictionary+Jv.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "NTESMessageUtil.h"
#import "MessageStatus.h"
//: #import "AAAInputEmoticonParser.h"
#import "CutParser.h"

//: @interface NTESMultiRetweetAttachment ()
@interface AttachmentHide ()

//: @property (nonatomic,weak) NIMMessage *message;
@property (nonatomic,weak) NIMMessage *message;
//: @property (nonatomic,strong) M80AttributedLabel *label;
@property (nonatomic,strong) MessageEnableTextView *label;

//: @end
@end

//: @implementation NTESMultiRetweetAttachment
@implementation AttachmentHide

//: - (NSString *)encodeAttachment {
- (NSString *)encodeAttachment {

    //: NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
    //: dataDic[@"url"] = _url;
    dataDic[StringFromWorthyData(str_yardName)] = _url;
    //: dataDic[@"md5"] = _md5;
    dataDic[StringFromWorthyData(str_attendanceRecordText)] = _md5;
    //: dataDic[@"fileName"] = _fileName;
    dataDic[StringFromWorthyData(str_refugeeImageContent)] = _fileName;
    //: dataDic[@"compressed"] = @(_compressed);
    dataDic[StringFromWorthyData(str_imposeWidowInsuranceContent)] = @(_compressed);
    //: dataDic[@"encrypted"] = @(_encrypted);
    dataDic[StringFromWorthyData(str_worthName)] = @(_encrypted);
    //: dataDic[@"password"] = _password;
    dataDic[StringFromWorthyData(str_duringModeValue)] = _password;
    //: dataDic[@"messageAbstract"] = _messageAbstract;
    dataDic[StringFromWorthyData(str_orationValueName)] = _messageAbstract;
    //: dataDic[@"sessionName"] = _sessionName;
    dataDic[StringFromWorthyData(str_marbleValue)] = _sessionName;
    //: dataDic[@"sessionId"] = _sessionId;
    dataDic[StringFromWorthyData(str_comingLeaderName)] = _sessionId;
    //: NSDictionary *dict = @{@"type" : @(CustomMessageTypeMultiRetweet),
    NSDictionary *dict = @{StringFromWorthyData(str_concerningSchemeData) : @(CustomMessageTypeMultiRetweet),
                           //: @"data" : dataDic};
                           StringFromWorthyData(str_relateName) : dataDic};
    //: NSData *data = [NSJSONSerialization dataWithJSONObject:dict
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                   //: options:0
                                                   options:0
                                                     //: error:nil];
                                                     error:nil];
    //: NSString *content = @"";
    NSString *content = @"";
    //: if (data) {
    if (data) {
        //: content = [[NSString alloc] initWithData:data
        content = [[NSString alloc] initWithData:data
                                        //: encoding:NSUTF8StringEncoding];
                                        encoding:NSUTF8StringEncoding];
    }


    //: return content;
    return content;
}

//: - (void)setAbstracts:(NSMutableArray<NTESMessageAbstract *> *)abstracts {
- (void)setAbstracts:(NSMutableArray<ImageFrom *> *)abstracts {
    //: _abstracts = abstracts;
    _abstracts = abstracts;
    //: NSMutableArray *abstractDics = [NSMutableArray array];
    NSMutableArray *abstractDics = [NSMutableArray array];
    //: for (NTESMessageAbstract *obj in abstracts) {
    for (ImageFrom *obj in abstracts) {
        //: NSDictionary *objDic = [obj abstractDictionary];
        NSDictionary *objDic = [obj sessionRandom];
        //: if (objDic) {
        if (objDic) {
            //: [abstractDics addObject:objDic];
            [abstractDics addObject:objDic];
        }
    }
    //: _messageAbstract = abstractDics;
    _messageAbstract = abstractDics;
}

//: - (void)setMessageAbstract:(NSArray *)messageAbstract {
- (void)setMessageAbstract:(NSArray *)messageAbstract {
    //: _messageAbstract = messageAbstract;
    _messageAbstract = messageAbstract;
    //: if (!messageAbstract) {
    if (!messageAbstract) {
        //: _abstracts = nil;
        _abstracts = nil;
    //: } else {
    } else {
        //: _abstracts = [NSMutableArray array];
        _abstracts = [NSMutableArray array];
        //: for (id obj in messageAbstract) {
        for (id obj in messageAbstract) {
            //: if ([obj isKindOfClass:[NSDictionary class]]) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                //: NTESMessageAbstract *abstract = [NTESMessageAbstract abstractWithDictionary:obj];
                ImageFrom *abstract = [ImageFrom bubble:obj];
                //: if (abstract) {
                if (abstract) {
                    //: [_abstracts addObject:abstract];
                    [_abstracts addObject:abstract];
                }
            }
        }
    }
}

//: - (NSString *)formatTitleMessage {
- (NSString *)cell {
    //: return [NSString stringWithFormat:@"%@%@",
    return [NSString stringWithFormat:@"%@%@",
            //: _sessionName,
            _sessionName,
            //: @"聊天记录".ntes_localized];
            StringFromWorthyData(str_quitMediaContent).language];
}

//: - (NSString *)formatAbstractMessage:(NTESMessageAbstract *)abstract {
- (NSString *)size:(ImageFrom *)abstract {
    //: return [NSString stringWithFormat:@"%@:%@", abstract.sender, abstract.message];
    return [NSString stringWithFormat:@"%@:%@", abstract.sender, abstract.message];
}

//: #pragma mark - 上传接口
#pragma mark - 上传接口
//: - (BOOL)attachmentNeedsUpload {
- (BOOL)attachmentNeedsUpload {
    //: return [_url length] == 0;
    return [_url length] == 0;
}

//: - (NSString *)attachmentPathForUploading {
- (NSString *)attachmentPathForUploading {
    //: return self.filePath;
    return self.filePath;
}

//: - (void)updateAttachmentURL:(NSString *)urlString {
- (void)updateAttachmentURL:(NSString *)urlString {
    //: self.url = urlString;
    self.url = urlString;
}

//: #pragma mark - 下载相关接口
#pragma mark - 下载相关接口
//: - (BOOL)attachmentNeedsDownload {
- (BOOL)attachmentNeedsDownload {
    //: NSFileManager *fm = [NSFileManager defaultManager];
    NSFileManager *fm = [NSFileManager defaultManager];
    //: BOOL isDir = NO;
    BOOL isDir = NO;
    //: BOOL fileExist = ([fm fileExistsAtPath:self.filePath isDirectory:&isDir]
    BOOL fileExist = ([fm fileExistsAtPath:self.filePath isDirectory:&isDir]
                      //: && !isDir);
                      && !isDir);
    //: return !fileExist;
    return !fileExist;
}

//: - (NSString *)attachmentURLStringForDownloading {
- (NSString *)attachmentURLStringForDownloading {
    //: return _url;
    return _url;
}

//: - (NSString *)attachmentPathForDownloading {
- (NSString *)attachmentPathForDownloading {
    //: return self.filePath;
    return self.filePath;
}

//: #pragma mark - cell相关
#pragma mark - cell相关
//: - (NSString *)cellContent:(NIMMessage *)message {
- (NSString *)pin:(NIMMessage *)message {
    //: return @"NTESSessionMultiRetweetContentView";
    return @"HarvestMoonView";
}

//: - (CGSize)contentSize:(NIMMessage *)message cellWidth:(CGFloat)width {
- (CGSize)linkOfPop:(NIMMessage *)message of:(CGFloat)width {
    //: CGFloat msgBubbleMaxWidth = (width - 130);
    CGFloat msgBubbleMaxWidth = (width - 130);
    //: CGFloat padding = 4.0;
    CGFloat padding = 4.0;
    //: CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - 2 * padding);
    CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - 2 * padding);
    //: NSString *titleString = [self formatTitleMessage];
    NSString *titleString = [self cell];
    //: NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    //: CGSize bounding = CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308);
    CGSize bounding = CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308);
    //: NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading;
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading;
    //: CGSize titleSize = [titleString boundingRectWithSize:bounding
    CGSize titleSize = [titleString boundingRectWithSize:bounding
                                                 //: options:options
                                                 options:options
                                              //: attributes:attribute
                                              attributes:attribute
                                                 //: context:nil].size;
                                                 context:nil].size;

    //: attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:11]};
    attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:11]};
    //: CGSize subTitleSize = [@"聊天记录".ntes_localized boundingRectWithSize:bounding
    CGSize subTitleSize = [StringFromWorthyData(str_quitMediaContent).language boundingRectWithSize:bounding
                                                               //: options:options
                                                               options:options
                                                            //: attributes:attribute
                                                            attributes:attribute
                                                               //: context:nil].size;
                                                               context:nil].size;


    //: CGFloat abstractHeight = 0;
    CGFloat abstractHeight = 0;
    //: for (NTESMessageAbstract *abs in _abstracts) {
    for (ImageFrom *abs in _abstracts) {
        //: [self.label nim_setText:[self formatAbstractMessage:abs]];
        [self.label showName:[self size:abs]];
        //: CGSize size = [self.label sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
        CGSize size = [self.label sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
        //: abstractHeight += (size.height + padding);
        abstractHeight += (size.height + padding);
    }

    //: CGFloat height = titleSize.height +
    CGFloat height = titleSize.height +
                    //: abstractHeight + 1.0 +
                    abstractHeight + 1.0 +
                    //: padding + subTitleSize.height;
                    padding + subTitleSize.height;

    //: return CGSizeMake(msgBubbleMaxWidth, height);
    return CGSizeMake(msgBubbleMaxWidth, height);
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message {
- (UIEdgeInsets)keyPanoramicView:(NIMMessage *)message {
    //: return UIEdgeInsetsMake(12.0, 12.0, 12.0, 4.0);
    return UIEdgeInsetsMake(12.0, 12.0, 12.0, 4.0);
}

//: - (BOOL)canBeRevoked {
- (BOOL)recent {
    //: return YES;
    return YES;
}

//: - (BOOL)canBeForwarded {
- (BOOL)container {
    //: return YES;
    return YES;
}

//: - (NSString *)filePath
- (NSString *)filePath
{
    //: NSString *filePath = self.fileName ? [NTESFileLocationHelper filepathForMergeForwardFile:self.fileName] : nil;
    NSString *filePath = self.fileName ? [BubbleMaxContainer date:self.fileName] : nil;
    //: return filePath;
    return filePath;
}

//: - (NSString *)fileName
- (NSString *)fileName
{
    //: if (!_fileName) {
    if (!_fileName) {
        //: _fileName = self.url.lastPathComponent;
        _fileName = self.url.lastPathComponent;
    }
    //: return _fileName;
    return _fileName;
}

//: - (M80AttributedLabel *)label {
- (MessageEnableTextView *)label {
    //: if (!_label) {
    if (!_label) {
        //: _label = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
        _label = [[MessageEnableTextView alloc] initWithFrame:CGRectZero];
        //: _label.textColor = [UIColor lightGrayColor];
        _label.textColor = [UIColor lightGrayColor];
        //: _label.font = [UIFont systemFontOfSize:11];
        _label.font = [UIFont systemFontOfSize:11];
        //: _label.numberOfLines = 1;
        _label.numberOfLines = 1;
    }
    //: return _label;
    return _label;
}

//: @end
@end

//: #pragma mark - NTESMessageAbstract
#pragma mark - ImageFrom


//: @implementation NTESMessageAbstract
@implementation ImageFrom

//: - (NSDictionary *)abstractDictionary {
- (NSDictionary *)sessionRandom {
    //: if (_sender && _message) {
    if (_sender && _message) {
        //: NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        //: dic[@"sender"] = _sender;
        dic[StringFromWorthyData(str_reportedName)] = _sender;
        //: dic[@"message"] = _message;
        dic[StringFromWorthyData(str_linkCampTitle)] = _message;
        //: return dic;
        return dic;
    //: } else {
    } else {
        //: return nil;
        return nil;
    }
}

//: + (instancetype)abstractWithMessage:(NIMMessage *)message {
+ (instancetype)restore:(NIMMessage *)message {
    //: if (!message) {
    if (!message) {
        //: return nil;
        return nil;
    }
    //: NTESMessageAbstract *ret = [[NTESMessageAbstract alloc] init];
    ImageFrom *ret = [[ImageFrom alloc] init];
    //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
    TitleOption *option = [[TitleOption alloc] init];
    //: option.session = message.session;
    option.session = message.session;
    //: option.message = message;
    option.message = message;
    //: CCCKitInfo *info = [[AppleProjectKit sharedKit].provider infoByUser:message.from option:option];
    TitleInfo *info = [[Indicator reach].provider indoors:message.from harvest:option];
    //: ret.sender = info.showName ?: @"null";
    ret.sender = info.showName ?: StringFromWorthyData(str_popularHareText);
    //: ret.message = [ret abstract:message];
    ret.message = [ret back:message];
    //: return ret;
    return ret;
}

//: + (instancetype)abstractWithDictionary:(NSDictionary *)content {
+ (instancetype)bubble:(NSDictionary *)content {
    //: if (!content) {
    if (!content) {
        //: return nil;
        return nil;
    }
    //: NTESMessageAbstract *ret = [[NTESMessageAbstract alloc] init];
    ImageFrom *ret = [[ImageFrom alloc] init];
    //: ret.sender = [content jsonString:@"sender"];
    ret.sender = [content twine:StringFromWorthyData(str_reportedName)];
    //: ret.message = [content jsonString:@"message"];
    ret.message = [content twine:StringFromWorthyData(str_linkCampTitle)];
    //: return ret;
    return ret;
}

//: - (NSString *)abstract:(NIMMessage *)message {
- (NSString *)back:(NIMMessage *)message {
    //: NSString *msg = [NTESMessageUtil messageContent:message];
    NSString *msg = [MessageStatus textCipher:message];
    //: NSMutableString *ret = [NSMutableString string];
    NSMutableString *ret = [NSMutableString string];
    //: if (msg.length > (32)) {
    if (msg.length > (32)) {
        //: NSArray *tokens = [[AAAInputEmoticonParser currentParser] tokens:msg];
        NSArray *tokens = [[CutParser picture] cipher:msg];
        //: for (NIMInputTextToken *token in tokens) { 
        for (NameToken *token in tokens) { //防止emoji表情被截断
            //: if (ret.length > (32)) {
            if (ret.length > (32)) {
                //: break;
                break;
            }
            //: [ret appendString:token.text];
            [ret appendString:token.text];
        }
    //: } else {
    } else {
        //: [ret appendString:msg];
        [ret appendString:msg];
    }
    //: return ret;
    return ret;
}

//: @end
@end

Byte * WorthyDataToCache(Byte *data) {
    int hareCell = data[0];
    int labKey = data[1];
    Byte minFed = data[2];
    int demonstrate = data[3];
    if (!hareCell) return data + demonstrate;
    for (int i = demonstrate; i < demonstrate + labKey; i++) {
        int value = data[i] - minFed;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[demonstrate + labKey] = 0;
    return data + demonstrate;
}

NSString *StringFromWorthyData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)WorthyDataToCache(data)];
}
