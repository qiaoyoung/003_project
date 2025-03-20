
#import <Foundation/Foundation.h>

NSString *StringFromGainData(Byte *data);


//: data
Byte str_easyText[] = {55, 4, 7, 86, 6, 221, 186, 97, 116, 97, 100, 124};


//: unicode
Byte str_investigatorText[] = {31, 7, 12, 230, 120, 72, 222, 95, 115, 97, 89, 123, 101, 100, 111, 99, 105, 110, 117, 164};


//: info
Byte str_refugeLeaderTitle[] = {61, 4, 8, 186, 224, 16, 16, 194, 111, 102, 110, 105, 226};


//: title
Byte str_concedeChickenValue[] = {5, 5, 9, 233, 9, 39, 24, 94, 175, 101, 108, 116, 105, 116, 16};


//: gif
Byte str_analGestureName[] = {21, 3, 10, 240, 119, 116, 170, 56, 129, 146, 102, 105, 103, 175};


//: tag
Byte str_horseLeaderText[] = {76, 3, 5, 171, 180, 103, 97, 116, 161};


//: normal
Byte str_conservationName[] = {45, 6, 6, 20, 77, 125, 108, 97, 109, 114, 111, 110, 99};


//: file
Byte str_rectoTitle[] = {22, 4, 13, 54, 150, 231, 59, 90, 204, 171, 105, 50, 148, 101, 108, 105, 102, 27};


//: pressed
Byte str_railBottomName[] = {44, 7, 5, 57, 227, 100, 101, 115, 115, 101, 114, 112, 71};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESEmoticonManager.h
//  NIM
//
//  Created by amao on 7/2/14.
//  Copyright (c) 2014 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAInputEmoticonManager.h"
#import "DataOf.h"
//: #import "UserInputEmoticonDefine.h"
#import "UserInputEmoticonDefine.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "NSBundle+AppleProjectKit.h"
#import "NSBundle+Indicator.h"

//: @implementation NIMInputEmoticon
@implementation LiquidEcstasyEmoticon

//: - (NIMEmoticonType)type {
- (NIMEmoticonType)type {
    //: if (_unicode.length) {
    if (_unicode.length) {
        //: return NIMEmoticonTypeUnicode;
        return NIMEmoticonTypeUnicode;
    }
    //: else if (_gif.length) {
    else if (_gif.length) {
        //: return NIMEmoticonTypeGif;
        return NIMEmoticonTypeGif;
    }
    //: else {
    else {
        //: return NIMEmoticonTypeFile;
        return NIMEmoticonTypeFile;
    }
}

//: @end
@end

//: @implementation NIMInputEmoticonCatalog
@implementation TinCanTeam
//: @end
@end

//: @implementation NIMInputEmoticonLayout
@implementation RangeMode

//: - (id)initEmojiLayout:(CGFloat)width
- (id)initRecordDomain:(CGFloat)width
{
    //: self = [super init];
    self = [super init];
    //: if (self)
    if (self)
    {
        //: _rows = 3;
        _rows = 3;
        //: _columes = ((width - 15 - 15) / 46.0);
        _columes = ((width - 15 - 15) / 46.0);
        //: _itemCountInPage = _rows * _columes -1;
        _itemCountInPage = _rows * _columes -1;
        //: _cellWidth = (width - 15 - 15) / _columes;
        _cellWidth = (width - 15 - 15) / _columes;
        //: _cellHeight = 46.0;
        _cellHeight = 46.0;
        //: _imageWidth = 46.0;
        _imageWidth = 46.0;
        //: _imageHeight = 46.0;
        _imageHeight = 46.0;
        //: _emoji = YES;
        _emoji = YES;
    }
    //: return self;
    return self;
}

