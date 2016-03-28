//
//  BoardTableViewCell.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/28.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "BoardTableViewCell.h"
#import "UIConfig.h"

@interface BoardTableViewCell ()
@property (nonatomic, strong) UILabel *topicLabel;
@property (nonatomic, strong) UILabel *floorHostLabel;
@property (nonatomic, strong) UILabel *pagesLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@end

@implementation BoardTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //在这里构建View
        self.contentView.backgroundColor = kDBHexColorf0f0f0;
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        UIView *subContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 5.0f, kDBScreenWidth, 65.0f)];
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
        
        const CGFloat Y = 45.0f;
        //楼主
        self.floorHostLabel = [[UILabel alloc] initWithFrame:CGRectMake(18.0f, Y, 85.0f, 17.0f)];
        self.floorHostLabel.font = kFontSizeSmall;
        self.floorHostLabel.textColor = kColorLightGray;
        self.floorHostLabel.text = @"我是楼主dwwddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd";
        [subContentView addSubview:self.floorHostLabel];

        //页数
        self.pagesLabel = [[UILabel alloc] initWithFrame:CGRectMake(115.0f, Y, 79.0f, 17.0f)];
        self.pagesLabel.font = kFontSizeSmall;
        self.pagesLabel.textColor = kColorLightGray;
        self.pagesLabel.text = @"123/9230";
        [subContentView addSubview:self.pagesLabel];
        
        //时间
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(180.0f, Y, 160.0f, 17.0f)];
        self.timeLabel.font = kFontSizeSmall;
        self.timeLabel.textColor = kColorLightGray;
        self.timeLabel.text = @"2016-03-27 22:30:20";
        [subContentView addSubview:self.timeLabel];
    }
    return self;
}
@end
