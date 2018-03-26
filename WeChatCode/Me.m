//
//  ViewController.m
//  WeChatCode
//
//  Created by OurEDA on 2018/3/24.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import "Me.h"

@interface Me ()
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation Me

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"Me";
    CGRect screen = [[UIScreen mainScreen] bounds];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
//    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
//    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//    self.tableView.section
    [self.view addSubview:self.tableView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 1;
        case 2:
            return 4;
        case 3:
            return 1;
    }
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" ";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"defaultCell";
    if (indexPath.section == 0) {
        UserselfCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserselfCell"];
        if (cell == nil) {
            cell = [[UserselfCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UserselfCell"];
            NSLog(@"______");
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.UserShortPicImageView.image = [UIImage imageNamed:@"message.jpg"];
        cell.UserShortPicImageView.contentMode = UIViewContentModeScaleAspectFill;
        cell.UserNameLabel.text = @"Three thousand stars";
        cell.UserTelLabel.text = @"wechat: TingAlex29";
        return cell;
    } else {
        UITableViewCell *defaultCell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (defaultCell == nil) {
            defaultCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        }
        if (indexPath.section == 1) {
            if (indexPath.row== 0) {
                defaultCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                defaultCell.textLabel.text = @"Pocket";
                defaultCell.imageView.image = [UIImage imageNamed:@"Pocket.png"];
                defaultCell.imageView.contentMode = UIViewContentModeScaleAspectFill;
            }
        }
        if (indexPath.section == 2) {
            if (indexPath.row== 0) {
                defaultCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                defaultCell.textLabel.text = @"Collection";
                defaultCell.imageView.image = [UIImage imageNamed:@"Collection.png"];
                defaultCell.imageView.contentMode = UIViewContentModeScaleAspectFill;
            }
            if (indexPath.row== 1) {
                defaultCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                defaultCell.textLabel.text = @"Album";
                defaultCell.imageView.image = [UIImage imageNamed:@"Album.png"];
                defaultCell.imageView.contentMode = UIViewContentModeScaleAspectFill;
            }
            if (indexPath.row== 2) {
                defaultCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                defaultCell.textLabel.text = @"Cards";
                defaultCell.imageView.image = [UIImage imageNamed:@"Cards.png"];
                defaultCell.imageView.contentMode = UIViewContentModeScaleAspectFill;
            }
            if (indexPath.row== 3) {
                defaultCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                defaultCell.textLabel.text = @"Emoj";
                defaultCell.imageView.image = [UIImage imageNamed:@"Face.png"];
                defaultCell.imageView.contentMode = UIViewContentModeScaleAspectFill;
            }

        }
        if (indexPath.section == 3) {
            if (indexPath.row== 0) {
                defaultCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                defaultCell.textLabel.text = @"Settings";
                defaultCell.imageView.image = [UIImage imageNamed:@"Settings.png"];
                defaultCell.imageView.contentMode = UIViewContentModeScaleAspectFill;
            }
        }

        return defaultCell;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    }
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
