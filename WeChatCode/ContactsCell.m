//
//  MessageCell.m
//  WeChatCode
//
//  Created by OurEDA on 2018/3/24.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import "ContactsCell.h"

@implementation ContactsCell

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
        self.MessTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 30, 200, 30)];
        [self addSubview:self.MessImageView];
        [self addSubview:self.MessTitleLabel];
    }

    return self;
}
@end
