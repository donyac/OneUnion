//
//  FloorsViewController.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/28.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "FloorsViewController.h"
#import "MsgTableViewCell.h"
#import "WriteViewController.h"

#import "OneDb.h"
#import "UIConfig.h"

@interface FloorsViewController ()

@property (nonatomic, strong) NSArray<Floor *> *floorList;
@property (nonatomic, strong) Topic *topic;
@end

@implementation FloorsViewController

- (void)setupWithTopic:(Topic*) topic{
    self.topic = topic;
    self.floorList = [OneDb AllFloors:topic.topicID];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //向注册表注册使用应该使用的Cell
    [self.tableView registerClass:[MsgTableViewCell class] forCellReuseIdentifier:@"MsgTableViewCell"];
    self.clearsSelectionOnViewWillAppear = NO;
    
    //添加一个头
    UILabel *topicLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, kDBScreenWidth, 20.0f)];
    topicLabel.text = self.topic.topicString;
    topicLabel.font = [UIFont boldSystemFontOfSize:16];
    topicLabel.numberOfLines = 2;
    topicLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [self.tableView setTableHeaderView:topicLabel];
    
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

- (void)viewWillAppear:(BOOL)animated {
    //用刷新model
    self.floorList = [OneDb AllFloors:self.topic.topicID];
    [self.tableView reloadData];
}

#pragma mark - Table view data source <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.floorList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MsgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MsgTableViewCell"
                                                                  forIndexPath:indexPath];
    if (cell) {
        cell.floor = self.floorList[indexPath.row];
    }
    
    return cell;
}

#pragma mark - Table View Delegate <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.floorList[indexPath.row].cellHeight + MsgCellBtnHeight + 25;
}

#pragma mark - setting
- (void)writeBtnClicked {
    NSLog(@"进入发帖界面");
    WriteViewController *writeViewController = [[WriteViewController alloc]init];
    [writeViewController setupWithTopic:self.topic];
    writeViewController.navigationItem.title = @"发表回复";
    [self.navigationController pushViewController:writeViewController animated:YES];
}
@end
