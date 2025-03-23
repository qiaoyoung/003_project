
#import <Foundation/Foundation.h>

NSString *StringFromDateKickData(Byte *data);


//: select count(serial) from notifications where status = ?
Byte str_sendWithValue[] = {45, 56, 12, 166, 243, 24, 234, 196, 148, 41, 40, 235, 63, 32, 61, 32, 115, 117, 116, 97, 116, 115, 32, 101, 114, 101, 104, 119, 32, 115, 110, 111, 105, 116, 97, 99, 105, 102, 105, 116, 111, 110, 32, 109, 111, 114, 102, 32, 41, 108, 97, 105, 114, 101, 115, 40, 116, 110, 117, 111, 99, 32, 116, 99, 101, 108, 101, 115, 15};


//: create index if not exists timetagindex on notifications(timetag)
Byte str_modelOriginName[] = {51, 65, 11, 85, 142, 148, 214, 139, 201, 214, 20, 41, 103, 97, 116, 101, 109, 105, 116, 40, 115, 110, 111, 105, 116, 97, 99, 105, 102, 105, 116, 111, 110, 32, 110, 111, 32, 120, 101, 100, 110, 105, 103, 97, 116, 101, 109, 105, 116, 32, 115, 116, 115, 105, 120, 101, 32, 116, 111, 110, 32, 102, 105, 32, 120, 101, 100, 110, 105, 32, 101, 116, 97, 101, 114, 99, 218};


//: select * from notifications where timetag < %f and status != ? order by timetag desc limit ?
Byte str_backgroundName[] = {14, 92, 9, 57, 131, 82, 135, 23, 253, 63, 32, 116, 105, 109, 105, 108, 32, 99, 115, 101, 100, 32, 103, 97, 116, 101, 109, 105, 116, 32, 121, 98, 32, 114, 101, 100, 114, 111, 32, 63, 32, 61, 33, 32, 115, 117, 116, 97, 116, 115, 32, 100, 110, 97, 32, 102, 37, 32, 60, 32, 103, 97, 116, 101, 109, 105, 116, 32, 101, 114, 101, 104, 119, 32, 115, 110, 111, 105, 116, 97, 99, 105, 102, 105, 116, 111, 110, 32, 109, 111, 114, 102, 32, 42, 32, 116, 99, 101, 108, 101, 115, 172};


//: sender
Byte str_textThatValue[] = {94, 6, 11, 242, 119, 130, 147, 58, 232, 76, 146, 114, 101, 100, 110, 101, 115, 107};


//: create table if not exists notifications(serial integer primary key,                           timetag integer,sender text,receiver text,content text,status integer)
Byte str_kickKeyInputName[] = {82, 165, 12, 41, 82, 63, 187, 188, 232, 18, 166, 156, 41, 114, 101, 103, 101, 116, 110, 105, 32, 115, 117, 116, 97, 116, 115, 44, 116, 120, 101, 116, 32, 116, 110, 101, 116, 110, 111, 99, 44, 116, 120, 101, 116, 32, 114, 101, 118, 105, 101, 99, 101, 114, 44, 116, 120, 101, 116, 32, 114, 101, 100, 110, 101, 115, 44, 114, 101, 103, 101, 116, 110, 105, 32, 103, 97, 116, 101, 109, 105, 116, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 44, 121, 101, 107, 32, 121, 114, 97, 109, 105, 114, 112, 32, 114, 101, 103, 101, 116, 110, 105, 32, 108, 97, 105, 114, 101, 115, 40, 115, 110, 111, 105, 116, 97, 99, 105, 102, 105, 116, 111, 110, 32, 115, 116, 115, 105, 120, 101, 32, 116, 111, 110, 32, 102, 105, 32, 101, 108, 98, 97, 116, 32, 101, 116, 97, 101, 114, 99, 130};


//: update notifications set status  = ? where status < ? or status > ?
Byte str_pointTingData[] = {37, 67, 6, 24, 233, 33, 63, 32, 62, 32, 115, 117, 116, 97, 116, 115, 32, 114, 111, 32, 63, 32, 60, 32, 115, 117, 116, 97, 116, 115, 32, 101, 114, 101, 104, 119, 32, 63, 32, 61, 32, 32, 115, 117, 116, 97, 116, 115, 32, 116, 101, 115, 32, 115, 110, 111, 105, 116, 97, 99, 105, 102, 105, 116, 111, 110, 32, 101, 116, 97, 100, 112, 117, 172};


