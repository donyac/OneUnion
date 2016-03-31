//
//  WriteView.h
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/30.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Topic.h"

@interface WriteView : UIView
@property (nonatomic, strong) Topic *topic;

@property (nonatomic, strong) UILabel *topicLabel;
@property (nonatomic, strong) UITextField *topicTextField;
@property (nonatomic, strong) UITextField *contentTextFidld;

- (instancetype)initWithTopic:(Topic *) topic;
@end
