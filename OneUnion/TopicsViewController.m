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
#import "OneDb.h"
#import "Topic.h"


@interface TopicsViewController () <TopicTableViewCellDelegate>
@property (nonatomic, strong) NSArray<Topic *> *topicList;
@end

@implementation TopicsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        //初始化模型，获取首页
        self.topicList = [OneDb RecentTopics];
    }
    return self;
}

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
    UIImage *settingImage=[UIImage imageNamed:@"settings.png"];
    UIButton *settingBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [settingBtn setImage:settingImage forState:UIControlStateNormal];
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
    return self.topicList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicTableViewCell"
                                                               forIndexPath:indexPath];
    
    //根据index书写model
    if (cell) {
        cell.topicLabel.text = self.topicList[indexPath.row].topicString;
        [cell.floorHostBtn setTitle:self.topicList[indexPath.row].authorName
                           forState:UIControlStateNormal];
        [cell.boardBtn setTitle:self.topicList[indexPath.row].boardName
                       forState:UIControlStateNormal];
    }
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
    //这里应该带着topicId参数
    floorsViewController.topicID = self.topicList[indexPath.row].topicID;
    
    [self.navigationController pushViewController:floorsViewController animated:YES];
    NSLog(@"进入具体楼页面");
}

#pragma mark - TopicTableViewCellDelegate
- (void)boardButtonClicked:(NSString *)boardName {
    
    if (nil == boardName) {
        return;
    }
    
    NSLog(@"进入版区界面");
    BoardViewController *boardViewController = [[BoardViewController alloc]initWithBoardName:boardName];
    boardViewController.navigationItem.title = boardName;
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
