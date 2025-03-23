
#import <Foundation/Foundation.h>

NSString *StringFromConcentrateOffData(Byte *data);


//: contentOffset
Byte str_workValue[] = {21, 13, 4, 12, 199, 199, 80, 121, 205, 236, 217, 202, 103, 115, 114, 120, 105, 114, 120, 83, 106, 106, 119, 105, 120, 253};

// __DEBUG__
// __CLOSE_PRINT__
//
//  UIScrollView+From.m
//  NIM
//
//  Created by chris on 16/1/24.
//  Copyright © 2016年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "UIScrollView+NTESDirection.h"
#import "UIScrollView+From.h"
//: #import <objc/runtime.h>
#import <objc/runtime.h>

//: @interface UIScrollView ()
@interface UIScrollView ()
//: @property (assign, nonatomic) NTESScrollViewDirection horizontalScrollingDirection;
@property (assign, nonatomic) NTESScrollViewDirection horizontalScrollingDirection;
//: @property (assign, nonatomic) NTESScrollViewDirection verticalScrollingDirection;
@property (assign, nonatomic) NTESScrollViewDirection verticalScrollingDirection;
//: @end
@end


//: static const char horizontalScrollingDirectionKey;
static const char k_itemCommentData;
//: static const char verticalScrollingDirectionKey;
static const char k_centerText;


//: @implementation UIScrollView (NTESDirection)
@implementation UIScrollView (From)

//: - (void)startObservingDirection
- (void)assemblage
{
    //: [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self addObserver:self forKeyPath:StringFromConcentrateOffData(str_workValue) options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

//: - (void)stopObservingDirection
- (void)show
{
    //: [self removeObserver:self forKeyPath:@"contentOffset"];
    [self removeObserver:self forKeyPath:StringFromConcentrateOffData(str_workValue)];
}

//: - (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //: if (![keyPath isEqualToString:@"contentOffset"]) return;
    if (![keyPath isEqualToString:StringFromConcentrateOffData(str_workValue)]) return;

    //: CGPoint newContentOffset = [[change valueForKey:NSKeyValueChangeNewKey] CGPointValue];
    CGPoint newContentOffset = [[change valueForKey:NSKeyValueChangeNewKey] CGPointValue];
    //: CGPoint oldContentOffset = [[change valueForKey:NSKeyValueChangeOldKey] CGPointValue];
    CGPoint oldContentOffset = [[change valueForKey:NSKeyValueChangeOldKey] CGPointValue];

    //: if (oldContentOffset.x < newContentOffset.x) {
    if (oldContentOffset.x < newContentOffset.x) {
        //: self.horizontalScrollingDirection = NTESScrollViewDirectionRight;
        self.horizontalScrollingDirection = NTESScrollViewDirectionRight;
    //: } else if (oldContentOffset.x > newContentOffset.x) {
    } else if (oldContentOffset.x > newContentOffset.x) {
        //: self.horizontalScrollingDirection = NTESScrollViewDirectionLeft;
        self.horizontalScrollingDirection = NTESScrollViewDirectionLeft;
    //: } else {
    } else {
        //: self.horizontalScrollingDirection = NTESScrollViewDirectionNone;
        self.horizontalScrollingDirection = NTESScrollViewDirectionNone;
    }

    //: if (oldContentOffset.y < newContentOffset.y) {
    if (oldContentOffset.y < newContentOffset.y) {
        //: self.verticalScrollingDirection = NTESScrollViewDirectionDown;
        self.verticalScrollingDirection = NTESScrollViewDirectionDown;
    //: } else if (oldContentOffset.y > newContentOffset.y) {
    } else if (oldContentOffset.y > newContentOffset.y) {
        //: self.verticalScrollingDirection = NTESScrollViewDirectionUp;
        self.verticalScrollingDirection = NTESScrollViewDirectionUp;
    //: } else {
    } else {
        //: self.verticalScrollingDirection = NTESScrollViewDirectionNone;
        self.verticalScrollingDirection = NTESScrollViewDirectionNone;
    }
}

//: #pragma mark - Properties
#pragma mark - Properties
//: - (NTESScrollViewDirection)horizontalScrollingDirection
- (NTESScrollViewDirection)horizontalScrollingDirection
{
    //: return [objc_getAssociatedObject(self, (void *)&horizontalScrollingDirectionKey) intValue];
    return [objc_getAssociatedObject(self, (void *)&k_itemCommentData) intValue];
}

//: - (void)setHorizontalScrollingDirection:(NTESScrollViewDirection)horizontalScrollingDirection
- (void)setHorizontalScrollingDirection:(NTESScrollViewDirection)horizontalScrollingDirection
{
    //: objc_setAssociatedObject(self, (void *)&horizontalScrollingDirectionKey, [NSNumber numberWithInt:horizontalScrollingDirection], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, (void *)&k_itemCommentData, [NSNumber numberWithInt:horizontalScrollingDirection], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//: - (NTESScrollViewDirection)verticalScrollingDirection
- (NTESScrollViewDirection)verticalScrollingDirection
{
    //: return [objc_getAssociatedObject(self, (void *)&verticalScrollingDirectionKey) intValue];
    return [objc_getAssociatedObject(self, (void *)&k_centerText) intValue];
}

//: - (void)setVerticalScrollingDirection:(NTESScrollViewDirection)verticalScrollingDirection
- (void)setVerticalScrollingDirection:(NTESScrollViewDirection)verticalScrollingDirection
{
    //: objc_setAssociatedObject(self, (void *)&verticalScrollingDirectionKey, [NSNumber numberWithInt:verticalScrollingDirection], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, (void *)&k_centerText, [NSNumber numberWithInt:verticalScrollingDirection], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


//: @end
@end

Byte * ConcentrateOffDataToCache(Byte *data) {
    int breakfast = data[0];
    int goingInnovativeRule = data[1];
    Byte nome = data[2];
    int horse = data[3];
    if (!breakfast) return data + horse;
    for (int i = horse; i < horse + goingInnovativeRule; i++) {
        int value = data[i] - nome;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[horse + goingInnovativeRule] = 0;
    return data + horse;
}

NSString *StringFromConcentrateOffData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ConcentrateOffDataToCache(data)];
}
