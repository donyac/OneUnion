//
//  Message.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/28.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "Message.h"

const static int contentFont = 12;

@implementation Message
@synthesize cellHeight = _cellHeight;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.content = @"test content";
        self.uid = @"Peter";
    }
    return self;
}

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
