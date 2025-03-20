#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (KEKEZipArchive)

/**
 * 重写 imageNamed: 方法，优先从压缩包中加载图片
 * 如果压缩包中没有找到，则回退到原始的 imageNamed: 方法
 */
+ (UIImage *)zip_imageNamed:(NSString *)name;

@end

NS_ASSUME_NONNULL_END 
