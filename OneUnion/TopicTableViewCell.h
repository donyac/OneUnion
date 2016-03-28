//
//  TopicTableViewCell.h
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/27.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopicTableViewCellDelegate <NSObject>
@optional
// 状态改变
- (void)boardButtonClicked:(NSString *)btnTitle;
- (void)personInformationClicked:(NSString *)personName;
@end

@interface TopicTableViewCell : UITableViewCell

@property (nonatomic, weak) id<TopicTableViewCellDelegate> delegate;
@end
