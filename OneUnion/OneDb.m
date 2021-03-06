//
//  OneDb.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/30.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "OneDb.h"
#import <AVOSCloud/AVOSCloud.h>

@implementation OneDb

/**
 *  使数据库加载，必须首先被调用
 */
+ (void)InitAvos {
    //加载avos
    [AVOSCloud setApplicationId:@"YviwVTzlpqPCX8srjQGYbEn2-gzGzoHsz"
                      clientKey:@"O4CJMNYkmnjTSVvxc9uKAqlt"];
}

+ (NSArray<Topic *> *)RecentTopics {
    AVQuery *queryTopic = [AVQuery queryWithClassName:@"TopicModel"];
    // 按时间，降序排列
    [queryTopic orderByDescending:@"createdAt"];
    queryTopic.limit = 10;//只返回最多10个结果
    NSArray<AVObject *> *recentTopics = [queryTopic findObjects];
    
    NSLog(@"topics num = %ld",recentTopics.count);
    
    return [OneDb ConvertTopicsFromAvObjects:recentTopics];
}

+ (NSArray<Topic *> *)RecentTopics:(NSString *) boardName {
    AVQuery *queryTopic = [AVQuery queryWithClassName:@"TopicModel"];
    [queryTopic whereKey:@"boardName" equalTo:boardName];
    // 按时间，降序排列
    [queryTopic orderByDescending:@"updatedAt"];
    queryTopic.limit = 10;//只返回最多10个结果
    NSArray<AVObject *> *recentTopics = [queryTopic findObjects];
    
    NSLog(@"topics num = %ld",recentTopics.count);
    
    return [OneDb ConvertTopicsFromAvObjects:recentTopics];
}

+ (NSArray<Floor *> *)AllFloors:(NSInteger) topicID {
    AVQuery *queryFloor = [AVQuery queryWithClassName:@"FloorTable"];
    [queryFloor whereKey:@"topicID" equalTo:@(topicID)];
    //按时间，升序排列，最新的帖子在最下方
    [queryFloor orderByAscending:@"updatedAt"];
    NSArray<AVObject *> *floors = [queryFloor findObjects];
    
    NSLog(@"floors num = %ld",floors.count);
    
    return [OneDb ConvertFloorsFromAvObjects:floors];
}
/**
 *  填充topicList
 */
+ (NSArray<Topic *> *) ConvertTopicsFromAvObjects:(NSArray<AVObject *> *)recentTopics {
    //创建空数组
    NSMutableArray<Topic *> *topicList = [NSMutableArray array];
    
    for (AVObject *avTopic in recentTopics) {
        
        Topic *_topic = [Topic new];
        _topic.topicID = [[avTopic objectForKey:@"topicID"] integerValue];
        _topic.topicString = [avTopic objectForKey:@"topicString"];
        _topic.authorID = [[avTopic objectForKey:@"authorID"] integerValue];
        _topic.boardName = [avTopic objectForKey:@"boardName"];
        _topic.timeStamp = avTopic.updatedAt;
        
        //取得用户名字符串
        AVQuery *query = [AVQuery queryWithClassName:@"UserTable"];
        [query whereKey:@"userID" equalTo:@(_topic.authorID)];
        AVObject *objectUserID = [query getFirstObject];
        // object 就是符合条件的第一个 AVObject
        _topic.authorName = [objectUserID objectForKey:@"userName"];
        
        //添加_topic进入topicList
        [topicList addObject:_topic];
    }

    return topicList;
}
/**
 *  填充floorList
 */
+ (NSArray<Floor *> *) ConvertFloorsFromAvObjects:(NSArray<AVObject *> *)recentTopics {
    //创建空数组
    NSMutableArray<Floor *> *floorList = [NSMutableArray array];
    
    for (AVObject *avFloor in recentTopics) {
        
        Floor *_floor = [Floor new];
        _floor.topicID = [[avFloor objectForKey:@"topicID"] integerValue];
        _floor.content = [avFloor objectForKey:@"content"];
        _floor.authorID = [[avFloor objectForKey:@"authorID"] integerValue];
        _floor.boardName = [avFloor objectForKey:@"boardName"];
        _floor.timeStamp = avFloor.updatedAt;
        
        //取得用户名字符串
        AVQuery *query = [AVQuery queryWithClassName:@"UserTable"];
        [query whereKey:@"userID" equalTo:@(_floor.authorID)];
        AVObject *objectUserID = [query getFirstObject];
        // object 就是符合条件的第一个 AVObject
        _floor.authorName = [objectUserID objectForKey:@"userName"];
        
        //添加_floor进入floorList
        [floorList addObject:_floor];
    }
    
    return floorList;
}

/**
 *  发表新帖
 */
+ (void) SendWithFloor:(Floor *) floor
              andTopic:(Topic *) topic {

    NSInteger topicID = topic.topicID;
    if (topic.topicID == 0) {//有必要创建topic，从而获取topicID
        AVObject *avTopic = [[AVObject alloc] initWithClassName:@"TopicModel"];// 构建对象
        [avTopic setObject:@(topic.authorID) forKey:@"authorID"];
        [avTopic setObject:topic.topicString forKey:@"topicString"];
        [avTopic setObject:topic.boardName forKey:@"boardName"];
        avTopic.fetchWhenSave = true;
        [avTopic save];// 保存到服务端
        NSLog(@"%@",avTopic.objectId);
        //[avTopic fetch];//从服务器拉取数据更新
        topicID = [[avTopic objectForKey:@"topicID"] integerValue];//更新从数据库获取的topicID
    }
    
    floor.topicID = topicID;
    AVObject *avFloor = [[AVObject alloc] initWithClassName:@"FloorTable"];// 构建对象
    [avFloor setObject:@(floor.topicID) forKey:@"topicID"];
    [avFloor setObject:@(floor.authorID) forKey:@"authorID"];
    [avFloor setObject:floor.boardName forKey:@"boardName"];
    [avFloor setObject:floor.content forKey:@"content"];
    [avFloor save];// 保存到服务端
}
@end
