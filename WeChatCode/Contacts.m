//
//  ViewController.m
//  WeChatCode
//
//  Created by OurEDA on 2018/3/24.
//  Copyright © 2018年 OurEDA. All rights reserved.
//

#import "Contacts.h"

@interface Contacts ()
@property(nonatomic, strong) UISearchController *searchController;
@property(nonatomic, strong) UITableView *tableView;
@property(strong, nonatomic) NSUserDefaults *myUserDefaults;
@property(strong, nonatomic) NSArray *demoArray;
@property(nonatomic, strong) UIButton *addContactButton;
@property(nonatomic, strong) NSDictionary *dict;
@property(nonatomic, strong) NSMutableDictionary *sandboxDic;
@property(nonatomic, strong) NSString *filePath;
@end

@implementation Contacts

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additionalo setup after loading the view, typically from a nib.
    self.title = @"Contacts";

    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"Contacts" ofType:@"plist"];
    self.dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
            stringByAppendingPathComponent:@"/Contacts.plist"];
    //将工程中的数据新字典写入沙盒
    [self.dict writeToFile:self.filePath atomically:YES];
    self.sandboxDic = [[NSMutableDictionary alloc] initWithContentsOfFile:self.filePath];
//    NSLog(@"sandbox:");
//    NSLog(@"%@",sandboxDic);
//    NSLog(@"%@",self.dict.allValues);
    self.demoArray = [self.sandboxDic allValues];
    NSLog(@"%@", self.demoArray);
    self.demoArray = [self.demoArray arrayWithPinYinFirstLetterFormat];
    NSLog(@"%@", self.demoArray);
//    self.demoArray=[NSArray arrayWithContentsOfFile:plistPath];
//    NSLog(@"%@",[[self.dict objectForKey:self.demoArray[0]] objectForKey:@"Name"]);
    self.myUserDefaults = [NSUserDefaults standardUserDefaults];

    CGRect screen = [[UIScreen mainScreen] bounds];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 80;
    [self.view addSubview:self.tableView];

    //TODO:addButton
//    self.addContactButton = [[UIButton alloc] initWithFrame:CGRectMake(screen.size.width - 70, 20, 50, 30)];
//    [self.addContactButton setTitle:@"New+" forState:UIControlStateNormal];
//    [self.addContactButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
//    [self.addContactButton addTarget:self action:@selector(addContactsButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.addContactButton];
    //search part, can't work cause don't override its methods
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = FALSE;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.searchController.searchBar sizeToFit];
}

- (void)addContactsButtonPressed:(id)sender {
    NSLog(@"Add Contacts Button was Pressed.");
//    NewContactViewController *myNewContactVC = [[NewContactViewController alloc] init];
//    [self.navigationController pushViewController:myNewContactVC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dict = self.demoArray[section];
    NSMutableArray *array = dict[@"content"];
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactsCell"];
    if (cell == nil) {
        cell = [[ContactsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ContactsCell"];
    }
//    NSInteger rowIndex=[indexPath row];
    cell.MessImageView.image = [UIImage imageNamed:@"message.jpg"];
    cell.MessImageView.contentMode = UIViewContentModeScaleAspectFill;
    NSDictionary *dict = self.demoArray[indexPath.section];
    NSMutableArray *array = dict[@"content"];
    cell.MessTitleLabel.text = [[array objectAtIndex:[indexPath row]] objectForKey:@"Name"];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.demoArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}
- (void)viewWillAppear:(BOOL)animated {
    self.sandboxDic = [[NSMutableDictionary alloc] initWithContentsOfFile:self.filePath];
    self.demoArray = [self.sandboxDic allValues];
    self.demoArray = [self.demoArray arrayWithPinYinFirstLetterFormat];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark---tableView索引相关设置----

//添加TableView头视图标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    if (section == 0) {
//        return nil;
//    } else {
        NSDictionary *dict = self.demoArray[section];
        NSString *title = dict[@"firstLetter"];
        return title;
//    }
}


//添加索引栏标题数组
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *resultArray = [NSMutableArray arrayWithObject:UITableViewIndexSearch];
    for (NSDictionary *dict in self.demoArray) {
        NSString *title = dict[@"firstLetter"];
        [resultArray addObject:title];
    }
    return resultArray;
}


//点击索引栏标题时执行
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    //这里是为了指定索引index对应的是哪个section的，默认的话直接返回index就好。其他需要定制的就针对性处理
    if ([title isEqualToString:UITableViewIndexSearch]) {
        NSLog(@"Click search index");
//        [tableView setContentOffset:CGPointZero animated:NO];//tabview移至顶部
        [tableView scrollRectToVisible:self.searchController.searchBar.frame animated:NO];
        return NSNotFound;
    } else {
        NSLog(@"Click index %ld",index);
        return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index] - 1; // -1 添加了搜索标识
    }
}

@end
