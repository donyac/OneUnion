//
//  FloorsViewController.h
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/28.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FloorsViewController : UITableViewController

-(instancetype) initWithTopicID:(NSInteger) topicID andTopicName:(NSString*) topicName;
- (void)setTopicName:(NSString*) topicName;
@end