//: update notifications set status  = ? where status = ?
Byte str_recordImageValue[] = {54, 53, 10, 243, 191, 139, 213, 22, 232, 17, 63, 32, 61, 32, 115, 117, 116, 97, 116, 115, 32, 101, 114, 101, 104, 119, 32, 63, 32, 61, 32, 32, 115, 117, 116, 97, 116, 115, 32, 116, 101, 115, 32, 115, 110, 111, 105, 116, 97, 99, 105, 102, 105, 116, 111, 110, 32, 101, 116, 97, 100, 112, 117, 12};


//: content
Byte str_fileSendCameraData[] = {46, 7, 9, 158, 95, 88, 151, 54, 125, 116, 110, 101, 116, 110, 111, 99, 89};


//: receiver
Byte str_tingNameText[] = {51, 8, 3, 114, 101, 118, 105, 101, 99, 101, 114, 211};


//: select * from notifications where status != ? order by timetag desc limit ?
Byte str_dataQuantityKeyText[] = {72, 75, 10, 86, 49, 198, 187, 13, 92, 216, 63, 32, 116, 105, 109, 105, 108, 32, 99, 115, 101, 100, 32, 103, 97, 116, 101, 109, 105, 116, 32, 121, 98, 32, 114, 101, 100, 114, 111, 32, 63, 32, 61, 33, 32, 115, 117, 116, 97, 116, 115, 32, 101, 114, 101, 104, 119, 32, 115, 110, 111, 105, 116, 97, 99, 105, 102, 105, 116, 111, 110, 32, 109, 111, 114, 102, 32, 42, 32, 116, 99, 101, 108, 101, 115, 246};


//: create index if not exists readindex on notifications(status)
Byte str_viewText[] = {36, 61, 10, 2, 31, 136, 124, 210, 86, 181, 41, 115, 117, 116, 97, 116, 115, 40, 115, 110, 111, 105, 116, 97, 99, 105, 102, 105, 116, 111, 110, 32, 110, 111, 32, 120, 101, 100, 110, 105, 100, 97, 101, 114, 32, 115, 116, 115, 105, 120, 101, 32, 116, 111, 110, 32, 102, 105, 32, 120, 101, 100, 110, 105, 32, 101, 116, 97, 101, 114, 99, 75};


//: update notifications set status  = ? where serial = ?
Byte str_providerTitle[] = {11, 53, 12, 57, 173, 98, 5, 62, 31, 87, 140, 216, 63, 32, 61, 32, 108, 97, 105, 114, 101, 115, 32, 101, 114, 101, 104, 119, 32, 63, 32, 61, 32, 32, 115, 117, 116, 97, 116, 115, 32, 116, 101, 115, 32, 115, 110, 111, 105, 116, 97, 99, 105, 102, 105, 116, 111, 110, 32, 101, 116, 97, 100, 112, 117, 45};


//: insert into notifications(timetag,sender,receiver,content,status)              values(?,?,?,?,?)
Byte str_shouldShowData[] = {61, 96, 9, 106, 123, 156, 135, 20, 172, 41, 63, 44, 63, 44, 63, 44, 63, 44, 63, 40, 115, 101, 117, 108, 97, 118, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 41, 115, 117, 116, 97, 116, 115, 44, 116, 110, 101, 116, 110, 111, 99, 44, 114, 101, 118, 105, 101, 99, 101, 114, 44, 114, 101, 100, 110, 101, 115, 44, 103, 97, 116, 101, 109, 105, 116, 40, 115, 110, 111, 105, 116, 97, 99, 105, 102, 105, 116, 111, 110, 32, 111, 116, 110, 105, 32, 116, 114, 101, 115, 110, 105, 86};


//: timetag
Byte str_keyCloseText[] = {97, 7, 13, 95, 68, 150, 167, 69, 220, 134, 186, 37, 67, 103, 97, 116, 101, 109, 105, 116, 46};


//: notification.db
Byte str_areaDataValue[] = {38, 15, 4, 133, 98, 100, 46, 110, 111, 105, 116, 97, 99, 105, 102, 105, 116, 111, 110, 220};


//: serial
Byte str_tableContentText[] = {89, 6, 5, 131, 214, 108, 97, 105, 114, 101, 115, 52};

