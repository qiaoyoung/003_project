//
//  SNSingletonMacro.h
//  sohunews
//
//  Created by tianyulong on 2018/8/31.
//  Copyright © 2018年 Sohu.com. All rights reserved.
//

#ifndef SNSingletonMacro_h
#define SNSingletonMacro_h

#if __has_feature(objc_arc)

#define dSINGLETON_FOR_CLASS_HEADER(classname) \
+ (instancetype)sharedInstance;

#define dSINGLETON_FOR_CLASS(classname) \
+ (instancetype)sharedInstance \
{ \
    static classname *shared##classname = nil; \
    static dispatch_once_t pred; \
    dispatch_once(&pred, ^{ shared##classname = [[classname alloc] init]; }); \
    return shared##classname; \
}

#else

#define dSINGLETON_FOR_CLASS_HEADER(classname) \
+ (instancetype)sharedInstance;

#define dSINGLETON_FOR_CLASS(classname) \
\
+ (instancetype)sharedInstance \
{ \
    static classname *shared##classname = nil; \
    static dispatch_once_t pred; \
    dispatch_once(&pred, ^{ shared##classname = [[classname alloc] init]; }); \
    return shared##classname; \
}

#endif

#endif /* SNSingletonMacro_h */
