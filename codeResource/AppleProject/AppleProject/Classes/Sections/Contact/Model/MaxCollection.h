// __DEBUG__
// __CLOSE_PRINT__
//
//  MaxCollection.h
//  NIM
//
//  Created by Xuhui on 15/3/2.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @protocol NTESGroupMemberProtocol <NSObject>
@protocol TextStatus <NSObject>

- (NSString *)groupTitle;

- (NSString *)memberId;

- (id)sortKey;

//: @end
@end

//: @interface NTESGroupedDataCollection : NSObject
@interface MaxCollection : NSObject

//: @property (nonatomic, strong) NSArray *members;
@property (nonatomic, strong) NSArray *members;
//: @property (nonatomic, copy) NSComparator groupTitleComparator;
@property (nonatomic, copy) NSComparator groupTitleComparator;
//: @property (nonatomic, copy) NSComparator groupMemberComparator;
@property (nonatomic, copy) NSComparator groupMemberComparator;
//: @property (nonatomic, readonly) NSArray *sortedGroupTitles;
@property (nonatomic, readonly) NSArray *sortedGroupTitles;

//: - (void)addGroupMember:(id<NTESGroupMemberProtocol>)member;
- (void)manager:(id<TextStatus>)member;

//: - (void)removeGroupMember:(id<NTESGroupMemberProtocol>)member;
- (void)electronShellText:(id<TextStatus>)member;

//: - (void)addGroupAboveWithTitle:(NSString *)title members:(NSArray *)members;
- (void)of:(NSString *)title actinoid:(NSArray *)members;

//: - (NSString *)titleOfGroup:(NSInteger)groupIndex;
- (NSString *)group:(NSInteger)groupIndex;

//: - (NSArray *)membersOfGroup:(NSInteger)groupIndex;
- (NSArray *)simulation:(NSInteger)groupIndex;

//: - (id<NTESGroupMemberProtocol>)memberOfIndex:(NSIndexPath *)indexPath;
- (id<TextStatus>)name:(NSIndexPath *)indexPath;

//: - (id<NTESGroupMemberProtocol>)memberOfId:(NSString *)uid;
- (id<TextStatus>)sub:(NSString *)uid;

//: - (NSInteger)groupCount;
- (NSInteger)info;

//: - (NSInteger)memberCountOfGroup:(NSInteger)groupIndex;
- (NSInteger)begin:(NSInteger)groupIndex;

//: @end
@end
