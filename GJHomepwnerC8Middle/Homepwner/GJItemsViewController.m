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
@implementation GJItemsViewController

- (instancetype) init
{
    self = [super initWithStyle:UITableViewStylePlain];
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
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[GJItemStore sharedStore] allItems] count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items = [[GJItemStore sharedStore] allItems];
    if (indexPath.row < [items count]) {
        GJItem *item = items[indexPath.row];
        cell.textLabel.text = [item description];
    }else{
        cell.textLabel.text = @"No more items!";
    }
    return cell;
}

@end
