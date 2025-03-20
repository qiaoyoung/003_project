#import "UIImage+KEKEZipArchive.h"
#import "SSZipArchiveManager.h"
#import <objc/runtime.h>

@implementation UIImage (KEKEZipArchive)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 交换 imageNamed: 方法的实现
        Method originalMethod = class_getClassMethod([UIImage class], @selector(imageNamed:));
        Method swizzledMethod = class_getClassMethod([UIImage class], @selector(zip_imageNamed:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

+ (UIImage *)zip_imageNamed:(NSString *)name {
    // 先尝试从压缩包中加载
    UIImage *image = [[SSZipArchiveManager sharedManager] zip_imageNamed:name];
    if (image) {
        return image;
    }
    
    // 如果压缩包中没有，则使用原始的 imageNamed: 方法
    return [self zip_imageNamed:name];  // 这里会调用原始的 imageNamed: 方法，因为已经交换了实现
}

@end 
