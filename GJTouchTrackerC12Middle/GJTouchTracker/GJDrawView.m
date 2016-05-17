//
//  GJDrawView.m
//  GJTouchTracker
//
//  Created by 郭健 on 16/5/16.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJDrawView.h"
#import "GJLine.h"
@interface GJDrawView ()
//@property (nonatomic, strong) GJLine *currentLine;
@property (nonatomic, strong) NSMutableDictionary *linesInProcess;
@property (nonatomic, strong) NSMutableArray *finishedLines;
@end

@implementation GJDrawView

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.linesInProcess = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
        self.multipleTouchEnabled = YES;
    }
    return self;
}

- (void) strokeLine:(GJLine *)line
{
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor blackColor] set];
    for (GJLine *line in self.finishedLines) {
        CGFloat height = line.end.y - line.begin.y;
        CGFloat width = line.end.x - line.begin.x;
        CGFloat rads = atanf(height / width) * 180 / M_PI;
        if (rads > 0 && rads <= 45) {
            [[UIColor redColor] set];
        }else if (rads > 45 && rads <= 90){
            [[UIColor yellowColor] set];
        }else if (rads > -45 && rads < 0){
            [[UIColor blueColor] set];
        }else{
            [[UIColor greenColor] set];
        }
        
        [self strokeLine:line];
    }
//    if (self.currentLine) {
//        [[UIColor redColor] set];
//        [self strokeLine:self.currentLine];
//    }
    [[UIColor redColor] set];
    for (NSValue *key in self.linesInProcess) {
        [self strokeLine:self.linesInProcess[key]];
    }
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *t = [touches anyObject];
//    CGPoint location = [t locationInView:self];
//    self.currentLine = [[GJLine alloc] init];
//    self.currentLine.begin = location;
//    self.currentLine.end = location;
    
    for (UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        GJLine *line = [[GJLine alloc] init];
        line.begin = location;
        line.end = location;
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        self.linesInProcess[key] = line;
    }
    
    [self setNeedsDisplay];
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    UITouch *t = [touches anyObject];
//    CGPoint location = [t locationInView:self];
//    self.currentLine.end = location;
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        GJLine *line = self.linesInProcess[key];
        line.end = [t locationInView:self];
    }
    
    [self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self.finishedLines addObject:self.currentLine];
//    self.currentLine = nil;
    
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        GJLine *line = self.linesInProcess[key];
        
        [self.finishedLines addObject:line];
        [self.linesInProcess removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for (UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        
        GJLine *line = self.linesInProcess[key];
        [self.finishedLines addObject:line];
        
        [self.linesInProcess removeObjectForKey:key];
        
    }
    
    [self setNeedsDisplay];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
