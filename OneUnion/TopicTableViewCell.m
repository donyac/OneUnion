//
//  TopicTableViewCell.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/27.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "TopicTableViewCell.h"
#import "UIConfig.h"

@interface TopicTableViewCell ()
@property (nonatomic, strong) UILabel *topicLabel;
@property (nonatomic, strong) UIButton *boardBtn;
@property (nonatomic, strong) UIButton *floorHostBtn;
@end

@implementation TopicTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //在这里构建View
        self.contentView.backgroundColor = kDBHexColorf0f0f0;
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        UIView *subContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 5.0f, kDBScreenWidth, 70.0f)];
        subContentView.backgroundColor = kColorWhite;
        [self.contentView addSubview:subContentView];
        
        //标题
        self.topicLabel = [[UILabel alloc] initWithFrame:CGRectMake(18.0f, 10.0f, kDBScreenWidth-18.0f*2, 34.0f)];
        self.topicLabel.font = kFontSizeMedium;
        self.topicLabel.numberOfLines = 2;
        self.topicLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.topicLabel.textColor = kColorDeepGray;
        self.topicLabel.text = @"我是标题dwwddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd";
        [subContentView addSubview:self.topicLabel];
        
        //版区按钮
        self.boardBtn = [[UIButton alloc]initWithFrame:CGRectMake(18.0f, 50.0f, 100.0f, 17.0f)];
        self.boardBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//左对齐
        self.boardBtn.titleLabel.font = kFontSizeSmall;
        [self.boardBtn setTitle:@"灌水乐园" forState:UIControlStateNormal];
        [self.boardBtn setTitleColor:kColorBlue forState:UIControlStateNormal];
        [subContentView addSubview:self.boardBtn];
        [self.boardBtn addTarget:self action:@selector(boardClicked) forControlEvents:UIControlEventPrimaryActionTriggered];
        
        //楼主按钮
        self.floorHostBtn = [[UIButton alloc]initWithFrame:CGRectMake((kDBScreenWidth-120.0f-18.0f), 50.0f, 120.0f, 17.0f)];
        self.floorHostBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;//左对齐
        self.floorHostBtn.titleLabel.font = kFontSizeSmall;
        [self.floorHostBtn setTitle:@"我是楼主啊啊啊啊啊啊啊的顶顶顶顶顶啊啊啊" forState:UIControlStateNormal];
        [self.floorHostBtn setTitleColor:kColorBlue forState:UIControlStateNormal];
        [subContentView addSubview:self.floorHostBtn];
        [self.floorHostBtn addTarget:self action:@selector(floorHostClicked) forControlEvents:UIControlEventPrimaryActionTriggered];
    }
    return self;
}

/**
 *  版区按钮被点击
 */
- (void)boardClicked {
    if ([self.delegate respondsToSelector:@selector(boardButtonClicked:)]) {
        [self.delegate boardButtonClicked:self.boardBtn.titleLabel.text];
    }
    else {
        NSLog(@"未定义委托");
    }
}

/**
 *  获取楼主信息的按钮被点击
 */
- (void)floorHostClicked {
    if ([self.delegate respondsToSelector:@selector(personInformationClicked:)]) {
        [self.delegate personInformationClicked:self.floorHostBtn.titleLabel.text];//楼主id

    } else {
        NSLog(@"未定义委托");
    }
}

/**
 *  获取自身信息的按钮被点击
 */
- (void)settingClicked {
    if ([self.delegate respondsToSelector:@selector(personInformationClicked:)]) {
        [self.delegate personInformationClicked:@"me"];//此处实际传的应该是我自己的id
        
    } else {
        NSLog(@"未定义委托");
    }
}

@end
