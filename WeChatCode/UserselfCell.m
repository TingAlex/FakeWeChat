//
//  MessageCell.m
//  WeChatCode
//
//  Created by OurEDA on 2018/3/24.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import "UserselfCell.h"

@implementation UserselfCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect screen = [[UIScreen mainScreen] bounds];
        self.UserShortPicImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
//        self.MessImageView.image=[UIImage imageNamed:@"message.jpg"];
        self.UserNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 200, 30)];
        self.UserTelLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 40, 200, 30)];
        self.UserTelLabel.font = [UIFont systemFontOfSize:15];
        self.UserTelLabel.textColor = [UIColor grayColor];
        [self addSubview:self.UserShortPicImageView];
        [self addSubview:self.UserNameLabel];
        [self addSubview:self.UserTelLabel];
    }

    return self;
}
@end
