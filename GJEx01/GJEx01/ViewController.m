//
//  ViewController.m
//  GJEx01
//
//  Created by 郭健 on 16/4/15.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *smallButton;
@property (weak, nonatomic) IBOutlet UIButton *middleButton;
@property (weak, nonatomic) IBOutlet UIButton *bigButton;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UISlider *fontValue;

- (IBAction)fontSlider:(UISlider *)sender;
- (IBAction)buttonView:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.fontValue setThumbImage:[UIImage imageNamed:@"正文字号-滑块"] forState:UIControlStateNormal];
    [self.fontValue setMaximumTrackImage:[UIImage imageNamed:@"正文字号-滑条"] forState:UIControlStateNormal];
    [self.fontValue setMinimumTrackImage:[UIImage imageNamed:@"正文字号-滑条红"] forState:UIControlStateNormal];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fontSlider:(UISlider *)sender {
//    int senderValue = [NSNumber r]
    int senderValue = round(sender.value);
    CGFloat fontSize = (1 + senderValue) * 10;
    self.textLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [self buttonShow:senderValue];
}

- (void) buttonShow:(NSInteger) senderValue
{
    NSArray *nameArray = @[@"正文字号-小", @"正文字号-中", @"正文字号-大", @"正文字号-大+"];
    NSArray *defaultNameArray = @[@"正文字号-小（默认）", @"正文字号-中（默认）", @"正文字号-大（默认）", @"正文字号-大+（默认）"];
    
    for (NSInteger i = 1; i <= 4; i++) {
        UIButton *btn = [self.view viewWithTag:i];
        if (senderValue == (CGFloat)i) {
            [btn setImage:[UIImage imageNamed:nameArray[senderValue - 1]] forState:UIControlStateNormal];
        }else{
            [btn setImage:[UIImage imageNamed:defaultNameArray[btn.tag - 1]] forState:UIControlStateNormal];
        }
    }
}

- (IBAction)buttonView:(UIButton *)sender {
    NSInteger fontSize = (1 + sender.tag) * 10;
    
    self.textLabel.font = [UIFont systemFontOfSize:fontSize];
    self.fontValue.value = sender.tag;
    [self buttonShow:sender.tag];
    
}
@end
