
#import <Foundation/Foundation.h>

NSString *StringFromTropicByData(Byte *data);


//: errSecItemNotFound
Byte str_sculptName[] = {32, 18, 11, 40, 169, 253, 214, 238, 165, 35, 248, 100, 110, 117, 111, 70, 116, 111, 78, 109, 101, 116, 73, 99, 101, 83, 114, 114, 101, 38};


//: bundle
Byte str_infoImposeValue[] = {8, 6, 11, 60, 68, 177, 119, 177, 128, 191, 170, 101, 108, 100, 110, 117, 98, 98};


//: errSecAuthFailed
Byte str_gelData[] = {27, 16, 5, 186, 180, 100, 101, 108, 105, 97, 70, 104, 116, 117, 65, 99, 101, 83, 114, 114, 101, 191};


//: errSecUnimplemented
Byte str_lifeGoingData[] = {10, 19, 4, 77, 100, 101, 116, 110, 101, 109, 101, 108, 112, 109, 105, 110, 85, 99, 101, 83, 114, 114, 101, 108};


//: errSecDuplicateItem
Byte str_fessValue[] = {56, 19, 9, 222, 118, 91, 183, 108, 164, 109, 101, 116, 73, 101, 116, 97, 99, 105, 108, 112, 117, 68, 99, 101, 83, 114, 114, 101, 194};


//: SAMKeychainErrorBadArguments
Byte str_typicallyData[] = {81, 28, 12, 223, 105, 247, 143, 17, 158, 227, 126, 46, 115, 116, 110, 101, 109, 117, 103, 114, 65, 100, 97, 66, 114, 111, 114, 114, 69, 110, 105, 97, 104, 99, 121, 101, 75, 77, 65, 83, 169};


//: errSecNotAvailable
Byte str_showSorryValue[] = {40, 18, 12, 76, 221, 188, 44, 82, 113, 206, 187, 15, 101, 108, 98, 97, 108, 105, 97, 118, 65, 116, 111, 78, 99, 101, 83, 114, 114, 101, 71};


//: errSecParam
Byte str_changeSchemeValue[] = {18, 11, 9, 205, 117, 204, 96, 121, 164, 109, 97, 114, 97, 80, 99, 101, 83, 114, 114, 101, 124};


//: errSecInteractionNotAllowed
Byte str_indexBlocData[] = {88, 27, 10, 107, 77, 243, 235, 78, 238, 231, 100, 101, 119, 111, 108, 108, 65, 116, 111, 78, 110, 111, 105, 116, 99, 97, 114, 101, 116, 110, 73, 99, 101, 83, 114, 114, 101, 9};


//: errSecDecode
Byte str_introduceValue[] = {16, 12, 6, 158, 122, 212, 101, 100, 111, 99, 101, 68, 99, 101, 83, 114, 114, 101, 159};


//: errSecDefault
Byte str_scanTitle[] = {21, 13, 6, 130, 5, 139, 116, 108, 117, 97, 102, 101, 68, 99, 101, 83, 114, 114, 101, 46};


//: errSecAllocate
Byte str_scheduleRelateYardData[] = {13, 14, 6, 92, 155, 99, 101, 116, 97, 99, 111, 108, 108, 65, 99, 101, 83, 114, 114, 101, 20};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ChemicalElementStatus.m
//  ViewKeychain
//
//  Created by Caleb Davenport on 3/19/13.
//  Copyright (c) 2013-2014 Sam Soffes. All rights reserved.
//

// __M_A_C_R_O__
//: #import "SAMKeychainQuery.h"
#import "ChemicalElementStatus.h"
//: #import "SAMKeychain.h"
#import "ViewKeychain.h"

//: @implementation SAMKeychainQuery
@implementation ChemicalElementStatus

//: @synthesize account = _account;
@synthesize account = _account;
//: @synthesize service = _service;
@synthesize service = _service;
//: @synthesize label = _label;
@synthesize label = _label;
//: @synthesize passwordData = _passwordData;
@synthesize passwordData = _passwordData;


//: @synthesize accessGroup = _accessGroup;
@synthesize accessGroup = _accessGroup;



//: @synthesize synchronizationMode = _synchronizationMode;
@synthesize synchronizationMode = _synchronizationMode;


//: #pragma mark - Public
#pragma mark - Public

