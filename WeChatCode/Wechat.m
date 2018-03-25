//
//  ViewController.m
//  WeChatCode
//
//  Created by OurEDA on 2018/3/24.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import "Wechat.h"

@interface Wechat ()
@property(nonatomic, strong) UISearchController *searchController;
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation Wechat

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
    CGRect screen = [[UIScreen mainScreen] bounds];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 80;
    [self.view addSubview:self.tableView];
    //search part, can't work cause don't override its methods
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = FALSE;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.searchController.searchBar sizeToFit];
    self.title = @"Wechat";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell"];
    if (cell == nil) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MessageCell"];
    }
//    NSInteger rowIndex=[indexPath row];
    cell.MessImageView.image = [UIImage imageNamed:@"message.jpg"];
    cell.MessImageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.MessTitleLabel.text = @"别想了，做梦也没有";
    cell.MessLastContentLabel.text = @"你说啥？";
    cell.MessLastTime.text = @"20:03";
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
