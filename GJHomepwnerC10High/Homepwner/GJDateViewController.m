//
//  GJDateViewController.m
//  Homepwner
//
//  Created by 郭健 on 16/5/15.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJDateViewController.h"
#import "GJItem.h"
@interface GJDateViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *dateCreated;

@end

@implementation GJDateViewController
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    GJItem *item = self.item;
    self.dateCreated.date = item.dateCreated;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    GJItem *item = self.item;
    [item setDate:self.dateCreated.date];
}

@end