//: - (BOOL)save:(NSError *__autoreleasing *)error {
- (BOOL)messageOfShould:(NSError *__autoreleasing *)error {
 //: OSStatus status = SAMKeychainErrorBadArguments;
 OSStatus status = SAMKeychainErrorBadArguments;
 //: if (!self.service || !self.account || !self.passwordData) {
 if (!self.service || !self.account || !self.passwordData) {
  //: if (error) {
  if (error) {
   //: *error = [[self class] errorWithCode:status];
   *error = [[self class] image:status];
  }
  //: return NO;
  return NO;
 }
 //: NSMutableDictionary *query = nil;
 NSMutableDictionary *query = nil;
 //: NSMutableDictionary * searchQuery = [self query];
 NSMutableDictionary * searchQuery = [self bubble];
 //: status = SecItemCopyMatching((__bridge CFDictionaryRef)searchQuery, nil);
 status = SecItemCopyMatching((__bridge CFDictionaryRef)searchQuery, nil);
 //: if (status == errSecSuccess) {
 if (status == errSecSuccess) {//item already exists, update it!
  //: query = [[NSMutableDictionary alloc]init];
  query = [[NSMutableDictionary alloc]init];
  //: [query setObject:self.passwordData forKey:(__bridge id)kSecValueData];
  [query setObject:self.passwordData forKey:(__bridge id)kSecValueData];

  //: CFTypeRef accessibilityType = [SAMKeychain accessibilityType];
  CFTypeRef accessibilityType = [ViewKeychain accessibilityType];
  //: if (accessibilityType) {
  if (accessibilityType) {
   //: [query setObject:(__bridge id)accessibilityType forKey:(__bridge id)kSecAttrAccessible];
   [query setObject:(__bridge id)accessibilityType forKey:(__bridge id)kSecAttrAccessible];
  }

  //: status = SecItemUpdate((__bridge CFDictionaryRef)(searchQuery), (__bridge CFDictionaryRef)(query));
  status = SecItemUpdate((__bridge CFDictionaryRef)(searchQuery), (__bridge CFDictionaryRef)(query));
 //: }else if(status == errSecItemNotFound){
 }else if(status == errSecItemNotFound){//item not found, create it!
  //: query = [self query];
  query = [self bubble];
  //: if (self.label) {
  if (self.label) {
   //: [query setObject:self.label forKey:(__bridge id)kSecAttrLabel];
   [query setObject:self.label forKey:(__bridge id)kSecAttrLabel];
  }
  //: [query setObject:self.passwordData forKey:(__bridge id)kSecValueData];
  [query setObject:self.passwordData forKey:(__bridge id)kSecValueData];

  //: CFTypeRef accessibilityType = [SAMKeychain accessibilityType];
  CFTypeRef accessibilityType = [ViewKeychain accessibilityType];
  //: if (accessibilityType) {
  if (accessibilityType) {
   //: [query setObject:(__bridge id)accessibilityType forKey:(__bridge id)kSecAttrAccessible];
   [query setObject:(__bridge id)accessibilityType forKey:(__bridge id)kSecAttrAccessible];
  }

  //: status = SecItemAdd((__bridge CFDictionaryRef)query, NULL);
  status = SecItemAdd((__bridge CFDictionaryRef)query, NULL);
 }
 //: if (status != errSecSuccess && error != NULL) {
 if (status != errSecSuccess && error != NULL) {
  //: *error = [[self class] errorWithCode:status];
  *error = [[self class] image:status];
 }
 //: return (status == errSecSuccess);}
 return (status == errSecSuccess);}


//: - (BOOL)deleteItem:(NSError *__autoreleasing *)error {
- (BOOL)send:(NSError *__autoreleasing *)error {
 //: OSStatus status = SAMKeychainErrorBadArguments;
 OSStatus status = SAMKeychainErrorBadArguments;
 //: if (!self.service || !self.account) {
 if (!self.service || !self.account) {
  //: if (error) {
  if (error) {
   //: *error = [[self class] errorWithCode:status];
   *error = [[self class] image:status];
  }
  //: return NO;
  return NO;
 }

 //: NSMutableDictionary *query = [self query];
 NSMutableDictionary *query = [self bubble];

 //: status = SecItemDelete((__bridge CFDictionaryRef)query);
 status = SecItemDelete((__bridge CFDictionaryRef)query);
 //: if (status != errSecSuccess && error != NULL) {
 if (status != errSecSuccess && error != NULL) {
  //: *error = [[self class] errorWithCode:status];
  *error = [[self class] image:status];
 }

 //: return (status == errSecSuccess);
 return (status == errSecSuccess);
}


