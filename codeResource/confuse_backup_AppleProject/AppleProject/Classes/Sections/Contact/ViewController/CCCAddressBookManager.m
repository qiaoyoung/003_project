//
//  CCCAddressBookManager.m
//  sohunews
//
//  Created by tianyulong on 2019/8/14.
//  Copyright © 2019 Sohu.com. All rights reserved.
//

#import "CCCAddressBookManager.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
#import "NSString+LJExtension.h"

@interface CCCAddressBookManager () <CNContactViewControllerDelegate, CNContactPickerDelegate>

@property (nonatomic, copy) NSArray *keys;
@property (nonatomic, strong) CNContactStore *contactStore;
@property (nonatomic) dispatch_queue_t queue;

@end

@implementation CCCAddressBookManager

dSINGLETON_FOR_CLASS(CCCAddressBookManager);

- (instancetype)init {
    self = [super init];
    if (self)
    {
        _queue = dispatch_queue_create("com.addressBook.queue", DISPATCH_QUEUE_SERIAL);
        _contactStore = [CNContactStore new];
    }
    return self;
}

- (NSArray *)keys {
    if (!_keys)
    {
        _keys = @[[CNContactFormatter descriptorForRequiredKeysForStyle:CNContactFormatterStyleFullName],
                  CNContactPhoneNumbersKey,
                  CNContactPhoneticGivenNameKey,
                  CNContactPhoneticFamilyNameKey,
                  CNContactPhoneticMiddleNameKey,
                  CNContactBirthdayKey,
                  CNContactNonGregorianBirthdayKey];
        
    }
    return _keys;
}

#pragma mark - Public

- (void)accessContactsWithMobileComplection:(void (^)(BOOL succeed, NSArray <NSDictionary *> *mobileContacts))completcion {
    [self accessContactsComplection:^(BOOL succeed, NSArray<CCCContactPerson *> *contacts) {
        
        /// 用户禁止授权访问通讯录权限
        if (!succeed) {
            completcion(succeed,nil);
            return ;
        }
        
        /// 通讯录联系人列表数量
        NSMutableArray *mobileContactsResult = [NSMutableArray array];
        if (contacts.count > 0) {
            for (CCCContactPerson *person in contacts) {
                for (NIMContactPhone *model in person.phones) {
                    NSDictionary *personResult = @{
                                                   @"n":person.fullName ? person.fullName : model.phone,
                                                   @"m":model.phone
                                                   };
                    [mobileContactsResult addObject:personResult];
                }
            }
            completcion(succeed,mobileContactsResult);
        } else {
            completcion(succeed,mobileContactsResult);
        }
    }];
}


- (void)accessContactsComplection:(void (^)(BOOL, NSArray<CCCContactPerson *> *))completcion {
    [self requestAddressBookAuthorization:^(BOOL authorization) {
        
        if (authorization)
        {
            [self _asynAccessContactStoreWithSort:NO completcion:^(NSArray *datas, NSArray *keys) {
                if (nil != completcion) {
                    completcion(YES, datas);
                }
            }];
        }
        else
        {
            if (completcion)
            {
                completcion(NO, nil);
            }
        }
    }];
}

- (void)accessSectionContactsComplection:(void (^)(BOOL, NSArray<LJSectionPerson *> *, NSArray<NSString *> *))completcion {
  
    [self requestAddressBookAuthorization:^(BOOL authorization) {
        
        if (authorization)
        {
            [self _asynAccessContactStoreWithSort:YES completcion:^(NSArray *datas, NSArray *keys) {
                
                if (nil != completcion) {
                    completcion(YES, datas, keys);
                }
            }];
        }
        else
        {
            if (completcion)
            {
                completcion(NO, nil, nil);
            }
        }
    }];
}

- (void)requestAddressBookAuthorization:(void (^)(BOOL authorization))completion {
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    
    if (status == CNAuthorizationStatusNotDetermined)
    {
        [self _authorizationAddressBook:^(BOOL succeed) {
            _blockExecute(completion, succeed);
        }];
    }
    else
    {
        _blockExecute(completion, status == CNAuthorizationStatusAuthorized);
    }
}

#pragma mark - Private

- (void)_authorizationAddressBook:(void (^) (BOOL succeed))completion {
    [_contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (nil != completion) {
            completion(granted);
        }
    }];
}

void _blockExecute(void (^completion)(BOOL authorizationA), BOOL authorizationB) {
    if (completion)
    {
        if ([NSThread isMainThread])
        {
            completion(authorizationB);
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(authorizationB);
            });
        }
    }
}

- (void)showAlertFromController:(UIViewController *)controller {
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您的通讯录暂未允许访问，请去设置->隐私里面授权!" preferredStyle:UIAlertControllerStyleAlert];
    [alertControl addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }])];
    [alertControl addAction:([UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            }];
        }
    }])];
    [controller presentViewController:alertControl animated:YES completion:nil];
}

- (void)_asynAccessContactStoreWithSort:(BOOL)isSort completcion:(void (^)(NSArray *, NSArray *))completcion {
    __weak typeof(self) weakSelf = self;
    dispatch_async(_queue, ^{
        
        NSMutableArray *datas = [NSMutableArray array];
        CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:self.keys];
        [weakSelf.contactStore enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
            
            CCCContactPerson *person = [[CCCContactPerson alloc] initWithCNContact:contact];
            [datas addObject:person];
            
        }];
        
        if (!isSort)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (completcion)
                {
                    completcion(datas, nil);
                }
                
            });
            
            return;
        }
        
        [self _sortNameWithDatas:datas completcion:^(NSArray *persons, NSArray *keys) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (completcion)
                {
                    completcion(persons, keys);
                }
                
            });
            
        }];
        
    });
}

- (void)_sortNameWithDatas:(NSArray *)datas completcion:(void (^)(NSArray *, NSArray *))completcion {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    for (CCCContactPerson *person in datas)
    {
        // 拼音首字母
        NSString *firstLetter = nil;
        
        if (person.fullName.length == 0)
        {
            firstLetter = @"#";
        }
        else
        {
            NSString *pinyinString = [NSString lj_pinyinForString:person.fullName];
            person.pinyin = pinyinString;
            NSString *upperStr = [[pinyinString substringToIndex:1] uppercaseString];
            NSString *regex = @"^[A-Z]$";
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
            firstLetter = [predicate evaluateWithObject:upperStr] ? upperStr : @"#";
        }
        
        if (dict[firstLetter])
        {
            [dict[firstLetter] addObject:person];
        }
        else
        {
            NSMutableArray *arr = [NSMutableArray arrayWithObjects:person, nil];
            dict[firstLetter] = arr;
        }
    }
    
    NSMutableArray *keys = [[[dict allKeys] sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
    
    if ([keys.firstObject isEqualToString:@"#"])
    {
        [keys addObject:keys.firstObject];
        [keys removeObjectAtIndex:0];
    }
    
    NSMutableArray *persons = [NSMutableArray array];
    
    [keys enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL * _Nonnull stop) {
        
        LJSectionPerson *person = [LJSectionPerson new];
        person.key = key;
        
        // 组内按照拼音排序
        NSArray *personsArr = [dict[key] sortedArrayUsingComparator:^NSComparisonResult(CCCContactPerson *person1, CCCContactPerson *person2) {
            
            NSComparisonResult result = [person1.pinyin compare:person2.pinyin];
            return result;
        }];
        
        person.persons = personsArr;
        
        [persons addObject:person];
    }];
    
    if (completcion)
    {
        completcion(persons, keys);
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CNContactStoreDidChangeNotification object:nil];
}


@end
