// __DEBUG__
// __CLOSE_PRINT__
//
//  MinProxy.m
//  SGQRCodeExample
//
//  Created by kingsic on 2022/7/2.
//

// __M_A_C_R_O__
//: #import "SGWeakProxy.h"
#import "MinProxy.h"

//: @interface SGWeakProxy ()
@interface MinProxy ()
//: @property (nonatomic, weak) id target;
@property (nonatomic, weak) id target;
//: @end
@end

//: @implementation SGWeakProxy
@implementation MinProxy

//: + (instancetype)weakProxyWithTarget:(id)aTarget {
+ (instancetype)lightGreen:(id)aTarget {
    //: SGWeakProxy *weakProxy = [SGWeakProxy alloc];
    MinProxy *weakProxy = [MinProxy alloc];
    //: weakProxy.target = aTarget;
    weakProxy.target = aTarget;
    //: return weakProxy;
    return weakProxy;
}


//: - (id)forwardingTargetForSelector:(SEL)selector {
- (id)forwardingTargetForSelector:(SEL)selector {
    //: return _target;
    return _target;
}

//: - (void)forwardInvocation:(NSInvocation *)invocation {
- (void)forwardInvocation:(NSInvocation *)invocation {
    //: void *nullPointer = NULL;
    void *nullPointer = NULL;
    //: [invocation setReturnValue:&nullPointer];
    [invocation setReturnValue:&nullPointer];
}

//: - (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    //: return [NSObject instanceMethodSignatureForSelector:@selector(init)];
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

//: @end
@end