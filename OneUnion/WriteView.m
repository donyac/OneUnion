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

- (instancetype)initWithTopicStr:(NSString*) topicStr andTopicID:(NSInteger) topicID{
    self = [super init];
    if (self) {
        self.topicID = topicID;
        
        if (topicStr) {
            self.topicLabel = [[UILabel alloc]initWithFrame:CGRectMake(5,70, kDBScreenWidth-10, 20)];
            self.topicLabel.text = topicStr;
            self.topicLabel.backgroundColor =kColorWhite;
            [self addSubview:self.topicLabel];
            
        } else {
            self.topicTextField = [[UITextField alloc]initWithFrame:CGRectMake(5,70, kDBScreenWidth-10, 20)];
            self.topicTextField.backgroundColor = kColorLightGray1;
            [self addSubview:self.topicTextField];
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
