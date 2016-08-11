//
//  GJWebViewController.m
//  Nerdfeed
//
//  Created by 郭健 on 16/8/10.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJWebViewController.h"

@interface GJWebViewController ()

@end

@implementation GJWebViewController

- (void) loadView{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
//    NSLog(@"%@", webView.canGoBack);
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRedo target:webView action:@selector(goBack)];
    
    UIBarButtonItem *forward = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:webView action:@selector(goForward)];
    
    NSArray *barButtons = @[back,forward];
    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 800, 1000, 100)];
    bar.items = barButtons;
    
//    back.enabled = !webView.canGoBack;
//    forward.enabled = !webView.canGoForward;

    self.view = webView;
    [self.view addSubview:bar];
}

- (void) setURL:(NSURL *)URL{
    _URL = URL;
    if (_URL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
