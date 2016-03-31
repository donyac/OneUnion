//
//  UserInfoTableViewCell.m
//  OneUnion
//
//  Created by 埋雷达人 on 16/3/28.
//  Copyright © 2016年 didichuxing. All rights reserved.
//

#import "UserInfoTableViewCell.h"
#import "UIConfig.h"

@implementation UserInfoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView *subContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 5.0f, kDBScreenWidth, 20.0f)];
        subContentView.backgroundColor = kColorWhite;
        [self.contentView addSubview:subContentView];
        
        //参数名
        self.keyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 2.0f, 60.0f, 17.0f)];
        self.keyLabel.font = kFontSizeSmall;
        self.keyLabel.textColor = kColorSkyBlue;
        self.keyLabel.text = @"参数名称";
        [subContentView addSubview:self.keyLabel];
        //参数值
        self.valueTextField = [[UITextField alloc] initWithFrame:CGRectMake(100.0f, 2.0f, 180.0f, 17.0f)];
        self.valueTextField.font = kFontSizeSmall;
        self.valueTextField.text = @"请输入值";
        [subContentView addSubview:self.valueTextField];
    }
    return self;
}

@end
