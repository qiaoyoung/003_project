// __DEBUG__
// __CLOSE_PRINT__
//
//  ColorCache.m
// Indicator
//
//  Created by chris on 2016/12/8.
//  Copyright © 2016年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAInputAtCache.h"
#import "ColorCache.h"

//: @interface AAAInputAtCache()
@interface ColorCache()

//: @property (nonatomic,strong) NSMutableArray *items;
@property (nonatomic,strong) NSMutableArray *items;

//: @end
@end

//: @implementation AAAInputAtCache
@implementation ColorCache

//: - (instancetype)init
- (instancetype)init
{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _items = [[NSMutableArray alloc] init];
        _items = [[NSMutableArray alloc] init];
    }
    //: return self;
    return self;
}

//: - (NSArray *)allAtUid:(NSString *)sendText;
- (NSArray *)data:(NSString *)sendText;
{
    //: NSArray *names = [self matchString:sendText];
    NSArray *names = [self name:sendText];
    //: NSMutableArray *uids = [[NSMutableArray alloc] init];
    NSMutableArray *uids = [[NSMutableArray alloc] init];
    //: for (NSString *name in names) {
    for (NSString *name in names) {
        //: NIMInputAtItem *item = [self item:name];
        ShowOfItem *item = [self pinForLight:name];
        //: if (item)
        if (item)
        {
            //: [uids addObject:item.uid];
            [uids addObject:item.uid];
        }
    }
    //: return [NSArray arrayWithArray:uids];
    return [NSArray arrayWithArray:uids];
}


//: - (void)clean
- (void)show
{
    //: [self.items removeAllObjects];
    [self.items removeAllObjects];
}

//: - (void)addAtItem:(NIMInputAtItem *)item
- (void)inputChemicalElement:(ShowOfItem *)item
{
    //: [_items addObject:item];
    [_items addObject:item];
}

//: - (NIMInputAtItem *)item:(NSString *)name
- (ShowOfItem *)pinForLight:(NSString *)name
{
    //: __block NIMInputAtItem *item;
    __block ShowOfItem *item;
    //: [_items enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    [_items enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //: NIMInputAtItem *object = obj;
        ShowOfItem *object = obj;
        //: if ([object.name isEqualToString:name])
        if ([object.name isEqualToString:name])
        {
            //: item = object;
            item = object;
            //: *stop = YES;
            *stop = YES;
        }
    //: }];
    }];
    //: return item;
    return item;
}

//: - (NIMInputAtItem *)removeName:(NSString *)name
- (ShowOfItem *)complete:(NSString *)name
{
    //: __block NIMInputAtItem *item;
    __block ShowOfItem *item;
    //: [_items enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    [_items enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //: NIMInputAtItem *object = obj;
        ShowOfItem *object = obj;
        //: if ([object.name isEqualToString:name]) {
        if ([object.name isEqualToString:name]) {
            //: item = object;
            item = object;
            //: *stop = YES;
            *stop = YES;
        }
    //: }];
    }];
    //: if (item) {
    if (item) {
        //: [_items removeObject:item];
        [_items removeObject:item];
    }
    //: return item;
    return item;
}

//: - (NSArray *)matchString:(NSString *)sendText
- (NSArray *)name:(NSString *)sendText
{
    //: NSString *pattern = [NSString stringWithFormat:@"%@([^%@]+)%@",@"@",@"\u2004",@"\u2004"];
    NSString *pattern = [NSString stringWithFormat:@"%@([^%@]+)%@",@"@",@"\u2004",@"\u2004"];
    //: NSError *error = nil;
    NSError *error = nil;
    //: NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    //: NSArray *results = [regex matchesInString:sendText options:0 range:NSMakeRange(0, sendText.length)];
    NSArray *results = [regex matchesInString:sendText options:0 range:NSMakeRange(0, sendText.length)];
    //: NSMutableArray *matchs = [[NSMutableArray alloc] init];
    NSMutableArray *matchs = [[NSMutableArray alloc] init];
    //: for (NSTextCheckingResult *result in results) {
    for (NSTextCheckingResult *result in results) {
        //: NSString *name = [sendText substringWithRange:result.range];
        NSString *name = [sendText substringWithRange:result.range];
        //: name = [name substringFromIndex:1];
        name = [name substringFromIndex:1];
        //: name = [name substringToIndex:name.length -1];
        name = [name substringToIndex:name.length -1];
        //: [matchs addObject:name];
        [matchs addObject:name];
    }
    //: return matchs;
    return matchs;
}


//: @end
@end


//: @implementation NIMInputAtItem
@implementation ShowOfItem

//: @end
@end