//: - (id)initCharletLayout:(CGFloat)width{
- (id)initBackgroundOrigin:(CGFloat)width{
    //: self = [super init];
    self = [super init];
    //: if (self)
    if (self)
    {
        //: _rows = 2;
        _rows = 2;
        //: _columes = ((width - 15 - 15) / 70.f);
        _columes = ((width - 15 - 15) / 70.f);
        //: _itemCountInPage = _rows * _columes;
        _itemCountInPage = _rows * _columes;
        //: _cellWidth = (width - 15 - 15) / _columes;
        _cellWidth = (width - 15 - 15) / _columes;
        //: _cellHeight = 76.0;
        _cellHeight = 76.0;
        //: _imageWidth = 70.f;
        _imageWidth = 70.f;
        //: _imageHeight = 70.f;
        _imageHeight = 70.f;
        //: _emoji = NO;
        _emoji = NO;
    }
    //: return self;
    return self;
}

//: @end
@end

//: @interface AAAInputEmoticonManager ()
@interface DataOf ()
//: @property (nonatomic,strong) NSArray *catalogs;
@property (nonatomic,strong) NSArray *catalogs;
//: @end
@end

//: @implementation AAAInputEmoticonManager
@implementation DataOf

//: + (instancetype)sharedManager
+ (instancetype)telegram
{
    //: static AAAInputEmoticonManager *instance = nil;
    static DataOf *instance = nil;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: instance = [[AAAInputEmoticonManager alloc]init];
        instance = [[DataOf alloc]init];
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
        //: [self parsePlist];
        [self rangePlist];
        //: [self preloadEmoticonResource];
        [self searchion];
    }
    //: return self;
    return self;
}

//: - (void)start {};
- (void)tip {};

//: - (NIMInputEmoticonCatalog *)emoticonCatalog:(NSString *)catalogID
- (TinCanTeam *)space:(NSString *)catalogID
{
    //: for (NIMInputEmoticonCatalog *catalog in _catalogs)
    for (TinCanTeam *catalog in _catalogs)
    {
        //: if ([catalog.catalogID isEqualToString:catalogID])
        if ([catalog.catalogID isEqualToString:catalogID])
        {
            //: return catalog;
            return catalog;
        }
    }
    //: return nil;
    return nil;
}


//: - (NIMInputEmoticon *)emoticonByTag:(NSString *)tag
- (LiquidEcstasyEmoticon *)popAt:(NSString *)tag
{
    //: NIMInputEmoticon *emoticon = nil;
    LiquidEcstasyEmoticon *emoticon = nil;
    //: if ([tag length])
    if ([tag length])
    {
        //: for (NIMInputEmoticonCatalog *catalog in _catalogs)
        for (TinCanTeam *catalog in _catalogs)
        {
            //: emoticon = [catalog.tag2Emoticons objectForKey:tag];
            emoticon = [catalog.tag2Emoticons objectForKey:tag];
            //: if (emoticon)
            if (emoticon)
            {
                //: break;
                break;
            }
        }
    }
    //: return emoticon;
    return emoticon;
}


//: - (NIMInputEmoticon *)emoticonByID:(NSString *)emoticonID
- (LiquidEcstasyEmoticon *)pressed:(NSString *)emoticonID
{
    //: NIMInputEmoticon *emoticon = nil;
    LiquidEcstasyEmoticon *emoticon = nil;
    //: if ([emoticonID length])
    if ([emoticonID length])
    {
        //: for (NIMInputEmoticonCatalog *catalog in _catalogs)
        for (TinCanTeam *catalog in _catalogs)
        {
            //: emoticon = [catalog.id2Emoticons objectForKey:emoticonID];
            emoticon = [catalog.id2Emoticons objectForKey:emoticonID];
            //: if (emoticon)
            if (emoticon)
            {
                //: break;
                break;
            }
        }
    }
    //: return emoticon;
    return emoticon;
}

