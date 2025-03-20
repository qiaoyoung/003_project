//
//  NTESLanguageManager.m
//  NIM
//
//  Created by 彭爽 on 2022/6/24.
//  Copyright © 2022 Netease. All rights reserved.
//

#import "NTESLanguageManager.h"
#import "XMLReader.h"
#import "AppleProjectKit.h"
#import "SSZipArchiveManager.h"

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
    NSString *value = [dict objectForKey:key];
    if (value == nil ) {
        NSLog(@"value为空========%@",key);
        value = @"";
        
    }
    return value;
}

- (void)setLanguagre:(NSString *)langType{
    
//    [self.langDict removeAllObjects];
    
    NSString *resourceType = @"zh_strings";
    if ([langType isEqualToString:@"en"]) {
        resourceType = @"en_strings";
    }else if ([langType isEqualToString:@"th"]){
        resourceType = @"th_strings";
    }else if ([langType isEqualToString:@"vi"]){
        resourceType = @"vi_strings";
    }else if ([langType isEqualToString:@"hi"]){
        resourceType = @"hi_strings";
    }else if ([langType isEqualToString:@"ja"]){
        resourceType = @"ja_strings";
    }else if ([langType isEqualToString:@"ko"]){
        resourceType = @"ko_strings";
    }else if ([langType isEqualToString:@"spa"]){
        resourceType = @"spa_strings";
    }else if ([langType isEqualToString:@"pt"]){
        resourceType = @"pt_strings";
    }else if ([langType isEqualToString:@"id"]){
        resourceType = @"id_strings";
    }else if ([langType isEqualToString:@"it"]){
        resourceType = @"it_strings";
    }else if ([langType isEqualToString:@"eg"]){
        resourceType = @"eg_strings";
    }else if ([langType isEqualToString:@"tr"]){
        resourceType = @"tr_strings";
    }else if ([langType isEqualToString:@"ug"]){
        resourceType = @"ug_strings";
    }else if ([langType isEqualToString:@"de"]){
        resourceType = @"de_strings";
    }else if ([langType isEqualToString:@"pk"]){
        resourceType = @"pk_strings";
    }else if ([langType isEqualToString:@"sa"]){
        resourceType = @"sa_strings";
    }else if ([langType isEqualToString:@"ru"]){
        resourceType = @"ru_strings";
    }else if ([langType isEqualToString:@"bd"]){
        resourceType = @"bd_strings";
    }else if ([langType isEqualToString:@"fr"]){
        resourceType = @"fr_strings";
    }else if ([langType isEqualToString:@"hant"]){
        resourceType = @"zh_hant_strings";
    }

    NSString *xmlFilePath = [[[SSZipArchiveManager sharedManager] getXML_filePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@.xml", langType, resourceType]];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:xmlFilePath]) {
        NSLog(@"XML file not found at path: %@", xmlFilePath);
        return;
    }
    
    NSData *xmlData = [NSData dataWithContentsOfFile:xmlFilePath];
    if (!xmlData) {
        NSLog(@"Failed to load XML data from file: %@", xmlFilePath);
        return;
    }
 
    NSError *error = nil;
    if (error) {
        NSLog(@"error : %@", error);
    }
    NSDictionary *result = [XMLReader dictionaryForXMLData:xmlData error:&error];
//    NSDictionary *result = [NSDictionary dictionaryWithXML:xmlData];
    
    NSLog(@"result : %@", result);
    if (result) {
        NSDictionary *resources = [result objectForKey:@"resources"];
        if (resources) {
            NSArray *string = [resources objectForKey:@"string"];
            if (string.count > 0) {
                [string enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSString *name = [obj objectForKey:@"name"];
                    NSString *text = [obj objectForKey:@"text"];
                    [self.langDict setObject:text forKey:name];
                }];
            }
        }
        
//        NSArray *string = [result objectForKey:@"string"];
//        if (string.count > 0) {
//            [string enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                NSString *name = [obj objectForKey:@"name"];
//                NSString *text = [obj objectForKey:@"_text"];
//                [self.langDict setObject:text forKey:name];
//            }];
//        }
    }
}

// 开始
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    
    NSLog(@"开始");
}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"出错");
}

// 获取节点头
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    if ([elementName isEqualToString:@"string"]) {
        self.currentElementName = attributeDict[@"name"];
        //NSLog(@"--------%@",_currentElementName);
    }
    
}

// 获取节点的值 (这个方法在获取到节点头和节点尾后，会分别调用一次)
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (_currentElementName != nil) {
        if ([_currentElementName isEqualToString:@"main_tab_my"]) {
            NSLog(@"%@",string);
        }
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
//    NSString *language = [NIMUserDefaults standardUserDefaults].language;
    NSString *locale = @"zh_CN";
//    if ([language isEqualToString:@"en"]) {
//        return @"en_US";
//    }
    return locale;
}


@end
