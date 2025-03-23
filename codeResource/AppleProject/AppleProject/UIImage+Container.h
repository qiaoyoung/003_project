// __DEBUG__
// __CLOSE_PRINT__

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface UIImage (KEKEZipArchive)
@interface UIImage (Container)

/**
 * 重写 imageNamed: 方法，优先从压缩包中加载图片
 * 如果压缩包中没有找到，则回退到原始的 imageNamed: 方法
 */
//: + (UIImage *)zip_imageNamed:(NSString *)name;
+ (UIImage *)serverDoing:(NSString *)name;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END