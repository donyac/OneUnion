//
//  WriteViewController.h
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/29.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Topic.h"

@interface WriteViewController : UIViewController
@property (nonatomic, strong) Topic* topic;

- (void)setupWithTopic:(Topic*) topic;
@end
