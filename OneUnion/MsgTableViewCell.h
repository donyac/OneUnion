//
//  MsgTableViewCell.h
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/28.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Floor.h"

const static CGFloat MsgCellBtnHeight = 30.0f;

@interface MsgTableViewCell : UITableViewCell
@property (nonatomic,strong) Floor *floor;
@end
