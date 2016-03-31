//
//  User.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/31.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "User.h"
#define ID     @"id.archive"
#define NAME   @"name.archive"

@implementation User


+(User *)sharedInstance
{
    static User *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[User alloc] init];
    });
    
    return sharedManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString *path = [self itemArchivePath:ID];
        self.userID = [[NSKeyedUnarchiver unarchiveObjectWithFile:path] integerValue];
        
        path = [self itemArchivePath:NAME];
        self.userName = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (!self.userName) {
            self.userID = 1;
            self.userName = @"埋雷达人";
        }
    }
    return self;
}

#pragma 实现nscoding接口
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.userID = [aDecoder decodeIntegerForKey:@"userID"];
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.userID forKey:@"userID"];
    [aCoder encodeObject:self.userName forKey:@"userName"];
}

//获取相应文件的全路径
- (NSString *)itemArchivePath:(NSString *)itemName {
    // Make sure that the first argument is NSDocumentDirectory
    // and not NSDocumentationDirectory
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // Get the one document directory from that list
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:itemName];
}

- (void)saveChanges {
    NSString *path = [self itemArchivePath:ID];
    [NSKeyedArchiver archiveRootObject:@(self.userID) toFile:path];
    path = [self itemArchivePath:NAME];
    [NSKeyedArchiver archiveRootObject:self.userName toFile:path];
}
@end
