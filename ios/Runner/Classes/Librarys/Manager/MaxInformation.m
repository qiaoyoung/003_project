
#import <Foundation/Foundation.h>
typedef struct {
    Byte fishingEconomist;
    Byte *refugeeConservation;
    unsigned int quitView;
    bool auraHare;
} TanData;

NSString *StringFromTanData(TanData *data);


//: en_US
TanData str_yardThoughtValue = (TanData){186, (Byte []){223, 212, 229, 239, 233, 254}, 5, false};


//: string
TanData str_treeTanFishingText = (TanData){118, (Byte []){5, 2, 4, 31, 24, 17, 118}, 6, false};


//: name
TanData str_spareTitle = (TanData){35, (Byte []){77, 66, 78, 70, 64}, 4, false};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MaxInformation.m
//  NIM
//
//  Created by 彭爽 on 2022/6/24.
//  Copyright © 2022 Netease. All rights reserved.
//
//: #import "NTESLanguageManager.h"
#import "MaxInformation.h"

// __M_A_C_R_O__

//: @interface NTESLanguageManager ()<NSXMLParserDelegate>
@interface MaxInformation ()<NSXMLParserDelegate>
//: @property (nonatomic ,strong) NSString *currentElementName;
@property (nonatomic ,strong) NSString *currentElementName;
//: @end
@end

//: @implementation NTESLanguageManager
@implementation MaxInformation

//: static NTESLanguageManager *shareInstance = nil;
static MaxInformation *k_cellValue = nil;

//: + (NTESLanguageManager *)shareInstance{
+ (MaxInformation *)beInstance{
    //: @synchronized(self) {
    @synchronized(self) {
        //: if (shareInstance == nil) {
        if (shareInstance == nil) {
            //: shareInstance = [[NTESLanguageManager alloc] init];
            k_cellValue = [[MaxInformation alloc] init];
            //: shareInstance.langDict = [NSMutableDictionary dictionaryWithCapacity:100];
            shareInstance.langDict = [NSMutableDictionary dictionaryWithCapacity:100];
        }
        //: return shareInstance;
        return k_cellValue;
    }
}

//: + (NSString *)getTextWithKey:(NSString *)key{
+ (NSString *)off:(NSString *)key{
    //: NSMutableDictionary *dict = [NTESLanguageManager shareInstance].langDict;
    NSMutableDictionary *dict = [MaxInformation shareInstance].langDict;
    //: return [dict stringValueForKey:key];
    return [dict stringValueForKey:key];
}

//: - (void)setLanguagre:(NSString *)langType{
- (void)setInfoKey:(NSString *)langType{
    //: NSString *resourceType = @"strings";
    NSString *resourceType = @"strings";
    //: if ([langType isEqualToString:@"en"]) {
    if ([langType isEqualToString:@"en"]) {
        //: resourceType = @"strings_en";
        resourceType = @"strings_en";
    }
    //: NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:resourceType ofType:@"xml"];
    NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:resourceType ofType:@"xml"];
    //: NSData *xmlData = [NSData dataWithContentsOfFile:xmlFilePath];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlFilePath];
    //: NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    //: xmlParser.delegate = self;
    xmlParser.delegate = self;
    //: [xmlParser parse];
    [xmlParser parse];
}

// 开始
//: - (void)parserDidStartDocument:(NSXMLParser *)parser {
- (void)parserDidStartDocument:(NSXMLParser *)parser {

    //: NSLog(@"开始");
}

// 获取节点头
//: - (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {

    //: if ([elementName isEqualToString:@"string"]) {
    if ([elementName isEqualToString:StringFromTanData(&str_treeTanFishingText)]) {
        //: self.currentElementName = attributeDict[@"name"];
        self.currentElementName = attributeDict[StringFromTanData(&str_spareTitle)];
    }

}

// 获取节点的值 (这个方法在获取到节点头和节点尾后，会分别调用一次)
//: - (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {

//    NSLog(@"%@value : %@",parser, string);

    //: if (_currentElementName != nil) {
    if (_currentElementName != nil) {
        //: [self.langDict setObject:string forKey:_currentElementName];
        [self.langDict setObject:string forKey:_currentElementName];
    }
}

// 获取节点尾
//: - (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {

    //: _currentElementName = nil;
    _currentElementName = nil;
//    NSLog(@"end element : %@---%@----%@", elementName,namespaceURI,qName);


}

// 结束
//: - (void)parserDidEndDocument:(NSXMLParser *)parser {
- (void)parserDidEndDocument:(NSXMLParser *)parser {

    //: NSLog(@"结束");
    //: NSLog(@"%@",self.langDict);

    //发送修改语言通知

}

//: + (NSString *)getLocale{
+ (NSString *)monitor{//th-TH  vi-VN
    //: NSString *language = [GVUserDefaults standardUserDefaults].language;
    NSString *language = [GVUserDefaults standardUserDefaults].language;
    //: NSString *locale = @"zh_CN";
    NSString *locale = @"zh_CN";
    //: if ([language isEqualToString:@"en"]) {
    if ([language isEqualToString:@"en"]) {
        //: return @"en_US";
        return StringFromTanData(&str_yardThoughtValue);
    }
    //: return locale;
    return locale;
}


//: @end
@end

Byte *TanDataToByte(TanData *data) {
    if (data->auraHare) return data->refugeeConservation;
    for (int i = 0; i < data->quitView; i++) {
        data->refugeeConservation[i] ^= data->fishingEconomist;
    }
    data->refugeeConservation[data->quitView] = 0;
    data->auraHare = true;
    return data->refugeeConservation;
}

NSString *StringFromTanData(TanData *data) {
    return [NSString stringWithUTF8String:(char *)TanDataToByte(data)];
}
