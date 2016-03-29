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
    topicLabel.font = [UIFont boldSystemFontOfSize:16];
    topicLabel.numberOfLines = 2;
    topicLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [self.tableView setTableHeaderView:topicLabel];
    //消除掉默认的分割线
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - Table view data source <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MsgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MsgTableViewCell"
                                                                  forIndexPath:indexPath];
    cell.message = [[Message alloc]init];
    return cell;
}

#pragma mark - Table View Delegate <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Message *message = self.dataList[indexPath.row];
    Message *message = [[Message alloc]init];
    return message.cellHeight + MsgCellBtnHeight + 25;
}
@end
