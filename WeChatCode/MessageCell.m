//
//  MessageCell.m
//  WeChatCode
//
//  Created by OurEDA on 2018/3/24.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

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
        self.MessImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
//        self.MessImageView.image=[UIImage imageNamed:@"message.jpg"];
        self.MessTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 200, 30)];
        self.MessLastContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, 200, 20)];
        self.MessLastContentLabel.font = [UIFont systemFontOfSize:15];
        self.MessLastContentLabel.textColor = [UIColor grayColor];
        self.MessLastTime = [[UILabel alloc] initWithFrame:CGRectMake(screen.size.width - 60, 14, 50, 20)];
        self.MessLastTime.font = [UIFont systemFontOfSize:15];
        self.MessLastTime.textColor = [UIColor grayColor];
        [self addSubview:self.MessImageView];
        [self addSubview:self.MessTitleLabel];
        [self addSubview:self.MessLastContentLabel];
        [self addSubview:self.MessLastTime];
    }

    return self;
}
@end
