// __DEBUG__
// __CLOSE_PRINT__
//
//  ContentItem.h
//  NIM
//
//  Created by chris on 15/2/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "NTESContactDefines.h"
#import "NTESContactDefines.h"
//: #import "NTESGroupedContacts.h"
#import "NameDataCollection.h"

//: @interface NTESContactUtilItem : NSObject<NTESContactItemCollection>
@interface ContentItem : NSObject<ItemCollection>

//: @property (nonatomic,copy) NSArray *members;
@property (nonatomic,copy) NSArray *members;

//: @end
@end

//: @interface NTESContactUtilMember : NSObject<NTESContactItem, NTESGroupMemberProtocol>
@interface TingChildMode : NSObject<StateHide, TextStatus>

//: @property (nonatomic,copy) NSString *nick;
@property (nonatomic,copy) NSString *nick;

//: @property (nonatomic,copy) NSString *badge;
@property (nonatomic,copy) NSString *badge;

//: @property (nonatomic,copy) UIImage *icon;
@property (nonatomic,copy) UIImage *icon;

//: @property (nonatomic,copy) NSString *vcName;
@property (nonatomic,copy) NSString *vcName;

//: @property (nonatomic,copy) NSString *userId;
@property (nonatomic,copy) NSString *userId;

//: @property (nonatomic,copy) NSString *selName;
@property (nonatomic,copy) NSString *selName;

//: @end
@end