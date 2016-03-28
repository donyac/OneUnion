//
//  MainViewController.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/26.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "MainViewController.h"
#import "TopicsViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

/**
 *  使用topicsViewController初始化首页
 *
 *  @return 类自己
 */
- (instancetype) init {
    TopicsViewController *topicsViewController = [[TopicsViewController alloc]init];
    self = [super initWithRootViewController:topicsViewController];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
