//
//  GJQuizViewController.m
//  GJQuiz
//
//  Created by 郭健 on 16/1/7.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJQuizViewController.h"

@interface GJQuizViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

@implementation GJQuizViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.questions = @[@"From what is cognac made?",
                                    @"What is 7 + 7?",
                           @"What is the capital of Vermont?"];
        self.answers = @[@"Grapes",
                                    @"14",
                         @"Montpelier"];
    }
    
    return self;
}

- (IBAction)showQuestion:(id)sender {
    self.currentQuestionIndex++;
    
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    
    if (self.questionLabel.text != NULL) {
        [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            CGRect frame = CGRectMake(320, 31, 304, 21);
            self.questionLabel.frame = frame;
        } completion:^(BOOL finished){
            [self questionFadein];
        }];
    }else{
        [self questionFadein];
    }
    
//    self.answerLabel.text = @"???";
    
}

- (IBAction)showAnswer:(id)sender {    
    if (self.answerLabel.text != NULL) {
        [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            CGRect frame = CGRectMake(320, 332, 304, 21);
            self.answerLabel.frame = frame;
        } completion:^(BOOL finished){
            [self answerFadein];
        }];
    }else{
        [self answerFadein];
    }
}

- (void) questionFadein{
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    
    CGRect questionRect = CGRectMake(-304, 31, 304, 21);
    self.questionLabel.frame = questionRect;
    
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect frame = CGRectMake(8, 31, 304, 21);
        self.questionLabel.frame = frame;
    } completion:NULL];
}

- (void) answerFadein{
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    self.answerLabel.text = answer;
    
    CGRect answerRect = CGRectMake(-304, 332, 304, 21);
    self.answerLabel.frame = answerRect;
    
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect frame = CGRectMake(8, 332, 304, 21);
        self.answerLabel.frame = frame;
    } completion:NULL];
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/

@end
