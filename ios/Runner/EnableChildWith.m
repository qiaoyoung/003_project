
#import <Foundation/Foundation.h>

NSString *StringFromSeverData(Byte *data);


//: file
Byte str_weekendTheaterValue[] = {57, 4, 11, 11, 237, 39, 80, 245, 13, 161, 149, 113, 116, 119, 112, 225};


//: .zip
Byte str_helpData[] = {67, 4, 51, 12, 87, 82, 36, 61, 162, 245, 157, 68, 97, 173, 156, 163, 135};


//: Image
Byte str_radEhData[] = {23, 5, 41, 4, 114, 150, 138, 144, 142, 128};


//: AppleProjectEmoticon
Byte str_consumeReekInputValue[] = {7, 20, 88, 4, 153, 200, 200, 196, 189, 168, 202, 199, 194, 189, 187, 204, 157, 197, 199, 204, 193, 187, 199, 198, 104};


//: Lproj
Byte str_hmIconData[] = {40, 5, 81, 7, 189, 11, 143, 157, 193, 195, 192, 187, 239};


//: html
Byte str_viceValue[] = {35, 4, 78, 9, 168, 219, 208, 140, 254, 182, 194, 187, 186, 247};


//: %@.imageset
Byte str_limpName[] = {50, 11, 65, 13, 185, 160, 42, 242, 182, 125, 110, 56, 78, 102, 129, 111, 170, 174, 162, 168, 166, 180, 166, 181, 97};


//: kSSZipArchiveManagerVersionKey
Byte str_nessSuspectReligionValue[] = {36, 30, 70, 9, 166, 89, 208, 21, 197, 177, 153, 153, 160, 175, 182, 135, 184, 169, 174, 175, 188, 171, 147, 167, 180, 167, 173, 171, 184, 156, 171, 184, 185, 175, 181, 180, 145, 171, 191, 254};


//: Emoji
Byte str_awarenessThoughRoverData[] = {1, 5, 80, 5, 237, 149, 189, 191, 186, 185, 133};


//: %@.png
Byte str_analSlatBurdenData[] = {2, 6, 67, 4, 104, 131, 113, 179, 177, 170, 167};


//: xml_file
Byte str_discGentlyText[] = {22, 8, 86, 7, 153, 41, 208, 206, 195, 194, 181, 188, 191, 194, 187, 149};


//: %@@%dx.png
Byte str_howLiabilityValue[] = {47, 10, 75, 4, 112, 139, 139, 112, 175, 195, 121, 187, 185, 178, 134};

// __DEBUG__
// __CLOSE_PRINT__

// __M_A_C_R_O__
//: #import "SSZipArchiveManager.h"
#import "EnableChildWith.h"
//: #import "NTESMigrateHeader.h"
#import "UpAt.h"

//: @interface SSZipArchiveManager()
@interface EnableChildWith()

//: @property (nonatomic, strong) NSString *appResPath;
@property (nonatomic, strong) NSString *appResPath;

//: @end
@end

//: @implementation SSZipArchiveManager
@implementation EnableChildWith

//: + (instancetype)sharedManager {
+ (instancetype)containerMessage {
    //: static SSZipArchiveManager *sharedInstance = nil;
    static EnableChildWith *sharedInstance = nil;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: sharedInstance = [[self alloc] init];
        sharedInstance = [[self alloc] init];
    //: });
    });
    //: return sharedInstance;
    return sharedInstance;
}

//: + (instancetype)allocWithZone:(struct _NSZone *)zone {
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: static SSZipArchiveManager *sharedInstance = nil;
    static EnableChildWith *sharedInstance = nil;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: sharedInstance = [super allocWithZone:zone];
        sharedInstance = [super allocWithZone:zone];
    //: });
    });
    //: return sharedInstance;
    return sharedInstance;
}

//: - (id)copyWithZone:(NSZone *)zone {
- (id)nameWith:(NSZone *)zone {
    //: return self;
    return self;
}

//: - (instancetype)init {
- (instancetype)init {
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _appResPath = [self calculateAppResPath];
        _appResPath = [self sizePath];
    }
    //: return self;
    return self;
}

