//
//  GJItemsViewController.m
//  Homepwner
//
//  Created by 郭健 on 16/5/10.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJItemsViewController.h"
#import "GJItemStore.h"
#import "GJItem.h"

@interface GJItemsViewController ()

@property (nonatomic, strong) NSArray *items;

@end

@implementation GJItemsViewController

- (NSArray *) items
{
    if (!_items) {
        _items = [[GJItemStore sharedStore] allItems];
    }
    return _items;
}


- (instancetype) init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[GJItemStore sharedStore] createItem];
        }
    }
    return  self;
}

- (instancetype) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

#pragma mark - dataSource方法
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray *tmpItems = [NSMutableArray array];
    NSMutableArray *tmpItems2 = [NSMutableArray array];
    for (GJItem *item in self.items) {
        if (item.valueInDollars > 50) {
            [tmpItems addObject:item];
        }else{
            [tmpItems2 addObject:item];
        }
    }
    if (section == 0) {
        return [tmpItems count];
    } else {
        return [tmpItems2 count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSMutableArray *tmpItems = [NSMutableArray array];
    NSMutableArray *tmpItems2 = [NSMutableArray array];
    for (GJItem *item in self.items) {
        if (item.valueInDollars > 50) {
            [tmpItems addObject:item];
        }else{
            [tmpItems2 addObject:item];
        }
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = [tmpItems[indexPath.row] description];
    } else {
        cell.textLabel.text = [tmpItems2[indexPath.row] description];
    }
    
//    NSArray *items = [[GJItemStore sharedStore] allItems];
//    GJItem *item = items[indexPath.row];
//    cell.textLabel.text = [item description];
    return cell;
}

@end