//: - (NIMInputEmoticon *)emoticonByCatalogID:(NSString *)catalogID
- (LiquidEcstasyEmoticon *)before:(NSString *)catalogID
                           //: emoticonID:(NSString *)emoticonID
                           bubbleId:(NSString *)emoticonID
{
    //: NIMInputEmoticon *emoticon = nil;
    LiquidEcstasyEmoticon *emoticon = nil;
    //: if ([emoticonID length] && [catalogID length])
    if ([emoticonID length] && [catalogID length])
    {
        //: for (NIMInputEmoticonCatalog *catalog in _catalogs)
        for (TinCanTeam *catalog in _catalogs)
        {
            //: if ([catalog.catalogID isEqualToString:catalogID])
            if ([catalog.catalogID isEqualToString:catalogID])
            {
                //: emoticon = [catalog.id2Emoticons objectForKey:emoticonID];
                emoticon = [catalog.id2Emoticons objectForKey:emoticonID];
                //: break;
                break;
            }
        }
    }
    //: return emoticon;
    return emoticon;
}

//: - (void)parsePlist
- (void)rangePlist
{
    //: NSMutableArray *catalogs = [NSMutableArray array];
    NSMutableArray *catalogs = [NSMutableArray array];
    //: NSString *filepath = [NSBundle nim_EmojiPlistFile];
    NSString *filepath = [NSBundle pull];
    //: if (filepath) {
    if (filepath) {
        //: NSArray *array = [NSArray arrayWithContentsOfFile:filepath];
        NSArray *array = [NSArray arrayWithContentsOfFile:filepath];
        //: for (NSDictionary *dict in array)
        for (NSDictionary *dict in array)
        {
            //: NSDictionary *info = dict[@"info"];
            NSDictionary *info = dict[StringFromGainData(str_refugeLeaderTitle)];
            //: NSArray *emoticons = dict[@"data"];
            NSArray *emoticons = dict[StringFromGainData(str_easyText)];

            //: NIMInputEmoticonCatalog *catalog = [self catalogByInfo:info
            TinCanTeam *catalog = [self of:info
                                                     //: emoticons:emoticons];
                                                     titleIn:emoticons];
            //: [catalogs addObject:catalog];
            [catalogs addObject:catalog];
        }
    }

    //: NSString *filegifpath = [NSBundle nim_EmojiGifPlistFile];
    NSString *filegifpath = [NSBundle characteristicRootOfASquareMatrix];
    //: if (filegifpath) {
    if (filegifpath) {
        //: NSArray *array = [NSArray arrayWithContentsOfFile:filegifpath];
        NSArray *array = [NSArray arrayWithContentsOfFile:filegifpath];
        //: for (NSDictionary *dict in array)
        for (NSDictionary *dict in array)
        {
            //: NSDictionary *info = dict[@"info"];
            NSDictionary *info = dict[StringFromGainData(str_refugeLeaderTitle)];
            //: NSArray *emoticons = dict[@"data"];
            NSArray *emoticons = dict[StringFromGainData(str_easyText)];

            //: NIMInputEmoticonCatalog *catalog = [self catalogByInfo:info
            TinCanTeam *catalog = [self of:info
                                                     //: emoticons:emoticons];
                                                     titleIn:emoticons];
            //: [catalogs addObject:catalog];
            [catalogs addObject:catalog];
        }
    }

    //: _catalogs = catalogs;
    _catalogs = catalogs;
}