//: - (NSString *)calculateAppResPath {
- (NSString *)sizePath {
    //: NSString *docuPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *docuPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    //: NSString *resDir = [docuPath stringByAppendingPathComponent:@"AppleProjectEmoticon"];
    NSString *resDir = [docuPath stringByAppendingPathComponent:StringFromSeverData(str_consumeReekInputValue)];

    //: NSString *version = [[NSUserDefaults standardUserDefaults] stringForKey:@"kSSZipArchiveManagerVersionKey"];
    NSString *version = [[NSUserDefaults standardUserDefaults] stringForKey:StringFromSeverData(str_nessSuspectReligionValue)];
    //: if (!version) {
    if (!version) {
        //: version = @""; 
        version = @""; // Default to empty string if nil
    }


    //: if ([version isEqualToString:[NTESMigrateHeader initWithDefaultConfig].appVersion] && [[NSFileManager defaultManager] fileExistsAtPath:resDir]) {
    if ([version isEqualToString:[UpAt initWithDefault].appVersion] && [[NSFileManager defaultManager] fileExistsAtPath:resDir]) {
        //: return resDir;
        return resDir;
    }

    //: NSString *fileResDir = [[docuPath stringByAppendingPathComponent:@"file"] stringByAppendingPathComponent:@"AppleProjectEmoticon"];
    NSString *fileResDir = [[docuPath stringByAppendingPathComponent:StringFromSeverData(str_weekendTheaterValue)] stringByAppendingPathComponent:StringFromSeverData(str_consumeReekInputValue)];
    //: if ([version isEqualToString:[NTESMigrateHeader initWithDefaultConfig].appVersion] && [[NSFileManager defaultManager] fileExistsAtPath:fileResDir]) {
    if ([version isEqualToString:[UpAt initWithDefault].appVersion] && [[NSFileManager defaultManager] fileExistsAtPath:fileResDir]) {
        //: return fileResDir;
        return fileResDir;
    }

    //: NSString *path = [[AppleProjectKit sharedKit].emoticonBundle pathForResource:@"AppleProjectEmoticon" ofType:@".zip"];
    NSString *path = [[Indicator reach].emoticonBundle pathForResource:StringFromSeverData(str_consumeReekInputValue) ofType:StringFromSeverData(str_helpData)];
    //: if (!path) {
    if (!path) {
        //: return @""; 
        return @""; // Return empty string if path is nil
    }

    //: BOOL zipSuc = [SSZipArchive unzipFileAtPath:path
    BOOL zipSuc = [SSZipArchive unzipFileAtPath:path
                                 //: toDestination:docuPath
                                 toDestination:docuPath
                                     //: overwrite:YES
                                     overwrite:YES
                                      //: password:@"AppleProjectEmoticon"
                                      password:StringFromSeverData(str_consumeReekInputValue)
                                         //: error:nil];
                                         error:nil];
    //: if (zipSuc) {
    if (zipSuc) {
        //: [[NSUserDefaults standardUserDefaults] setObject:[NTESMigrateHeader initWithDefaultConfig].appVersion forKey:@"kSSZipArchiveManagerVersionKey"];
        [[NSUserDefaults standardUserDefaults] setObject:[UpAt initWithDefault].appVersion forKey:StringFromSeverData(str_nessSuspectReligionValue)];
        //: [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSUserDefaults standardUserDefaults] synchronize];
        //: if ([[NSFileManager defaultManager] fileExistsAtPath:resDir]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:resDir]) {
            //: return resDir;
            return resDir;
        //: } else {
        } else {
            //: return fileResDir;
            return fileResDir;
        }
    }

    //: return @""; 
    return @""; // Return empty string if unzip fails
}

//: - (NSString *)getHtml_filePath {
- (NSString *)pressed {
    //: return [_appResPath stringByAppendingPathComponent:@"html"];
    return [_appResPath stringByAppendingPathComponent:StringFromSeverData(str_viceValue)];
}

//: - (NSString *)getXML_filePath {
- (NSString *)capture {
    //: return [_appResPath stringByAppendingPathComponent:@"xml_file"];
    return [_appResPath stringByAppendingPathComponent:StringFromSeverData(str_discGentlyText)];
}

