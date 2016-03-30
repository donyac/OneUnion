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

//暂时用不到单例，只用类方法已经满足需求
//+(OneDb *)sharedInstance
//{
//    static OneDb *sharedManager;
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedManager = [[OneDb alloc] init];
//
//    });
//    
//    return sharedManager;
//}

/**
 *  使数据库加载，必须首先被调用
 */
+ (void)InitAvos {
    //加载avos
    [AVOSCloud setApplicationId:@"YviwVTzlpqPCX8srjQGYbEn2-gzGzoHsz"
                      clientKey:@"O4CJMNYkmnjTSVvxc9uKAqlt"];
}

+ (NSArray<Topic *> *)RecentTopics {
    //创建空数组
    NSMutableArray<Topic *> *topicList = [NSMutableArray array];
    
    AVQuery *queryTopic = [AVQuery queryWithClassName:@"TopicModel"];
    // 按时间，降序排列
    [queryTopic orderByDescending:@"createdAt"];
    queryTopic.limit = 10;//只返回最多10个结果
    NSArray<AVObject *> *recentTopics = [queryTopic findObjects];
    
    NSLog(@"topics num = %ld",recentTopics.count);
    
    for (AVObject *avTopic in recentTopics) {
        
        Topic *_topic = [Topic new];
        _topic.topicID = [[avTopic objectForKey:@"topicID"] integerValue];
        _topic.topicString = [avTopic objectForKey:@"topicString"];
        _topic.authorID = [[avTopic objectForKey:@"authorID"] integerValue];
        _topic.boardID = [[avTopic objectForKey:@"boardID"] integerValue];
        
        //取得用户名字符串
        AVQuery *query = [AVQuery queryWithClassName:@"UserTable"];
        [query whereKey:@"userID" equalTo:@(_topic.authorID)];
        AVObject *objectUserID = [query getFirstObject];
        // object 就是符合条件的第一个 AVObject
        _topic.authorName = [objectUserID objectForKey:@"userName"];
        
        //取得板块名字符串
        query = [AVQuery queryWithClassName:@"BoardTable"];
        [query whereKey:@"boardID" equalTo:@(_topic.boardID)];
        AVObject *objectBoardID = [query getFirstObject];
        _topic.boardName = [objectBoardID objectForKey:@"boardName"];
        
        //添加_topic进入topicList
        [topicList addObject:_topic];
    }

    return topicList;
}
@end