//: - (nullable NSArray *)fetchAll:(NSError *__autoreleasing *)error {
- (nullable NSArray *)view:(NSError *__autoreleasing *)error {
 //: NSMutableDictionary *query = [self query];
 NSMutableDictionary *query = [self bubble];
 //: [query setObject:@YES forKey:(__bridge id)kSecReturnAttributes];
 [query setObject:@YES forKey:(__bridge id)kSecReturnAttributes];
 //: [query setObject:(__bridge id)kSecMatchLimitAll forKey:(__bridge id)kSecMatchLimit];
 [query setObject:(__bridge id)kSecMatchLimitAll forKey:(__bridge id)kSecMatchLimit];

 //: CFTypeRef accessibilityType = [SAMKeychain accessibilityType];
 CFTypeRef accessibilityType = [ViewKeychain accessibilityType];
 //: if (accessibilityType) {
 if (accessibilityType) {
  //: [query setObject:(__bridge id)accessibilityType forKey:(__bridge id)kSecAttrAccessible];
  [query setObject:(__bridge id)accessibilityType forKey:(__bridge id)kSecAttrAccessible];
 }


 //: CFTypeRef result = NULL;
 CFTypeRef result = NULL;
 //: OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
 OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
 //: if (status != errSecSuccess && error != NULL) {
 if (status != errSecSuccess && error != NULL) {
  //: *error = [[self class] errorWithCode:status];
  *error = [[self class] image:status];
  //: return nil;
  return nil;
 }

 //: return (__bridge_transfer NSArray *)result;
 return (__bridge_transfer NSArray *)result;
}


//: - (BOOL)fetch:(NSError *__autoreleasing *)error {
- (BOOL)trap:(NSError *__autoreleasing *)error {
 //: OSStatus status = SAMKeychainErrorBadArguments;
 OSStatus status = SAMKeychainErrorBadArguments;
 //: if (!self.service || !self.account) {
 if (!self.service || !self.account) {
  //: if (error) {
  if (error) {
   //: *error = [[self class] errorWithCode:status];
   *error = [[self class] image:status];
  }
  //: return NO;
  return NO;
 }

 //: CFTypeRef result = NULL;
 CFTypeRef result = NULL;
 //: NSMutableDictionary *query = [self query];
 NSMutableDictionary *query = [self bubble];
 //: [query setObject:@YES forKey:(__bridge id)kSecReturnData];
 [query setObject:@YES forKey:(__bridge id)kSecReturnData];
 //: [query setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
 [query setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
 //: status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
 status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);

 //: if (status != errSecSuccess) {
 if (status != errSecSuccess) {
  //: if (error) {
  if (error) {
   //: *error = [[self class] errorWithCode:status];
   *error = [[self class] image:status];
  }
  //: return NO;
  return NO;
 }

 //: self.passwordData = (__bridge_transfer NSData *)result;
 self.passwordData = (__bridge_transfer NSData *)result;
 //: return YES;
 return YES;
}


//: #pragma mark - Accessors
#pragma mark - Accessors

//: - (void)setPasswordObject:(id<NSCoding>)object {
- (void)setPasswordObject:(id<NSCoding>)object {
 //: self.passwordData = [NSKeyedArchiver archivedDataWithRootObject:object];
 self.passwordData = [NSKeyedArchiver archivedDataWithRootObject:object];
}


//: - (id<NSCoding>)passwordObject {
- (id<NSCoding>)passwordObject {
 //: if ([self.passwordData length]) {
 if ([self.passwordData length]) {
  //: return [NSKeyedUnarchiver unarchiveObjectWithData:self.passwordData];
  return [NSKeyedUnarchiver unarchiveObjectWithData:self.passwordData];
 }
 //: return nil;
 return nil;
}


//: - (void)setPassword:(NSString *)password {
- (void)setPassword:(NSString *)password {
 //: self.passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
 self.passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
}


//: - (NSString *)password {
- (NSString *)password {
 //: if ([self.passwordData length]) {
 if ([self.passwordData length]) {
  //: return [[NSString alloc] initWithData:self.passwordData encoding:NSUTF8StringEncoding];
  return [[NSString alloc] initWithData:self.passwordData encoding:NSUTF8StringEncoding];
 }
 //: return nil;
 return nil;
}


//: #pragma mark - Synchronization Status
#pragma mark - Synchronization Status


