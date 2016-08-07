//
//  UIImageViewController.m
//  Homepwner
//
//  Created by 郭健 on 16/8/7.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJImageViewController.h"

@interface GJImageViewController ()<UIGestureRecognizerDelegate>

@end

@implementation GJImageViewController

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIImageView *imageView = (UIImageView *)self.view;
    imageView.image = self.image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadView{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeCenter;
    
    imageView.multipleTouchEnabled = YES;
    imageView.userInteractionEnabled = YES;
    
    [self addGestureRecognizerToView:imageView];
    
    self.view = imageView;
    
    
}

- (void) addGestureRecognizerToView:(UIView *) view{
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    [view addGestureRecognizer:pinchGestureRecognizer];
}

- (void) pinchView:(UIPinchGestureRecognizer *) pinchGestrureRecognizer{
    UIView *view = pinchGestrureRecognizer.view;
    if (pinchGestrureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestrureRecognizer.state == UIGestureRecognizerStateChanged) {
//        NSLog(@"%f",pinchGestrureRecognizer.scale);
        view.transform = CGAffineTransformScale(view.transform, pinchGestrureRecognizer.scale, pinchGestrureRecognizer.scale);
        pinchGestrureRecognizer.scale = 1;
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
