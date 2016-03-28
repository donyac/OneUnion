//
//  FloorsViewController.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/28.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "FloorsViewController.h"
#import "MsgTableViewCell.h"
#import "UIConfig.h"

@implementation FloorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //向注册表注册使用应该使用的Cell
    [self.tableView registerClass:[MsgTableViewCell class] forCellReuseIdentifier:@"MsgTableViewCell"];
    self.clearsSelectionOnViewWillAppear = NO;
    
    //添加一个头
    UILabel *topicLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, kDBScreenWidth, 20.0f)];
    topicLabel.text = @"我是Topic";
    topicLabel.font = [UIFont boldSystemFontOfSize:14];
    topicLabel.numberOfLines = 2;
    topicLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [self.tableView setTableHeaderView:topicLabel];
}
@end
