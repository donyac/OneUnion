//
//  Topic.h
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/30.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>

@interface Topic : NSObject
@property (nonatomic, assign) NSInteger topicID;
@property (nonatomic, copy) NSString *topicString;
@property (nonatomic, assign) NSInteger authorID;
@property (nonatomic, copy) NSString *authorName;
@property (nonatomic, copy) NSString *boardName;
@property (nonatomic, strong) NSDate *timeStamp;
@end
