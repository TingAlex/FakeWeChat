//
//  MessageCell.h
//  WeChatCode
//
//  Created by OurEDA on 2018/3/24.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell
@property(strong, nonatomic) UILabel *MessTitleLabel;
@property(strong, nonatomic) UILabel *MessLastContentLabel;
@property(strong, nonatomic) UIImageView *MessImageView;
@property(strong, nonatomic) UILabel *MessLastTime;
@end
