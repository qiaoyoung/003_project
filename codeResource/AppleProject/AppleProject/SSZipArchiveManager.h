#import <Foundation/Foundation.h>
#import <SSZipArchive/SSZipArchive.h>
NS_ASSUME_NONNULL_BEGIN

@interface SSZipArchiveManager : NSObject

+ (instancetype)sharedManager;

- (NSString *)getHtml_filePath;

- (NSString *)getXML_filePath;

- (NSString *)getEmojiPath;

- (NSString *)getLprojPath;

- (UIImage *)zip_imageNamed:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
