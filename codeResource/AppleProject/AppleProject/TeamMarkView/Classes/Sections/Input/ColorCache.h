// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMInputAtManager.h
// Indicator
//
//  Created by chris on 2016/12/8.
//  Copyright © 2016年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @interface NIMInputAtItem : NSObject
@interface ShowOfItem : NSObject

//: @property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *name;

//: @property (nonatomic,copy) NSString *uid;
@property (nonatomic,copy) NSString *uid;

//: @property (nonatomic,assign) NSRange range;
@property (nonatomic,assign) NSRange range;

//: @end
@end

//: @interface AAAInputAtCache : NSObject
@interface ColorCache : NSObject

//: - (NSArray *)allAtUid:(NSString *)sendText;
- (NSArray *)data:(NSString *)sendText;

//: - (void)clean;
- (void)show;

//: - (void)addAtItem:(NIMInputAtItem *)item;
- (void)inputChemicalElement:(ShowOfItem *)item;

//: - (NIMInputAtItem *)item:(NSString *)name;
- (ShowOfItem *)pinForLight:(NSString *)name;

//: - (NIMInputAtItem *)removeName:(NSString *)name;
- (ShowOfItem *)complete:(NSString *)name;

//: @end
@end