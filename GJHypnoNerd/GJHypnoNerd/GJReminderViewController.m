//
//  GJReminderViewController.m
//  GJHypnoNerd
//
//  Created by 郭健 on 16/5/6.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJReminderViewController.h"

@interface GJReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation GJReminderViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tabBarItem.title = @"Reminder";
        UIImage *i = [UIImage imageNamed:@"Time"];
        self.tabBarItem.image = i;
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"GJReminderViewController loaded its view.");
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

@end
