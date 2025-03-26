
#import <Foundation/Foundation.h>

NSString *StringFromSpitData(Byte *data);


//: tyl_spellingCache
Byte str_bestText[] = {71, 17, 5, 6, 151, 126, 121, 126, 113, 100, 120, 117, 106, 113, 113, 110, 115, 108, 72, 102, 104, 109, 106, 38};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ScoopView.m
//  NIM
//
//  Created by amao on 13-1-21.
//  Copyright (c) 2013年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAASpellingCenter.h"
#import "CenterMessagePressed.h"
//: #import "AAAPinyinConverter.h"
#import "InstalmentWithEnableConverter.h"
//: #import "YYModel/YYModel.h"
#import "YYModel/YYModel.h"
//: #import "NSObject+YYModel.h"
#import "NSObject+YYModel.h"

//: @implementation NIMSpellingUnit
@implementation FromUp

//: @end
@end

//: @interface AAASpellingCenter ()
@interface CenterMessagePressed ()
//: - (NIMSpellingUnit *)calcSpellingOfString: (NSString *)source;
- (FromUp *)text: (NSString *)source;
//: @end
@end


//: @implementation AAASpellingCenter
@implementation CenterMessagePressed
//: + (AAASpellingCenter *)sharedCenter
+ (CenterMessagePressed *)success
{
    //: static AAASpellingCenter *instance = nil;
    static CenterMessagePressed *instance = nil;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: instance = [[AAASpellingCenter alloc]init];
        instance = [[CenterMessagePressed alloc]init];
    //: });
    });
    //: return instance;
    return instance;
}

//: - (id)init
- (id)init
{
    //: if (self = [super init])
    if (self = [super init])
    {
        //: NSDictionary *spellingCache = [[NSUserDefaults standardUserDefaults] objectForKey:@"tyl_spellingCache"];
        NSDictionary *spellingCache = [[NSUserDefaults standardUserDefaults] objectForKey:StringFromSpitData(str_bestText)];
        //: if (spellingCache) {
        if (spellingCache) {
            //: _spellingCache = [[NSMutableDictionary alloc]initWithDictionary:[NSDictionary yy_modelDictionaryWithClass:[NIMSpellingUnit class] json:spellingCache]];
            _spellingCache = [[NSMutableDictionary alloc]initWithDictionary:[NSDictionary yy_modelDictionaryWithClass:[FromUp class] json:spellingCache]];
        }

        //: if (!_spellingCache)
        if (!_spellingCache)
        {
            //: _spellingCache = [[NSMutableDictionary alloc]init];
            _spellingCache = [[NSMutableDictionary alloc]init];
        }
    }
    //: return self;
    return self;
}



//: - (void)saveSpellingCache
- (void)complete
{
    //: static const NSInteger kMaxEntriesCount = 5000;
    static const NSInteger kMaxEntriesCount = 5000;
    //: @synchronized(self)
    @synchronized(self)
    {
        //: NSInteger count = [_spellingCache count];
        NSInteger count = [_spellingCache count];
        //: if (count >= kMaxEntriesCount)
        if (count >= kMaxEntriesCount)
        {
            //: [_spellingCache removeAllObjects];
            [_spellingCache removeAllObjects];
        }
        //: if (_spellingCache)
        if (_spellingCache)
        {
            //: [[NSUserDefaults standardUserDefaults] setObject:[_spellingCache yy_modelToJSONString] forKey:@"tyl_spellingCache"];
            [[NSUserDefaults standardUserDefaults] setObject:[_spellingCache yy_modelToJSONString] forKey:StringFromSpitData(str_bestText)];
        }

    }
}


//: - (NIMSpellingUnit *)spellingForString:(NSString *)source
- (FromUp *)unwelcomeSpellingPackthread:(NSString *)source
{
    //: if ([source length] == 0)
    if ([source length] == 0)
    {
        //: return nil;
        return nil;
    }
    //: NIMSpellingUnit *spellingUnit = nil;
    FromUp *spellingUnit = nil;
    //: @synchronized(self)
    @synchronized(self)
    {
        //: NIMSpellingUnit *unit = [_spellingCache objectForKey:source];
        FromUp *unit = [_spellingCache objectForKey:source];
        //: if (!unit)
        if (!unit)
        {
            //: unit = [self calcSpellingOfString:source];
            unit = [self text:source];
            //: if ([unit.fullSpelling length] && [unit.shortSpelling length])
            if ([unit.fullSpelling length] && [unit.shortSpelling length])
            {
                //: [_spellingCache setObject:unit forKey:source];
                [_spellingCache setObject:unit forKey:source];
            }
        }
        //: spellingUnit = unit;
        spellingUnit = unit;
    }
    //: return spellingUnit;
    return spellingUnit;
}

//: - (NSString *)firstLetter:(NSString *)input
- (NSString *)indexLetter:(NSString *)input
{
    //: NIMSpellingUnit *unit = [self spellingForString:input];
    FromUp *unit = [self unwelcomeSpellingPackthread:input];
    //: NSString *spelling = unit.fullSpelling;
    NSString *spelling = unit.fullSpelling;
    //: return [spelling length] ? [spelling substringWithRange:NSMakeRange(0, 1)] : nil;
    return [spelling length] ? [spelling substringWithRange:NSMakeRange(0, 1)] : nil;
}


//: - (NIMSpellingUnit *)calcSpellingOfString:(NSString *)source
- (FromUp *)text:(NSString *)source
{
    //: NSMutableString *fullSpelling = [[NSMutableString alloc]init];
    NSMutableString *fullSpelling = [[NSMutableString alloc]init];
    //: NSMutableString *shortSpelling= [[NSMutableString alloc]init];
    NSMutableString *shortSpelling= [[NSMutableString alloc]init];
    //: for (NSInteger i = 0; i < [source length]; i++)
    for (NSInteger i = 0; i < [source length]; i++)
    {
        //: NSString *word = [source substringWithRange:NSMakeRange(i, 1)];
        NSString *word = [source substringWithRange:NSMakeRange(i, 1)];
        //: NSString *pinyin = [[AAAPinyinConverter sharedInstance] toPinyin:word];
        NSString *pinyin = [[InstalmentWithEnableConverter count] ticket:word];

        //: if ([pinyin length])
        if ([pinyin length])
        {
            //: [fullSpelling appendString:pinyin];
            [fullSpelling appendString:pinyin];
            //: [shortSpelling appendString:[pinyin substringToIndex:1]];
            [shortSpelling appendString:[pinyin substringToIndex:1]];
        }
    }

    //: NIMSpellingUnit *unit = [[NIMSpellingUnit alloc]init];
    FromUp *unit = [[FromUp alloc]init];
    //: unit.fullSpelling = [fullSpelling lowercaseString];
    unit.fullSpelling = [fullSpelling lowercaseString];
    //: unit.shortSpelling= [shortSpelling lowercaseString];
    unit.shortSpelling= [shortSpelling lowercaseString];
    //: return unit;
    return unit;
}




//: @end
@end

Byte * SpitDataToCache(Byte *data) {
    int franchiseSoldier = data[0];
    int script = data[1];
    Byte distribute = data[2];
    int working = data[3];
    if (!franchiseSoldier) return data + working;
    for (int i = working; i < working + script; i++) {
        int value = data[i] - distribute;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[working + script] = 0;
    return data + working;
}

NSString *StringFromSpitData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)SpitDataToCache(data)];
}