// __DEBUG__
// __CLOSE_PRINT__
//
//  HideAddLight.m
//  NIM
//
//  Created by chris on 15/5/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESCustomNotificationDB.h"
#import "HideAddLight.h"
//: #import "FMDB.h"
#import "FMDB.h"
//: #import "NTESFileLocationHelper.h"
#import "BubbleMaxContainer.h"
//: #import "NTESCustomNotificationObject.h"
#import "DataObject.h"

//: typedef NS_ENUM(NSInteger, CustomNotificationStatus){
typedef NS_ENUM(NSInteger, CustomNotificationStatus){
    //: CustomNotificationStatusNone = 0,
    CustomNotificationStatusNone = 0,
    //: CustomNotificationStatusRead = 1,
    CustomNotificationStatusRead = 1,
    //: CustomNotificationStatusDeleted = 2,
    CustomNotificationStatusDeleted = 2,
//: };
};

//: @interface NTESCustomNotificationDB ()
@interface HideAddLight ()
//: @property (nonatomic,strong) FMDatabase *db;
@property (nonatomic,strong) FMDatabase *db;
//: @end
@end


//: @implementation NTESCustomNotificationDB
@implementation HideAddLight

//: + (instancetype)sharedInstance { static NTESCustomNotificationDB *sharedNTESCustomNotificationDB = nil; static dispatch_once_t pred; _dispatch_once(&pred, ^{ sharedNTESCustomNotificationDB = [[NTESCustomNotificationDB alloc] init]; }); return sharedNTESCustomNotificationDB; };
+ (instancetype)count { static HideAddLight *sharedNTESCustomNotificationDB = nil; static dispatch_once_t pred; _dispatch_once(&pred, ^{ sharedNTESCustomNotificationDB = [[HideAddLight alloc] init]; }); return sharedNTESCustomNotificationDB; };

//: - (instancetype)init
- (instancetype)init
{
    //: if (self = [super init])
    if (self = [super init])
    {
        //: [self openDatabase];
        [self fundamentalCount];
    }
    //: return self;
    return self;
}


//: - (NSInteger)unreadCount
- (NSInteger)unreadCount
{
    //: __block NSInteger count = 0;
    __block NSInteger count = 0;
    //: io_sync_safe(^{
    io_sync_safe(^{
        //: count = _unreadCount;
        count = _unreadCount;
    //: });
    });
    //: return count;
    return count;
}

//: - (NSArray *)fetchNotifications:(NTESCustomNotificationObject *)notification
- (NSArray *)printMediaTing:(DataObject *)notification
                          //: limit:(NSInteger)limit{
                          disable:(NSInteger)limit{
    //: __block NSArray *result = nil;
    __block NSArray *result = nil;

    //: NSString *sql = nil;
    NSString *sql = nil;
    //: if (notification)
    if (notification)
    {
        //: sql = [NSString stringWithFormat:@"select * from notifications where timetag < %f and status != ? order by timetag desc limit ?",
        sql = [NSString stringWithFormat:StringFromDateKickData(str_backgroundName),
               //: notification.timestamp] ;
               notification.timestamp] ;
    }
    //: else
    else
    {
        //: sql = @"select * from notifications where status != ? order by timetag desc limit ?";
        sql = StringFromDateKickData(str_dataQuantityKeyText);
    }
    //: io_sync_safe(^{
    io_sync_safe(^{
        //: NSMutableArray *array = [NSMutableArray array];
        NSMutableArray *array = [NSMutableArray array];
        //: FMResultSet *rs = [self.db executeQuery:sql,@(CustomNotificationStatusDeleted),@(limit)];
        FMResultSet *rs = [self.db executeQuery:sql,@(CustomNotificationStatusDeleted),@(limit)];
        //: while ([rs next])
        while ([rs next])
        {
            //: NTESCustomNotificationObject *notification = [[NTESCustomNotificationObject alloc] init];
            DataObject *notification = [[DataObject alloc] init];
            //: notification.serial = (NSInteger)[rs intForColumn:@"serial"];
            notification.serial = (NSInteger)[rs intForColumn:StringFromDateKickData(str_tableContentText)];
            //: notification.timestamp = [rs doubleForColumn:@"timetag"];
            notification.timestamp = [rs doubleForColumn:StringFromDateKickData(str_keyCloseText)];
            //: notification.sender = [rs stringForColumn:@"sender"];
            notification.sender = [rs stringForColumn:StringFromDateKickData(str_textThatValue)];
            //: notification.receiver = [rs stringForColumn:@"receiver"];
            notification.receiver = [rs stringForColumn:StringFromDateKickData(str_tingNameText)];
            //: notification.content = [rs stringForColumn:@"content"];
            notification.content = [rs stringForColumn:StringFromDateKickData(str_fileSendCameraData)];
            //: [array addObject:notification];
            [array addObject:notification];
        }
        //: [rs close];
        [rs close];
        //: result = array;
        result = array;
    //: });
    });

    //: return result;
    return result;

}

