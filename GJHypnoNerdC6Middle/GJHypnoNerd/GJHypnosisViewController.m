//
//  GJHypnosisViewController.m
//  GJHypnoNerd
//
//  Created by 郭健 on 16/5/6.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJHypnosisViewController.h"
#import "GJHypnosisView.h"

@interface GJHypnosisViewController()
@property (nonatomic, strong) GJHypnosisView *bgView;
@end

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
    
    NSArray *segItems = @[@"Red",@"Green",@"Blue"];
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:segItems];
    segment.frame = CGRectMake(20, 20, 250, 50);
    [segment addTarget:self action:@selector(setBackgroundCircleColor:) forControlEvents:UIControlEventValueChanged];
    [backgroundView addSubview:segment];
    
    self.bgView = backgroundView;
    self.view = backgroundView;
}

- (void) setBackgroundCircleColor:(UISegmentedControl *)seg
{
    int index = seg.selectedSegmentIndex;
    if (index == 0) {
        self.bgView.circleColor = [UIColor redColor];
    } else if (index == 1){
        self.bgView.circleColor = [UIColor greenColor];
    } else if (index == 2){
        self.bgView.circleColor = [UIColor blueColor];
    }
}

@end
