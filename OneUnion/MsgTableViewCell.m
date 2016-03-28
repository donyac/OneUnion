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
        
        UIView *subContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDBScreenWidth, 100.0f)];
        subContentView.backgroundColor = kColorLightGray;
        [self.contentView addSubview:subContentView];
        
        self.idBtn = [[UIButton alloc]initWithFrame:CGRectMake(2, 2, 120, 50)];
        UIImage *headImage=[UIImage imageNamed:@"head.png"];
        [self.idBtn setImage:headImage forState:UIControlStateNormal];
        [self.idBtn setTitle:@"王二" forState:UIControlStateNormal];
        [subContentView addSubview:self.idBtn];
        
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 52, kDBScreenWidth, 48)];
        self.contentLabel.text = _message.content;
        self.contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [subContentView addSubview:self.contentLabel];
    }
    return self;
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    self.idBtn.frame.size.height
//}

#pragma setter

- (void)setMessage:(Message *)message {
    _message = message;
    self.contentLabel.text = _message.content;
}
@end