//: - (BOOL)saveNotification:(NTESCustomNotificationObject *)notification{
- (BOOL)location:(DataObject *)notification{
    //: __block BOOL result = NO;
    __block BOOL result = NO;
    //: io_sync_safe(^{
    io_sync_safe(^{
        //: if (notification)
        if (notification)
        {
            //: CustomNotificationStatus status = notification.needBadge? CustomNotificationStatusNone : CustomNotificationStatusRead;
            CustomNotificationStatus status = notification.needBadge? CustomNotificationStatusNone : CustomNotificationStatusRead;
            //: NSString *sql = @"insert into notifications(timetag,sender,receiver,content,status)              values(?,?,?,?,?)";
            NSString *sql = StringFromDateKickData(str_shouldShowData);

            //: if (![self.db executeUpdate:sql,
            if (![self.db executeUpdate:sql,
                  //: @(notification.timestamp),
                  @(notification.timestamp),
                  //: notification.sender,
                  notification.sender,
                  //: notification.receiver,
                  notification.receiver,
                  //: notification.content,
                  notification.content,
                  //: @(status)])
                  @(status)])
            {
            }
            //: else
            else
            {
                //: notification.serial = (NSInteger)[self.db lastInsertRowId];
                notification.serial = (NSInteger)[self.db lastInsertRowId];
                //: if (notification.needBadge) {
                if (notification.needBadge) {
                    //: self.unreadCount++;
                    self.unreadCount++;
                }
                //: result = YES;
                result = YES;
            }
        }
    //: });
    });
    //: return result;
    return result;

}

//: - (void)deleteNotification:(NTESCustomNotificationObject *)notification{
- (void)forwards:(DataObject *)notification{
    //: NSString *sql = @"update notifications set status  = ? where serial = ?";
    NSString *sql = StringFromDateKickData(str_providerTitle);
    //: io_async(^{
    io_async(^{
        //: if (![self.db executeUpdate:sql,@(CustomNotificationStatusDeleted),@(notification.serial)])
        if (![self.db executeUpdate:sql,@(CustomNotificationStatusDeleted),@(notification.serial)])
        {
        }
        //: [self queryUnreadCount];
        [self comment];
    //: });
    });
}


//: - (void)deleteAllNotification{
- (void)sum{
    //: NSString *sql = @"update notifications set status  = ? where status < ? or status > ?";
    NSString *sql = StringFromDateKickData(str_pointTingData);
    //: io_async(^{
    io_async(^{
        //: if (![self.db executeUpdate:sql,@(CustomNotificationStatusDeleted),@(CustomNotificationStatusDeleted),@(CustomNotificationStatusDeleted)])
        if (![self.db executeUpdate:sql,@(CustomNotificationStatusDeleted),@(CustomNotificationStatusDeleted),@(CustomNotificationStatusDeleted)])
        {
        }
        //: [self queryUnreadCount];
        [self comment];
    //: });
    });
}


//: - (void)markAllNotificationsAsRead{
- (void)selected{
    //: NSString *sql = @"update notifications set status  = ? where status = ?";
    NSString *sql = StringFromDateKickData(str_recordImageValue);
    //: io_sync_safe(^{
    io_sync_safe(^{
        //: if (![self.db executeUpdate:sql,@(CustomNotificationStatusRead),@(CustomNotificationStatusNone)])
        if (![self.db executeUpdate:sql,@(CustomNotificationStatusRead),@(CustomNotificationStatusNone)])
        {
        }
        //: [self queryUnreadCount];
        [self comment];
    //: });
    });
}