//: + (BOOL)isSynchronizationAvailable {
+ (BOOL)range {

 // Apple suggested way to check for 7.0 at runtime
 // https://developer.apple.com/library/ios/documentation/userexperience/conceptual/transitionguide/SupportingEarlieriOS.html
 //: return floor(NSFoundationVersionNumber) > 993.00;
 return floor(NSFoundationVersionNumber) > 993.00;



}



//: #pragma mark - Private
#pragma mark - Private

//: - (NSMutableDictionary *)query {
- (NSMutableDictionary *)bubble {
 //: NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:3];
 NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:3];
 //: [dictionary setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
 [dictionary setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];

 //: if (self.service) {
 if (self.service) {
  //: [dictionary setObject:self.service forKey:(__bridge id)kSecAttrService];
  [dictionary setObject:self.service forKey:(__bridge id)kSecAttrService];
 }

 //: if (self.account) {
 if (self.account) {
  //: [dictionary setObject:self.account forKey:(__bridge id)kSecAttrAccount];
  [dictionary setObject:self.account forKey:(__bridge id)kSecAttrAccount];
 }



 //: if (self.accessGroup) {
 if (self.accessGroup) {
  //: [dictionary setObject:self.accessGroup forKey:(__bridge id)kSecAttrAccessGroup];
  [dictionary setObject:self.accessGroup forKey:(__bridge id)kSecAttrAccessGroup];
 }




 //: if ([[self class] isSynchronizationAvailable]) {
 if ([[self class] range]) {
  //: id value;
  id value;

  //: switch (self.synchronizationMode) {
  switch (self.synchronizationMode) {
   //: case SAMKeychainQuerySynchronizationModeNo: {
   case SAMKeychainQuerySynchronizationModeNo: {
     //: value = @NO;
     value = @NO;
     //: break;
     break;
   }
   //: case SAMKeychainQuerySynchronizationModeYes: {
   case SAMKeychainQuerySynchronizationModeYes: {
     //: value = @YES;
     value = @YES;
     //: break;
     break;
   }
   //: case SAMKeychainQuerySynchronizationModeAny: {
   case SAMKeychainQuerySynchronizationModeAny: {
     //: value = (__bridge id)(kSecAttrSynchronizableAny);
     value = (__bridge id)(kSecAttrSynchronizableAny);
     //: break;
     break;
   }
  }

  //: [dictionary setObject:value forKey:(__bridge id)(kSecAttrSynchronizable)];
  [dictionary setObject:value forKey:(__bridge id)(kSecAttrSynchronizable)];
 }


 //: return dictionary;
 return dictionary;
}


