//
//  CCCContactPerson.h
//  sohunews
//
//  Created by tianyulong on 2019/8/14.
//  Copyright © 2019 Sohu.com. All rights reserved.
//

#import <Contacts/Contacts.h>

@class NIMContactPhone;

typedef NS_ENUM(NSUInteger, SNContactType)
{
    SNContactTypePerson = 0,
    SNContactTypeOrigination,
};

@interface CCCContactPerson : NSObject

/**
 联系人类型
 */
@property (nonatomic) SNContactType contactType;

/**
 姓名
 */
@property (nonatomic, copy) NSString *fullName;

/**
 姓名拼音
 */
@property (nonatomic, copy) NSString *pinyin;

/**
 姓
 */
@property (nonatomic, copy) NSString *familyName;

/**
 名
 */
@property (nonatomic, copy) NSString *givenName;

/**
 姓名前缀
 */
@property (nonatomic, copy) NSString *namePrefix;

/**
 姓名后缀
 */
@property (nonatomic, copy) NSString *nameSuffix;

/**
 昵称
 */
@property (nonatomic, copy) NSString *nickname;

/**
 中间名
 */
@property (nonatomic, copy) NSString *middleName;

/**
 名的拼音或音标
 */
@property (nonatomic, copy) NSString *phoneticGivenName;

/**
 中间名的拼音或音标
 */
@property (nonatomic, copy) NSString *phoneticMiddleName;

/**
 姓的拼音或音标
 */
@property (nonatomic, copy) NSString *phoneticFamilyName;

/**
 电话号码数组
 */
@property (nonatomic, copy) NSArray <NIMContactPhone *> *phones;


/**
 便利构造 （Contacts）

 @param contact 通讯录
 @return 对象
 */
- (instancetype)initWithCNContact:(CNContact *)contact;

@end


/// 电话
@interface NIMContactPhone : NSObject

/**
 电话
 */
@property (nonatomic, copy) NSString *phone;

/**
 标签
 */
@property (nonatomic, copy) NSString *label;

/**
 便利构造 （Contacts）

 @param labeledValue 标签和值
 @return 对象
 */
- (instancetype)initWithLabeledValue:(CNLabeledValue *)labeledValue;

/**
 校验手机号是否合法
 */
+ (BOOL)checkUserfulWithLabeledValue:(CNLabeledValue *)labeledValue;

@end




/// 排序分组模型
@interface LJSectionPerson : NSObject

@property (nonatomic, copy) NSString *key;

@property (nonatomic, copy) NSArray <CCCContactPerson *> *persons;

@end
