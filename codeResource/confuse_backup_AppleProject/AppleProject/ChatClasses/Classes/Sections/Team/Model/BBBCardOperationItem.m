//
//  TeamCardOperationItem.m
//  NIM
//
//  Created by chris on 15/3/5.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "BBBCardOperationItem.h"
#import "UIImage+AppleProjectKit.h"
#import "CCCGlobalMacro.h"

@interface BBBCardOperationItem()

@property(nonatomic,assign) NIMKitCardHeaderOpeator opera;

@end

@implementation BBBCardOperationItem

- (instancetype)initWithOperation:(NIMKitCardHeaderOpeator)opera{
    self = [self init];
    if (self) {
        [self buildWithTeamCardOperation:opera];
    }
    return self;
}

- (void)buildWithTeamCardOperation:(NIMKitCardHeaderOpeator)opera{
    _opera = opera;
    switch (opera) {
        case CardHeaderOpeatorAdd:
            _title          = @"加入".nim_localized;
            _imageNormal    = [UIImage imageNamed:@"icon_add_normal"];
            _imageHighLight = [UIImage imageNamed:@"icon_add_pressed"];
            break;
        case CardHeaderOpeatorRemove:
            _title          = @"移除".nim_localized;
            _imageNormal    = [UIImage imageNamed:@"icon_remove_normal"];
            _imageHighLight = [UIImage imageNamed:@"icon_remove_pressed"];
            break;
        default:
            break;
    }
}

- (NSString*)teamId {
    return @"";
}

- (NSString*)userId {
    return @"";
}

- (NIMTeamMemberType)userType {
    return NIMTeamMemberTypeNormal;
}

- (void)setUserType:(NIMTeamMemberType)userType {}

- (NIMTeamType)teamType {
    return NIMTeamTypeNormal;
}


- (NSString*)imageUrl {
    return nil;
}

- (NSString*)inviterAccid {
    return nil;
}

- (BOOL)isMuted {
    return NO;
}

- (BOOL)isMyUserId {
    return NO;
}

@end
