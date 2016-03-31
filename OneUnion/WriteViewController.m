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
#import "OneDb.h"

@implementation WriteViewController

- (void) setupWithTopic:(Topic*) topic {
    self.topic = topic;
}

- (void)loadView {
    WriteView *writeView = [[WriteView alloc]initWithTopic:self.topic];
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
    
    WriteView *writeView = (WriteView *)(self.view);
    
    //修改floor，用于发送新楼层
    Floor *floor = [Floor new];
    floor.boardName = self.topic.boardName;
    floor.content = writeView.contentTextFidld.text;
    floor.authorID = 1;//先写死
    
    //向数据库发送floor和topic
    [OneDb SendWithFloor:floor andTopic:self.topic];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
