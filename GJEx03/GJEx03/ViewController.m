//
//  ViewController.m
//  GJEx03
//
//  Created by 郭健 on 16/4/20.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, weak) UIPageControl *pageControl;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1、生成滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    CGFloat scrollW = 300;
    CGFloat scrollH = 130;
    CGFloat scrollX = 37;
    CGFloat scrollY = 20;
    scrollView.frame = CGRectMake(scrollX, scrollY, scrollW, scrollH);
    
    //2、添加imageView
    CGSize size = scrollView.frame.size;
    int count = 5;
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [scrollView addSubview:imageView];
        
        NSString *imageName = [NSString stringWithFormat:@"img_%02d",i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        
        CGFloat x = i * size.width;
        imageView.frame = CGRectMake(x, 0, size.width, size.height);
    }
    
    //3、设置滚动范围
    scrollView.contentSize = CGSizeMake(count * size.width, size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //4、设置分页
    scrollView.pagingEnabled = YES;
    
    //5、设置滚动器
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
    CGFloat pageW = 35;
    CGFloat pageH = 20;
    CGFloat pageX = 170;
    CGFloat pageY = 120;
    self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    self.pageControl.numberOfPages = count;
    [self.pageControl setPageIndicatorTintColor:[UIColor blueColor]];
    [self.pageControl setCurrentPageIndicatorTintColor:[UIColor redColor]];
    
    //5、设置 scrollView 代理
    scrollView.delegate = self;
    
    //6、添加定时器
    [self addTimerObj];
    
    
}

- (void) addTimerObj
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    self.timer = timer;
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)nextImage
{
    NSInteger page = self.pageControl.currentPage;
    if (page == self.pageControl.numberOfPages - 1) {
        page = 0;
    } else {
        page++;
    }
    
    CGFloat offsetX = self.scrollView.frame.size.width * page;
    [UIView animateWithDuration:1.0 animations:^{
        self.scrollView.contentOffset = CGPointMake(offsetX, 0);
    }];
}

#pragma mark - scrollView的代理方法
- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (scrollView.contentOffset.x + scrollView.frame.size.width / 2) / scrollView.frame.size.width;
    self.pageControl.currentPage = page;
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimerObj];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
