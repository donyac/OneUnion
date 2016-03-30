//
//  WriteView.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/30.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "WriteView.h"
#import "UIConfig.h"


@interface WriteView()
@property (nonatomic, strong) NSString *topicStr;
@property (nonatomic, assign) NSInteger topicID;
@end

@implementation WriteView

- (instancetype)initWithTopicStr:(NSString*) topicStr andTopicID:(NSInteger) topicID{
    self = [super init];
    if (self) {
        self.topicStr = topicStr;
        self.topicID = topicID;
        
        if (self.topicStr) {
            UILabel *topicLabel = [[UILabel alloc]initWithFrame:CGRectMake(5,70, kDBScreenWidth-10, 20)];
            topicLabel.text = topicStr;
            topicLabel.backgroundColor =kColorWhite;
            [self addSubview:topicLabel];
            
        } else {
            UITextField *topicTextField = [[UITextField alloc]initWithFrame:CGRectMake(5,70, kDBScreenWidth-10, 20)];
            topicTextField.backgroundColor = kColorLightGray1;
            [self addSubview:topicTextField];
        }
        UITextField *contentTextFidld = [[UITextField alloc]initWithFrame:CGRectMake(10,100,kDBScreenWidth-20,kDBScreenHeight/2)];
        contentTextFidld.borderStyle = UITextBorderStyleRoundedRect;
        contentTextFidld.returnKeyType = UIReturnKeyDone;
        contentTextFidld.backgroundColor = kColorLightGray;
        [self addSubview:contentTextFidld];
    }
    return self;
}


@end
