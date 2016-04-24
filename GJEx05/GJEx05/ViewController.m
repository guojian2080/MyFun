//
//  ViewController.m
//  GJEx05
//
//  Created by 郭健 on 16/4/23.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *sunView;
@property (weak, nonatomic) IBOutlet UIImageView *wordView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.imageView.frame = CGRectMake(0, 0, 2832, 667);
    
    //滚动视图范围
    self.scrollView.contentSize = CGSizeMake(2832, 667);
    
    //设置没有回弹效果
    self.scrollView.bounces = NO;
    
    //设置图片的位置
//    self.imageView.frame = CGRectMake(0, 419, 200, 200);
    
    //滚动与边缘间距
//    self.scrollView.contentInset = UIEdgeInsetsMake(0, -50, 0, -50);
    
    self.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - scrollView 的代理方法

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"gun");
    CGFloat imageX = scrollView.contentOffset.x;
    CGFloat imageY = self.imageView.frame.origin.y;;
    CGFloat imageW = self.imageView.frame.size.width;
    CGFloat imageH = self.imageView.frame.size.height;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat sunX = 255 + imageX;
    CGFloat sunY = self.sunView.frame.origin.y;
    CGFloat sunW = self.sunView.frame.size.width;
    CGFloat sunH = self.sunView.frame.size.height;
    self.sunView.frame = CGRectMake(sunX , sunY, sunW, sunH);
    
    self.wordView.frame = CGRectMake(27 + imageX, 155, 320, 125);
    
    self.wordView.alpha = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    int step = imageX / 80;
    
    if (step % 2) {
        [self.imageView setImage:[UIImage imageNamed:@"520_userguid_person_taitou_2"]];
    }else{
        [self.imageView setImage:[UIImage imageNamed:@"520_userguid_person_taitou_1"]];
    }
//    self.sunView.transform = CGAffineTransformMakeRotation(M_PI_4);
    UIImage *sunImage = [UIImage imageNamed:@"520_userguid_sun"];
    [self.sunView setImage:[UIImage imageWithCGImage:sunImage.CGImage scale:1 orientation:UIImageOrientationRight]];
    
//    NSLog(@"%@",NSStringFromCGRect(self.sunView.frame));
    
    
}


@end