//: - (NIMInputEmoticonCatalog *)catalogByInfo:(NSDictionary *)info
- (TinCanTeam *)of:(NSDictionary *)info
                             //: emoticons:(NSArray *)emoticonsArray
                             titleIn:(NSArray *)emoticonsArray
{
    //: NIMInputEmoticonCatalog *catalog = [[NIMInputEmoticonCatalog alloc]init];
    TinCanTeam *catalog = [[TinCanTeam alloc]init];
    //: catalog.catalogID = info[@"id"];
    catalog.catalogID = info[@"id"];
    //: catalog.title = info[@"title"];
    catalog.title = info[StringFromGainData(str_concedeChickenValue)];
    //: catalog.icon = info[@"normal"];
    catalog.icon = info[StringFromGainData(str_conservationName)];
    //: catalog.iconPressed = info[@"pressed"];
    catalog.iconPressed = info[StringFromGainData(str_railBottomName)];
    //: NSMutableDictionary *tag2Emoticons = [NSMutableDictionary dictionary];
    NSMutableDictionary *tag2Emoticons = [NSMutableDictionary dictionary];
    //: NSMutableDictionary *id2Emoticons = [NSMutableDictionary dictionary];
    NSMutableDictionary *id2Emoticons = [NSMutableDictionary dictionary];
    //: NSMutableArray *emoticons = [NSMutableArray array];
    NSMutableArray *emoticons = [NSMutableArray array];

    //: for (NSDictionary *emoticonDict in emoticonsArray) {
    for (NSDictionary *emoticonDict in emoticonsArray) {
        //: NIMInputEmoticon *emoticon = [[NIMInputEmoticon alloc] init];
        LiquidEcstasyEmoticon *emoticon = [[LiquidEcstasyEmoticon alloc] init];
        //: emoticon.emoticonID = emoticonDict[@"id"];
        emoticon.emoticonID = emoticonDict[@"id"];
        //: emoticon.tag = emoticonDict[@"tag"];
        emoticon.tag = emoticonDict[StringFromGainData(str_horseLeaderText)];
        //: emoticon.unicode = emoticonDict[@"unicode"];
        emoticon.unicode = emoticonDict[StringFromGainData(str_investigatorText)];
        //: emoticon.filename = emoticonDict[@"file"];
        emoticon.filename = emoticonDict[StringFromGainData(str_rectoTitle)];
        //: emoticon.gif = emoticonDict[@"gif"];
        emoticon.gif = emoticonDict[StringFromGainData(str_analGestureName)];

        //: if (emoticon.emoticonID) {
        if (emoticon.emoticonID) {
            //: [emoticons addObject:emoticon];
            [emoticons addObject:emoticon];
            //: id2Emoticons[emoticon.emoticonID] = emoticon;
            id2Emoticons[emoticon.emoticonID] = emoticon;
        }
        //: if (emoticon.tag) {
        if (emoticon.tag) {
            //: tag2Emoticons[emoticon.tag] = emoticon;
            tag2Emoticons[emoticon.tag] = emoticon;
        }
    }

    //: catalog.emoticons = emoticons;
    catalog.emoticons = emoticons;
    //: catalog.id2Emoticons = id2Emoticons;
    catalog.id2Emoticons = id2Emoticons;
    //: catalog.tag2Emoticons = tag2Emoticons;
    catalog.tag2Emoticons = tag2Emoticons;
    //: return catalog;
    return catalog;
}

//: - (void)preloadEmoticonResource {
- (void)searchion {
    //: dispatch_async(dispatch_get_global_queue(0, 0), ^{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //: for (NIMInputEmoticonCatalog *catalog in _catalogs) {
        for (TinCanTeam *catalog in _catalogs) {
            //: [catalog.emoticons enumerateObjectsUsingBlock:^(NIMInputEmoticon *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [catalog.emoticons enumerateObjectsUsingBlock:^(LiquidEcstasyEmoticon *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                //: if (obj.filename) {
                if (obj.filename) {
                   //: __unused UIImage *image = [UIImage nim_emoticonInKit:obj.filename];
                   __unused UIImage *image = [UIImage pickings:obj.filename];
                }
            //: }];
            }];
        }
    //: });
    });
}

//: @end
@end

Byte * GainDataToCache(Byte *data) {
    int tropicViewImprovement = data[0];
    int combineTheater = data[1];
    int damFile = data[2];
    if (!tropicViewImprovement) return data + damFile;
    for (int i = 0; i < combineTheater / 2; i++) {
        int begin = damFile + i;
        int end = damFile + combineTheater - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[damFile + combineTheater] = 0;
    return data + damFile;
}

NSString *StringFromGainData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)GainDataToCache(data)];
}  
