//
//  Message.h
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/28.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Message : NSObject
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign, readonly) CGFloat cellHeight;
@end
