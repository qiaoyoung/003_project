//
//  CCCContactPerson.m
//  sohunews
//
//  Created by tianyulong on 2019/8/14.
//  Copyright © 2019 Sohu.com. All rights reserved.
//

#import "CCCContactPerson.h"
#import "NSString+LJExtension.h"

@implementation CCCContactPerson

- (instancetype)initWithCNContact:(CNContact *)contact {
    self = [super init];
    if (self)
    {
        self.contactType = contact.contactType == CNContactTypePerson ? SNContactTypePerson : SNContactTypeOrigination;
        
        self.fullName = [CNContactFormatter stringFromContact:contact style:CNContactFormatterStyleFullName];
        self.familyName = contact.familyName;
        self.givenName = contact.givenName;
        self.nameSuffix = contact.nameSuffix;
        self.namePrefix = contact.namePrefix;
        self.nickname = contact.nickname;
        self.middleName = contact.middleName;
     
        if ([contact isKeyAvailable:CNContactPhoneticFamilyNameKey])
        {
            self.phoneticFamilyName = contact.phoneticFamilyName;
        }
        if ([contact isKeyAvailable:CNContactPhoneticGivenNameKey])
        {
            self.phoneticGivenName = contact.phoneticGivenName;
        }
        
        if ([contact isKeyAvailable:CNContactPhoneticMiddleNameKey])
        {
            self.phoneticMiddleName = contact.phoneticMiddleName;
        }
        
        if ([contact isKeyAvailable:CNContactPhoneNumbersKey])
        {
            // 号码
            NSMutableArray *phones = [NSMutableArray array];
            for (CNLabeledValue *labeledValue in contact.phoneNumbers)
            {
                if ([NIMContactPhone checkUserfulWithLabeledValue:labeledValue]) {
                    NIMContactPhone *phoneModel = [[NIMContactPhone alloc] initWithLabeledValue:labeledValue];
                    [phones addObject:phoneModel];
                }
            }
            self.phones = phones;
        }
    }
    return self;
}

@end

@implementation NIMContactPhone

- (instancetype)initWithLabeledValue:(CNLabeledValue *)labeledValue {
    self = [super init];
    if (self)
    {
        CNPhoneNumber *phoneValue = labeledValue.value;
        NSString *phoneNumber = phoneValue.stringValue;
        self.phone = [NSString lj_filterSpecialString:phoneNumber];
        self.label = [CNLabeledValue localizedStringForLabel:labeledValue.label];
    }
    return self;
}

+ (BOOL)checkUserfulWithLabeledValue:(CNLabeledValue *)labeledValue {
    CNPhoneNumber *phoneValue = labeledValue.value;
    NSString *phoneNumber = phoneValue.stringValue;
    NSString *userful = [NSString lj_filterSpecialString:phoneNumber];
    
    if (userful.length == 11 && [[userful substringToIndex:1] isEqualToString:kConstant_1]) {
        return YES;
    }
    return NO;
}

@end


@implementation LJSectionPerson


@end


