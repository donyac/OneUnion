//
//  BoardViewController.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/28.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "BoardViewController.h"
#import "BoardTableViewCell.h"
#import "WriteViewController.h"

@implementation BoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //向表视图注册应该使用Cell class
    [self.tableView registerClass:[BoardTableViewCell class] forCellReuseIdentifier:@"BoardTableViewCell"];
    self.clearsSelectionOnViewWillAppear = NO;
    
    //添加右侧写贴按钮
    UIImage *writeImage=[UIImage imageNamed:@"write.png"];
    UIButton *writeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [writeBtn setImage:writeImage forState:UIControlStateNormal];
    UIBarButtonItem *writeBtnItem = [[UIBarButtonItem alloc]initWithCustomView:writeBtn];
    self.navigationItem.rightBarButtonItem = writeBtnItem;
    [writeBtn addTarget:self action:@selector(writeBtnClicked) forControlEvents:UIControlEventPrimaryActionTriggered];
    //消除掉默认的分割线
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - Table view data source <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BoardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BoardTableViewCell"
                                                               forIndexPath:indexPath];
    //告诉cell各个子view的高度
    return cell;
}

#pragma mark - Table View Delegate <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cell总高度
    return 75.0f;
}

#pragma mark - setting
- (void)writeBtnClicked {
    NSLog(@"进入发帖界面");
    WriteViewController *writeViewController = [[WriteViewController alloc]init];
    writeViewController.navigationItem.title = @"发表新帖";
    [self.navigationController pushViewController:writeViewController animated:YES];
}
@end
