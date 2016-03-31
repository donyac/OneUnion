//
//  WriteViewController.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/29.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "WriteViewController.h"
#import "WriteView.h"
#import "UIConfig.h"
#import "Floor.h"

@implementation WriteViewController

- (void)loadView {
    WriteView *writeView = [[WriteView alloc]initWithTopicStr:self.topicStr andTopicID:self.topicID];
    self.view = writeView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加右侧发送按钮
    UIImage *sendImage=[UIImage imageNamed:@"send.png"];
    UIButton *sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [sendBtn setImage:sendImage forState:UIControlStateNormal];
    UIBarButtonItem *sendBtnItem = [[UIBarButtonItem alloc]initWithCustomView:sendBtn];
    self.navigationItem.rightBarButtonItem = sendBtnItem;
    [sendBtn addTarget:self action:@selector(sendBtnClicked) forControlEvents:UIControlEventPrimaryActionTriggered];
    
    self.view.backgroundColor = kColorWhite;

}

#pragma mark - send
- (void)sendBtnClicked {
    NSLog(@"发送帖子");
    
    NSInteger topicID = self.topicID;
    WriteView *writeView = (WriteView *)(self.view);
    NSString *topicStr = nil;
    if (topicID > 0) {
        //已经有现成的topicStr了
        topicStr = writeView.topicLabel.text;
    } else {
        //topicStr需要从用户的输入中获取
        topicStr = writeView.topicTextField.text;
    }
    
    NSString *content = writeView.contentTextFidld.text;
    
    //构建一个floor，用于发送楼层
    Floor *floor = [[Floor alloc]init];
    floor.floorID = -1;//给一个非法id，
    floor.topicID = topicID;
    floor.content = writeView.contentTextFidld.text;
    floor.authorID = 1;//先写死
    floor.boardName = self.boardName;
}
@end