//: + (NSError *)errorWithCode:(OSStatus) code {
+ (NSError *)image:(OSStatus) code {
 //: static dispatch_once_t onceToken;
 static dispatch_once_t onceToken;
 //: static NSBundle *resourcesBundle = nil;
 static NSBundle *resourcesBundle = nil;
 //: _dispatch_once(&onceToken, ^{
 _dispatch_once(&onceToken, ^{
  //: NSURL *url = [[NSBundle bundleForClass:[SAMKeychainQuery class]] URLForResource:@"SAMKeychain" withExtension:@"bundle"];
  NSURL *url = [[NSBundle bundleForClass:[ChemicalElementStatus class]] URLForResource:@"ViewKeychain" withExtension:StringFromTropicByData(str_infoImposeValue)];
  //: resourcesBundle = [NSBundle bundleWithURL:url];
  resourcesBundle = [NSBundle bundleWithURL:url];
 //: });
 });

 //: NSString *message = nil;
 NSString *message = nil;
 //: switch (code) {
 switch (code) {
  //: case errSecSuccess: return nil;
  case errSecSuccess: return nil;
  //: case SAMKeychainErrorBadArguments: message = NSLocalizedStringFromTableInBundle(@"SAMKeychainErrorBadArguments", @"SAMKeychain", resourcesBundle, nil); break;
  case SAMKeychainErrorBadArguments: message = NSLocalizedStringFromTableInBundle(StringFromTropicByData(str_typicallyData), @"ViewKeychain", resourcesBundle, nil); break;


  //: case errSecUnimplemented: {
  case errSecUnimplemented: {
   //: message = NSLocalizedStringFromTableInBundle(@"errSecUnimplemented", @"SAMKeychain", resourcesBundle, nil);
   message = NSLocalizedStringFromTableInBundle(StringFromTropicByData(str_lifeGoingData), @"ViewKeychain", resourcesBundle, nil);
   //: break;
   break;
  }
  //: case errSecParam: {
  case errSecParam: {
   //: message = NSLocalizedStringFromTableInBundle(@"errSecParam", @"SAMKeychain", resourcesBundle, nil);
   message = NSLocalizedStringFromTableInBundle(StringFromTropicByData(str_changeSchemeValue), @"ViewKeychain", resourcesBundle, nil);
   //: break;
   break;
  }
  //: case errSecAllocate: {
  case errSecAllocate: {
   //: message = NSLocalizedStringFromTableInBundle(@"errSecAllocate", @"SAMKeychain", resourcesBundle, nil);
   message = NSLocalizedStringFromTableInBundle(StringFromTropicByData(str_scheduleRelateYardData), @"ViewKeychain", resourcesBundle, nil);
   //: break;
   break;
  }
  //: case errSecNotAvailable: {
  case errSecNotAvailable: {
   //: message = NSLocalizedStringFromTableInBundle(@"errSecNotAvailable", @"SAMKeychain", resourcesBundle, nil);
   message = NSLocalizedStringFromTableInBundle(StringFromTropicByData(str_showSorryValue), @"ViewKeychain", resourcesBundle, nil);
   //: break;
   break;
  }
  //: case errSecDuplicateItem: {
  case errSecDuplicateItem: {
   //: message = NSLocalizedStringFromTableInBundle(@"errSecDuplicateItem", @"SAMKeychain", resourcesBundle, nil);
   message = NSLocalizedStringFromTableInBundle(StringFromTropicByData(str_fessValue), @"ViewKeychain", resourcesBundle, nil);
   //: break;
   break;
  }
  //: case errSecItemNotFound: {
  case errSecItemNotFound: {
   //: message = NSLocalizedStringFromTableInBundle(@"errSecItemNotFound", @"SAMKeychain", resourcesBundle, nil);
   message = NSLocalizedStringFromTableInBundle(StringFromTropicByData(str_sculptName), @"ViewKeychain", resourcesBundle, nil);
   //: break;
   break;
  }
  //: case errSecInteractionNotAllowed: {
  case errSecInteractionNotAllowed: {
   //: message = NSLocalizedStringFromTableInBundle(@"errSecInteractionNotAllowed", @"SAMKeychain", resourcesBundle, nil);
   message = NSLocalizedStringFromTableInBundle(StringFromTropicByData(str_indexBlocData), @"ViewKeychain", resourcesBundle, nil);
   //: break;
   break;
  }
  //: case errSecDecode: {
  case errSecDecode: {
   //: message = NSLocalizedStringFromTableInBundle(@"errSecDecode", @"SAMKeychain", resourcesBundle, nil);
   message = NSLocalizedStringFromTableInBundle(StringFromTropicByData(str_introduceValue), @"ViewKeychain", resourcesBundle, nil);
   //: break;
   break;
  }
  //: case errSecAuthFailed: {
  case errSecAuthFailed: {
   //: message = NSLocalizedStringFromTableInBundle(@"errSecAuthFailed", @"SAMKeychain", resourcesBundle, nil);
   message = NSLocalizedStringFromTableInBundle(StringFromTropicByData(str_gelData), @"ViewKeychain", resourcesBundle, nil);
   //: break;
   break;
  }
  //: default: {
  default: {
   //: message = NSLocalizedStringFromTableInBundle(@"errSecDefault", @"SAMKeychain", resourcesBundle, nil);
   message = NSLocalizedStringFromTableInBundle(StringFromTropicByData(str_scanTitle), @"ViewKeychain", resourcesBundle, nil);
  }




 }

 //: NSDictionary *userInfo = nil;
 NSDictionary *userInfo = nil;
 //: if (message) {
 if (message) {
  //: userInfo = @{ NSLocalizedDescriptionKey : message };
  userInfo = @{ NSLocalizedDescriptionKey : message };
 }
 //: return [NSError errorWithDomain:kSAMKeychainErrorDomain code:code userInfo:userInfo];
 return [NSError errorWithDomain:k_infoEventText code:code userInfo:userInfo];
}

//: @end
@end

Byte * TropicByDataToCache(Byte *data) {
    int balanceSumervention = data[0];
    int refugeeCurious = data[1];
    int activity = data[2];
    if (!balanceSumervention) return data + activity;
    for (int i = 0; i < refugeeCurious / 2; i++) {
        int begin = activity + i;
        int end = activity + refugeeCurious - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[activity + refugeeCurious] = 0;
    return data + activity;
}

NSString *StringFromTropicByData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)TropicByDataToCache(data)];
}  
