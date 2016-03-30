//
//  Floor.h
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/30.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Floor : NSObject
@property (nonatomic, assign) NSInteger floorID;
@property (nonatomic, assign) NSInteger topicID;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) NSInteger authorID;
@property (nonatomic, copy) NSString *authorName;
@property (nonatomic, copy) NSString *boardName;
@property (nonatomic, strong) NSDate *timeStamp;

@property (nonatomic, assign, readonly) CGFloat cellHeight;
@end
