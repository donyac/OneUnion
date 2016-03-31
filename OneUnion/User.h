//
//  User.h
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/31.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>
@property (nonatomic, assign) NSInteger userID;
@property (nonatomic, strong) NSString* userName;

+(User *)sharedInstance;
@end
