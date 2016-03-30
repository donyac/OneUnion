//
//  Floor.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/30.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "Floor.h"

const static int contentFont = 12;

@implementation Floor
@synthesize cellHeight = _cellHeight;

/**
 *  重写cellHeight的getter方法，模型负责计算cell高度
 *
 *  @return cell height
 */
- (CGFloat)cellHeight {
    if (!_cellHeight) {
        CGFloat contentW = [UIScreen mainScreen].bounds.size.width;
        CGFloat contentH = [self.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT)
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentFont]}
                                                      context:nil].size.height;
        _cellHeight = contentH;
    }
    return _cellHeight;
}
@end
