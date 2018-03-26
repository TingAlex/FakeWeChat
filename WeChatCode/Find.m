//
//  ViewController.m
//  WeChatCode
//
//  Created by OurEDA on 2018/3/24.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import "Find.h"

@interface Find ()
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation Find

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor redColor];
//    self.navigationController.title=@"Find";
    self.title = @"Find";

    CGRect screen = [[UIScreen mainScreen] bounds];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
//    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//    self.tableView.section
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" ";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"defaultCell";
    UITableViewCell *defaultCell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell"];
    if (defaultCell == nil) {
        defaultCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
//    NSInteger rowIndex=[indexPath row];
    defaultCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if ([indexPath section] == 0 && [indexPath row] == 0) {
        defaultCell.textLabel.text = @"Friend Zone";
        defaultCell.imageView.image = [UIImage imageNamed:@"Zone.png"];
        defaultCell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    if ([indexPath section] == 1 && [indexPath row] == 0) {
        defaultCell.textLabel.text = @"Scaner";
        defaultCell.imageView.image = [UIImage imageNamed:@"Scaner.png"];
        defaultCell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    if ([indexPath section] == 2 && [indexPath row] == 0) {
        defaultCell.textLabel.text = @"Small Programs";
        defaultCell.imageView.image = [UIImage imageNamed:@"Link.png"];
        defaultCell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }

    return defaultCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