//: - (NSString *)getEmojiPath {
- (NSString *)withSize {
    //: return [_appResPath stringByAppendingPathComponent:@"Emoji"];
    return [_appResPath stringByAppendingPathComponent:StringFromSeverData(str_awarenessThoughRoverData)];
}

//: - (NSString *)getLprojPath {
- (NSString *)recordShow {
    //: return [_appResPath stringByAppendingPathComponent:@"Lproj"];
    return [_appResPath stringByAppendingPathComponent:StringFromSeverData(str_hmIconData)];
}

//: - (NSString *)getImagesPath {
- (NSString *)user {
    //: return [_appResPath stringByAppendingPathComponent:@"Image"];
    return [_appResPath stringByAppendingPathComponent:StringFromSeverData(str_radEhData)];
}

//: - (UIImage *)zip_imageNamed:(NSString *)name {
- (UIImage *)serverDoing:(NSString *)name {
    // 构建 imageset 路径
    //: NSString *imagesetPath = [[self getImagesPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.imageset", name]];
    NSString *imagesetPath = [[self user] stringByAppendingPathComponent:[NSString stringWithFormat:StringFromSeverData(str_limpName), name]];

    // 尝试加载 @2x 和 @3x 图片
    //: CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat scale = [UIScreen mainScreen].scale;
    //: NSString *scaledName = [NSString stringWithFormat:@"%@@%dx.png", name, (int)scale];
    NSString *scaledName = [NSString stringWithFormat:StringFromSeverData(str_howLiabilityValue), name, (int)scale];
    //: NSString *scaledPath = [imagesetPath stringByAppendingPathComponent:scaledName];
    NSString *scaledPath = [imagesetPath stringByAppendingPathComponent:scaledName];

    //: if ([[NSFileManager defaultManager] fileExistsAtPath:scaledPath]) {
    if ([[NSFileManager defaultManager] fileExistsAtPath:scaledPath]) {
        //: return [UIImage imageWithContentsOfFile:scaledPath];
        return [UIImage imageWithContentsOfFile:scaledPath];
    }

    // 降级到其他倍数图片
    //: NSString *altScaleName = [NSString stringWithFormat:@"%@@%dx.png", name, (scale == 2 ? 3 : 2)];
    NSString *altScaleName = [NSString stringWithFormat:StringFromSeverData(str_howLiabilityValue), name, (scale == 2 ? 3 : 2)];
    //: NSString *altScalePath = [imagesetPath stringByAppendingPathComponent:altScaleName];
    NSString *altScalePath = [imagesetPath stringByAppendingPathComponent:altScaleName];

    //: if ([[NSFileManager defaultManager] fileExistsAtPath:altScalePath]) {
    if ([[NSFileManager defaultManager] fileExistsAtPath:altScalePath]) {
        //: return [UIImage imageWithContentsOfFile:altScalePath];
        return [UIImage imageWithContentsOfFile:altScalePath];
    }

    // 最后尝试普通图片
    //: NSString *normalPath = [imagesetPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", name]];
    NSString *normalPath = [imagesetPath stringByAppendingPathComponent:[NSString stringWithFormat:StringFromSeverData(str_analSlatBurdenData), name]];
    //: if ([[NSFileManager defaultManager] fileExistsAtPath:normalPath]) {
    if ([[NSFileManager defaultManager] fileExistsAtPath:normalPath]) {
        //: return [UIImage imageWithContentsOfFile:normalPath];
        return [UIImage imageWithContentsOfFile:normalPath];
    }

    //: return nil;
    return nil;
}

//: @end
@end

Byte * SeverDataToCache(Byte *data) {
    int core = data[0];
    int jurywoman = data[1];
    Byte skillLucky = data[2];
    int believably = data[3];
    if (!core) return data + believably;
    for (int i = believably; i < believably + jurywoman; i++) {
        int value = data[i] - skillLucky;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[believably + jurywoman] = 0;
    return data + believably;
}

NSString *StringFromSeverData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)SeverDataToCache(data)];
}
