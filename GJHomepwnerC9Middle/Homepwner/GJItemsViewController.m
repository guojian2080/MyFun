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
@property (nonatomic, strong) IBOutlet UIView *headerView;
@end

@implementation GJItemsViewController

- (NSArray *) items
{
    if (!_items) {
        for (int i = 0; i < 5; i++) {
            [[GJItemStore sharedStore] createItem];
        }
        _items = [[GJItemStore sharedStore] allItems];
    }
    
    return _items;
}

- (UIView *)headerView
{
    if (!_headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return _headerView;
}

- (IBAction)addNewItem:(id)sender
{
    GJItem *newItem = [[GJItemStore sharedStore] createItem];
    NSInteger lastRow = [[[GJItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

- (IBAction)toggleEditingMode:(id)sender
{
    if (self.isEditing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        
        [self setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

- (instancetype) init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
//        for (int i = 0; i < 5; i++) {
            [[GJItemStore sharedStore] createItem];
//        }
    }
    return  self;
}

- (instancetype) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}

#pragma mark - dataSource方法
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [[[GJItemStore sharedStore] allItems] count] + 1;
    return self.items.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
//    NSArray *items = [[GJItemStore sharedStore] allItems];
//    if (indexPath.row < [items count]) {
//        GJItem *item = items[indexPath.row];
//        cell.textLabel.text = [item description];
//    }else{
//        cell.textLabel.text = @"No more items!";
//        cell.userInteractionEnabled = NO;
//    }
    if (indexPath.row < self.items.count) {
        cell.textLabel.text = [self.items[indexPath.row] description];
    } else {
        cell.textLabel.text = @"No more items!";
        cell.userInteractionEnabled = NO;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[GJItemStore sharedStore] allItems];
        GJItem *item = items[indexPath.row];
        [[GJItemStore sharedStore] removeItem:item];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
//    NSArray *items = [[GJItemStore sharedStore] allItems];
    if ((sourceIndexPath.row < self.items.count - 1) && (destinationIndexPath.row < self.items.count - 1)) {
        [[GJItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
    }
    
}

@end
