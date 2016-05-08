//
//  GJHypnosisViewController.m
//  GJHypnoNerd
//
//  Created by 郭健 on 16/5/6.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJHypnosisViewController.h"
#import "GJHypnosisView.h"
@implementation GJHypnosisViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tabBarItem.title = @"Hypnotize";
        UIImage *i = [UIImage imageNamed:@"Hypno"];
        self.tabBarItem.image = i;
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"GJHypnosisViewController loaded its view.");
}

- (void) loadView
{
    GJHypnosisView *backgroundView = [[GJHypnosisView alloc] init];
    self.view = backgroundView;
}

@end
