//
//  ViewController.m
//  GJTouchTracker
//
//  Created by 郭健 on 16/5/16.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJDrawViewController.h"
#import "GJDrawView.h"
@interface GJDrawViewController ()

@end

@implementation GJDrawViewController

- (void)loadView
{
    self.view = [[GJDrawView alloc] initWithFrame:CGRectZero];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
