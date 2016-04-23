//
//  ViewController.m
//  GJEx05
//
//  Created by 郭健 on 16/4/23.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
//@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.imageView.frame = CGRectMake(0, 0, 2832, 667);
    
    //滚动视图范围
    self.scrollView.contentSize = CGSizeMake(2832, 667);
    
    //滚动与边缘间距
//    self.scrollView.contentInset = UIEdgeInsetsMake(0, -50, 0, -50);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
