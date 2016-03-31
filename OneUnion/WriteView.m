//
//  WriteView.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/30.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "WriteView.h"
#import "UIConfig.h"


@implementation WriteView

- (instancetype)initWithTopic:(Topic *) topic{
    self = [super init];
    if (self) {
        self.topic = topic;
        
        if (topic.topicID == 0) {//如果id==0，说明是发表新主题，需要画上主题文本输入框
            self.topicTextField = [[UITextField alloc]initWithFrame:CGRectMake(5,70, kDBScreenWidth-10, 20)];
            self.topicTextField.backgroundColor = kColorLightGray1;
            [self addSubview:self.topicTextField];
        }
        else {
            self.topicLabel = [[UILabel alloc]initWithFrame:CGRectMake(5,70, kDBScreenWidth-10, 20)];
            self.topicLabel.backgroundColor = kColorWhite;
            self.topicLabel.text = topic.topicString;
            [self addSubview:self.topicLabel];
        }
        
        self.contentTextFidld = [[UITextField alloc]initWithFrame:CGRectMake(10,100,kDBScreenWidth-20,kDBScreenHeight/2)];
        self.contentTextFidld.borderStyle = UITextBorderStyleRoundedRect;
        self.contentTextFidld.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        self.contentTextFidld.returnKeyType = UIReturnKeyDone;
        self.contentTextFidld.backgroundColor = kColorLightGray;
        [self addSubview:self.contentTextFidld];
    }
    return self;
}


@end
