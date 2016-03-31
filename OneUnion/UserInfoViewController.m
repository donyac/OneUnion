//
//  UserInfoViewController.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/28.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoTableViewCell.h"
#import "UIConfig.h"

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //向表视图注册应该使用Cell class
    [self.tableView registerClass:[UserInfoTableViewCell class] forCellReuseIdentifier:@"UserInfoTableViewCell"];
    self.clearsSelectionOnViewWillAppear = NO;
    //添加一个头
    UIImageView *headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, kDBScreenWidth, 100.0f)];
    [headerView setImage:[UIImage imageNamed:@"me.png"]];
    headerView.contentMode = UIViewContentModeCenter;
    [self.tableView setTableHeaderView:headerView];
    //消除掉默认的分割线
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - Table view data source <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserInfoTableViewCell"
                                                               forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.keyLabel.text = @"用户名";
            break;
        case 1:
            cell.keyLabel.text = @"用户权限等级";
        default:
            break;
    }
    
    return cell;
}

#pragma mark - Table View Delegate <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 25.0f;
}
@end
