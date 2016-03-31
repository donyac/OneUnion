//
//  OneDb.h
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/30.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Topic.h"
#import "Floor.h"

@interface OneDb : NSObject

+ (void)InitAvos;
+ (NSArray<Topic *> *)RecentTopics;
+ (NSArray<Topic *> *)RecentTopics:(NSString *) boardName;
+ (NSArray<Floor *> *)AllFloors:(NSInteger) topicID;
+ (void) SendWithFloor:(Floor *) floor
              andTopic:(Topic *) topic;
@end
