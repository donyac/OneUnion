//
//  BoardViewController.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/28.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "BoardViewController.h"
#import "BoardTableViewCell.h"

@implementation BoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //向表视图注册应该使用Cell class
    [self.tableView registerClass:[BoardTableViewCell class] forCellReuseIdentifier:@"BoardTableViewCell"];
    self.clearsSelectionOnViewWillAppear = NO;
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
    
    //cell.delegate = self;
    return cell;
}

#pragma mark - Table View Delegate <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0f;
}
@end