//: - (void)queryUnreadCount{
- (void)comment{
    //: NSInteger count = 0;
    NSInteger count = 0;
    //: NSString *sql = @"select count(serial) from notifications where status = ?";
    NSString *sql = StringFromDateKickData(str_sendWithValue);
    //: FMResultSet *rs = [_db executeQuery:sql,@(CustomNotificationStatusNone)];
    FMResultSet *rs = [_db executeQuery:sql,@(CustomNotificationStatusNone)];
    //: if ([rs next])
    if ([rs next])
    {
        //: count = (NSInteger)[rs intForColumnIndex:0];
        count = (NSInteger)[rs intForColumnIndex:0];
    }
    //: [rs close];
    [rs close];

    //: if (count != _unreadCount)
    if (count != _unreadCount)
    {
        //: self.unreadCount = count;
        self.unreadCount = count;
    }
}


//: #pragma mark - Misc
#pragma mark - Misc
//: - (void)openDatabase
- (void)fundamentalCount
{
    //: NSString *filepath = [[NTESFileLocationHelper userDirectory] stringByAppendingString:@"notification.db"];
    NSString *filepath = [[BubbleMaxContainer person] stringByAppendingString:StringFromDateKickData(str_areaDataValue)];
    //: FMDatabase *db = [FMDatabase databaseWithPath:filepath];
    FMDatabase *db = [FMDatabase databaseWithPath:filepath];
    //: if ([db open])
    if ([db open])
    {
        //: _db = db;
        _db = db;
        //: NSArray *sqls = @[@"create table if not exists notifications(serial integer primary key,                           timetag integer,sender text,receiver text,content text,status integer)",
        NSArray *sqls = @[StringFromDateKickData(str_kickKeyInputName),

                          //: @"create index if not exists readindex on notifications(status)",
                          StringFromDateKickData(str_viewText),
                          //: @"create index if not exists timetagindex on notifications(timetag)"];
                          StringFromDateKickData(str_modelOriginName)];
        //: for (NSString *sql in sqls)
        for (NSString *sql in sqls)
        {
            //: if (![_db executeUpdate:sql])
            if (![_db executeUpdate:sql])
            {
            }
        }
        //: [self queryUnreadCount];
        [self comment];
    }
    //: else
    else
    {
    }
}

//: static const void * const NTESDispatchIOSpecificKey = &NTESDispatchIOSpecificKey;
static const void * const k_filterName = &k_filterName;
//: dispatch_queue_t NTESDispatchIOQueue()
dispatch_queue_t NTESDispatchIOQueue()
{
    //: static dispatch_queue_t queue;
    static dispatch_queue_t queue;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: queue = dispatch_queue_create("nim.demo.io.queue", 0);
        queue = dispatch_queue_create("nim.demo.io.queue", 0);
        //: dispatch_queue_set_specific(queue, NTESDispatchIOSpecificKey, (void *)NTESDispatchIOSpecificKey, NULL);
        dispatch_queue_set_specific(queue, k_filterName, (void *)k_filterName, NULL);
    //: });
    });
    //: return queue;
    return queue;
}


//: typedef void(^dispatch_block)(void);
typedef void(^dispatch_block)(void);
//: void io_sync_safe(dispatch_block block)
void io_sync_safe(dispatch_block block)
{
    //: if (dispatch_get_specific(NTESDispatchIOSpecificKey))
    if (dispatch_get_specific(k_filterName))
    {
        //: block();
        block();
    }
    //: else
    else
    {
        //: dispatch_sync(NTESDispatchIOQueue(), ^() {
        dispatch_sync(NTESDispatchIOQueue(), ^() {
            //: block();
            block();
        //: });
        });
    }
}


//: void io_async(dispatch_block block){
void io_async(dispatch_block block){
    //: dispatch_async(NTESDispatchIOQueue(), ^() {
    dispatch_async(NTESDispatchIOQueue(), ^() {
        //: block();
        block();
    //: });
    });
}


//: @end
@end

Byte * DateKickDataToCache(Byte *data) {
    int frameRecent = data[0];
    int titleShould = data[1];
    int be = data[2];
    if (!frameRecent) return data + be;
    for (int i = 0; i < titleShould / 2; i++) {
        int begin = be + i;
        int end = be + titleShould - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[be + titleShould] = 0;
    return data + be;
}

NSString *StringFromDateKickData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)DateKickDataToCache(data)];
}  
