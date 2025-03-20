//
//  NSObject+tyl_internalIdentifier.m
//  NIM
//
//  Created by 田玉龙 on 2023/12/5.
//  Copyright © 2023 Netease. All rights reserved.
//

#import "NSObject+tyl_internalIdentifier.h"
#import <objc/runtime.h>

@implementation NSObject (tyl_internalIdentifier)

- (void)setTyl_internalIdentifier:(NSString *)tyl_internalIdentifier{
    objc_setAssociatedObject(self, @selector(tyl_internalIdentifier), tyl_internalIdentifier, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)tyl_internalIdentifier{
    return objc_getAssociatedObject(self, _cmd);
}

@end
