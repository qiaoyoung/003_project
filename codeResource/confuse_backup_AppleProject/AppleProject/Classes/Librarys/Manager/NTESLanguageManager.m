//
//  NTESLanguageManager.m
//  NIM
//
//  Created by 彭爽 on 2022/6/24.
//  Copyright © 2022 Netease. All rights reserved.
//

#import "NTESLanguageManager.h"

@interface NTESLanguageManager ()<NSXMLParserDelegate>
@property (nonatomic ,strong) NSString *currentElementName;
@end

@implementation NTESLanguageManager

static NTESLanguageManager *shareInstance = nil;

+ (NTESLanguageManager *)shareInstance{
    @synchronized(self) {
        if (shareInstance == nil) {
            shareInstance = [[NTESLanguageManager alloc] init];
            shareInstance.langDict = [NSMutableDictionary dictionaryWithCapacity:100];
        }
        return shareInstance;
    }
}

+ (NSString *)getTextWithKey:(NSString *)key{
    NSMutableDictionary *dict = [NTESLanguageManager shareInstance].langDict;
    return [dict stringValueForKey:key];
}

- (void)setLanguagre:(NSString *)langType{
    NSString *resourceType = @"strings";
    if ([langType isEqualToString:@"en"]) {
        resourceType = @"strings_en";
    }
    NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:resourceType ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlFilePath];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    xmlParser.delegate = self;
    [xmlParser parse];
}

// 开始
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    
    NSLog(@"开始");
}

// 获取节点头
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    if ([elementName isEqualToString:@"string"]) {
        self.currentElementName = attributeDict[@"name"];
    }
    
}

// 获取节点的值 (这个方法在获取到节点头和节点尾后，会分别调用一次)
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
//    NSLog(@"%@value : %@",parser, string);
    
    if (_currentElementName != nil) {
        [self.langDict setObject:string forKey:_currentElementName];
    }
}

// 获取节点尾
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    _currentElementName = nil;
//    NSLog(@"end element : %@---%@----%@", elementName,namespaceURI,qName);

    
}

// 结束
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    NSLog(@"结束");
    NSLog(@"%@",self.langDict);
    
    //发送修改语言通知

}

+ (NSString *)getLocale{//th-TH  vi-VN
    NSString *language = [GVUserDefaults standardUserDefaults].language;
    NSString *locale = @"zh_CN";
    if ([language isEqualToString:@"en"]) {
        return @"en_US";
    }
    return locale;
}


@end
