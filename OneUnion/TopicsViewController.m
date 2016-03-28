//
//  TopicsViewController.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/26.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "TopicsViewController.h"
#import "TopicTableViewCell.h"
#import "BoardViewController.h"
#import "UserInfoViewController.h"
#import "FloorsViewController.h"
#import "UIConfig.h"

@interface TopicsViewController () <TopicTableViewCellDelegate>

@end

@implementation TopicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //向表视图注册应该使用Cell class
    [self.tableView registerClass:[TopicTableViewCell class] forCellReuseIdentifier:@"TopicTableViewCell"];
    self.clearsSelectionOnViewWillAppear = NO;
    //消除掉默认的分割线
    self.tableView.tableFooterView = [UIView new];
    //修改导航条背景色
    self.navigationController.navigationBar.backgroundColor = kColorSkyBlue;
    //修改标题字符
    self.navigationItem.title = @"北理FTP联盟";
    //修改返回按钮文字
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backButton];
    //添加右侧按钮
    UIImage *loadImage=[UIImage imageNamed:@"settings.png"];
    UIButton *settingBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [settingBtn setImage:loadImage forState:UIControlStateNormal];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc]initWithCustomView:settingBtn];
    self.navigationItem.rightBarButtonItem = settingBtnItem;
    [settingBtn addTarget:self action:@selector(settingBtnClicked) forControlEvents:UIControlEventPrimaryActionTriggered];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicTableViewCell"
                                                               forIndexPath:indexPath];
    cell.delegate = self;
    return cell;
}

#pragma mark - Table View Delegate <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FloorsViewController *floorsViewController = [[FloorsViewController alloc]init];
    [self.navigationController pushViewController:floorsViewController animated:YES];
}

#pragma mark - TopicTableViewCellDelegate
- (void)boardButtonClicked:(NSString *)btnTitle {
    if (nil == btnTitle) {
        return;
    }
    
    NSLog(@"进入版区界面");
    BoardViewController *boardViewController = [[BoardViewController alloc]init];
    boardViewController.navigationItem.title = btnTitle;
    [self.navigationController pushViewController:boardViewController animated:YES];
}

- (void)personInformationClicked:(NSString *)peasonName {
    if (nil == peasonName) {
        return;
    }
    
    NSLog(@"进入个人信息页面");
    UserInfoViewController *userInfoViewController = [[UserInfoViewController alloc]init];
    userInfoViewController.navigationItem.title = @"个人资料";
    [self.navigationController pushViewController:userInfoViewController animated:YES];
}

#pragma mark - setting
- (void)settingBtnClicked {
    NSLog(@"进入设置界面");

}
@end
