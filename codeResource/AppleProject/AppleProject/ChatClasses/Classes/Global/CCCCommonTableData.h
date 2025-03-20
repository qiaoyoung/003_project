// __DEBUG__
// __CLOSE_PRINT__
//
//  CCCCommonTableData.h
//  NIM
//
//  Created by chris on 15/6/26.
//  Copyright © 2015年 Netease. All rights reserved.
//
//section key
//row key
//common key

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @interface NIMCommonTableSection : NSObject
@interface ImageSection : NSObject

//: @property (nonatomic,copy) NSString *headerTitle;
@property (nonatomic,copy) NSString *headerTitle;

//: @property (nonatomic,copy) NSArray *rows;
@property (nonatomic,copy) NSArray *rows;

//: @property (nonatomic,copy) NSString *footerTitle;
@property (nonatomic,copy) NSString *footerTitle;

//: @property (nonatomic,assign) CGFloat uiHeaderHeight;
@property (nonatomic,assign) CGFloat uiHeaderHeight;

//: @property (nonatomic,assign) CGFloat uiFooterHeight;
@property (nonatomic,assign) CGFloat uiFooterHeight;

//: - (instancetype) initWithDict:(NSDictionary *)dict;
- (instancetype) initWithCocktailLoungeDict:(NSDictionary *)dict;

//: + (NSArray *)sectionsWithData:(NSArray *)data;
+ (NSArray *)max:(NSArray *)data;

//: @end
@end




//: @interface NIMCommonTableRow : NSObject
@interface ChildMessage : NSObject

//: @property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *title;

//: @property (nonatomic,copy ) NSString *detailTitle;
@property (nonatomic,copy ) NSString *detailTitle;

//: @property (nonatomic,copy ) NSString *cellClassName;
@property (nonatomic,copy ) NSString *cellClassName;

//: @property (nonatomic,copy ) NSString *cellActionName;
@property (nonatomic,copy ) NSString *cellActionName;

//: @property (nonatomic,assign) CGFloat uiRowHeight;
@property (nonatomic,assign) CGFloat uiRowHeight;

//: @property (nonatomic,assign) CGFloat sepLeftEdge;
@property (nonatomic,assign) CGFloat sepLeftEdge;

//: @property (nonatomic,assign) BOOL showAccessory;
@property (nonatomic,assign) BOOL showAccessory;

//: @property (nonatomic,assign) BOOL forbidSelect;
@property (nonatomic,assign) BOOL forbidSelect;

//: @property (nonatomic,assign) BOOL userInteractionDisable;
@property (nonatomic,assign) BOOL userInteractionDisable;

//: @property (nonatomic,strong) id extraInfo;
@property (nonatomic,strong) id extraInfo;

//: @property (nonatomic,strong) NSString *language;
@property (nonatomic,strong) NSString *language;

//: - (instancetype)initWithDict:(NSDictionary *)dict;
- (instancetype)initWithStreetwise:(NSDictionary *)dict;

//: + (NSArray *)rowsWithData:(NSArray *)data;
+ (NSArray *)red:(NSArray *)data;

//: @end
@end