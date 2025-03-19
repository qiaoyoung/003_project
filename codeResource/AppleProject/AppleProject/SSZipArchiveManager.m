#import "SSZipArchiveManager.h"
#import "NTESMigrateHeader.h"

#define kSSZipArchiveManagerVersionKey @"kSSZipArchiveManagerVersionKey"
#define kAppleProjectEmoticon @"AppleProjectEmoticon"

@interface SSZipArchiveManager()

@property (nonatomic, strong) NSString *appResPath;

@end

@implementation SSZipArchiveManager

+ (instancetype)sharedManager {
    static SSZipArchiveManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    static SSZipArchiveManager *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [super allocWithZone:zone];
    });
    return sharedInstance;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _appResPath = [self calculateAppResPath];
    }
    return self;
}

- (NSString *)calculateAppResPath {
    NSString *docuPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *resDir = [docuPath stringByAppendingPathComponent:kAppleProjectEmoticon];
    
    NSString *version = [[NSUserDefaults standardUserDefaults] stringForKey:kSSZipArchiveManagerVersionKey];
    if (!version) {
        version = @""; // Default to empty string if nil
    }
    
    
    if ([version isEqualToString:[NTESMigrateHeader initWithDefaultConfig].appVersion] && [[NSFileManager defaultManager] fileExistsAtPath:resDir]) {
        return resDir;
    }
    
    NSString *fileResDir = [[docuPath stringByAppendingPathComponent:@"file"] stringByAppendingPathComponent:kAppleProjectEmoticon];
    if ([version isEqualToString:[NTESMigrateHeader initWithDefaultConfig].appVersion] && [[NSFileManager defaultManager] fileExistsAtPath:fileResDir]) {
        return fileResDir;
    }
    
    NSString *path = [[AppleProjectKit sharedKit].emoticonBundle pathForResource:kAppleProjectEmoticon ofType:@".zip"];
    if (!path) {
        return @""; // Return empty string if path is nil
    }
    
    BOOL zipSuc = [SSZipArchive unzipFileAtPath:path
                                 toDestination:docuPath
                                     overwrite:YES
                                      password:kAppleProjectEmoticon
                                         error:nil];
    if (zipSuc) {
        [[NSUserDefaults standardUserDefaults] setObject:[NTESMigrateHeader initWithDefaultConfig].appVersion forKey:kSSZipArchiveManagerVersionKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        if ([[NSFileManager defaultManager] fileExistsAtPath:resDir]) {
            return resDir;
        } else {
            return fileResDir;
        }
    }
    
    return @""; // Return empty string if unzip fails
}

- (NSString *)getHtml_filePath {
    return [_appResPath stringByAppendingPathComponent:@"html"];
}

- (NSString *)getXML_filePath {
    return [_appResPath stringByAppendingPathComponent:@"xml_file"];
}

- (NSString *)getEmojiPath {
    return [_appResPath stringByAppendingPathComponent:@"Emoji"];
}

- (NSString *)getLprojPath {
    return [_appResPath stringByAppendingPathComponent:@"Lproj"];
}

- (NSString *)getImagesPath {
    return [_appResPath stringByAppendingPathComponent:@"Image"];
}

- (UIImage *)zip_imageNamed:(NSString *)name {
    // 构建 imageset 路径
    NSString *imagesetPath = [[self getImagesPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.imageset", name]];
    
    // 尝试加载 @2x 和 @3x 图片
    CGFloat scale = [UIScreen mainScreen].scale;
    NSString *scaledName = [NSString stringWithFormat:@"%@@%dx.png", name, (int)scale];
    NSString *scaledPath = [imagesetPath stringByAppendingPathComponent:scaledName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:scaledPath]) {
        return [UIImage imageWithContentsOfFile:scaledPath];
    }
    
    // 降级到其他倍数图片
    NSString *altScaleName = [NSString stringWithFormat:@"%@@%dx.png", name, (scale == 2 ? 3 : 2)];
    NSString *altScalePath = [imagesetPath stringByAppendingPathComponent:altScaleName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:altScalePath]) {
        return [UIImage imageWithContentsOfFile:altScalePath];
    }
    
    // 最后尝试普通图片
    NSString *normalPath = [imagesetPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", name]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:normalPath]) {
        return [UIImage imageWithContentsOfFile:normalPath];
    }
    
    return nil;
}

@end
