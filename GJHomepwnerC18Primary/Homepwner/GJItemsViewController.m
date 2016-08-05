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
#import "GJDetailViewController.h"
@interface GJItemsViewController ()
//@property (nonatomic, strong) IBOutlet UIView *headerView;
@end

@implementation GJItemsViewController

//- (UIView *)headerView
//{
//    if (!_headerView) {
//        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
//    }
//    return _headerView;
//}

- (IBAction)addNewItem:(id)sender
{
    GJItem *newItem = [[GJItemStore sharedStore] createItem];
    
//    NSInteger lastRow = [[[GJItemStore sharedStore] allItems] indexOfObject:newItem];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
//    
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
    GJDetailViewController *detailViewController = [[GJDetailViewController alloc] initForNewItem:YES];
    detailViewController.item = newItem;
    detailViewController.dismissBlock = ^{
        [self.tableView reloadData];
    };
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
//    navController.modalPresentationStyle = UIModalPresentationCurrentContext;
//    self.definesPresentationContext = YES;
//    navController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:navController animated:YES completion:nil];
}

//- (IBAction)toggleEditingMode:(id)sender
//{
//    if (self.isEditing) {
//        [sender setTitle:@"Edit" forState:UIControlStateNormal];
//        
//        [self setEditing:NO animated:YES];
//    } else {
//        [sender setTitle:@"Done" forState:UIControlStateNormal];
//        
//        [self setEditing:YES animated:YES];
//    }
//}

- (instancetype) init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Homepwner";
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        navItem.rightBarButtonItem = bbi;
        navItem.leftBarButtonItem = self.editButtonItem;
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

//- (BOOL) prefersStatusBarHidden
//{
//    return YES;
//}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
//    UIView *header = self.headerView;
//    [self.tableView setTableHeaderView:header];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    GJDetailViewController *detailViewController = [[GJDetailViewController alloc] init];
    GJDetailViewController *detailViewController = [[GJDetailViewController alloc] initForNewItem:NO];
    
    NSArray *items = [[GJItemStore sharedStore] allItems];
    GJItem *selectedItem = items[indexPath.row];
    detailViewController.item = selectedItem;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - dataSource方法
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[GJItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items = [[GJItemStore sharedStore] allItems];
    GJItem *item = items[indexPath.row];
    cell.textLabel.text = [item description];
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
    [[GJItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

@end
