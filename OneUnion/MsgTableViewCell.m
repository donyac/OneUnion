//
//  MsgTableViewCell.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/28.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "MsgTableViewCell.h"
#import "UIConfig.h"

@interface MsgTableViewCell ()
@property (nonatomic, strong) UIButton *idBtn;
@property (nonatomic, strong) UILabel *floorIndexLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *quoteLabel;
@end

@implementation MsgTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //在这里构建View
        self.contentView.backgroundColor = kColorWhite;
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        NSLog(@"Init cell");
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSLog(@"In layoutSubviews");
    if (self.message == nil) {
        NSLog(@"message is nil");
    }
    else {
        CGFloat cellHeight = self.message.cellHeight;
        UIView *subContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDBScreenWidth, MsgCellBtnHeight+cellHeight+10)];
        subContentView.backgroundColor = kColorLightGray1;
        [self.contentView addSubview:subContentView];
        
        self.idBtn = [[UIButton alloc]initWithFrame:CGRectMake(2, 2, 100, MsgCellBtnHeight)];
        UIImage *headImage=[UIImage imageNamed:@"head.png"];
        [self.idBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.idBtn setImage:headImage forState:UIControlStateNormal];
        //button图片的偏移量，距上左下右分别(0, 0, 0, 70)像素点
        self.idBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 70);
        [self.idBtn setTitle:self.message.uid forState:UIControlStateNormal];
        //button标题的偏移量，这个偏移量是相对于图片的
        self.idBtn.titleEdgeInsets = UIEdgeInsetsMake(0,-70, 0, 0);
        [subContentView addSubview:self.idBtn];
        
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, kDBScreenWidth, cellHeight+20)];
        self.contentLabel.text = self.message.content;
        self.contentLabel.font = kFontSizeMedium;
        self.contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.contentLabel.backgroundColor = kColorWhite;
        [subContentView addSubview:self.contentLabel];
    }
}

#pragma setter

- (void)setMessage:(Message *)message {
    _message = message;
    self.contentLabel.text = _message.content;
    NSLog(@"set message");
}
@end
