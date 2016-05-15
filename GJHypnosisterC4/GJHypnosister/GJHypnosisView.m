//
//  GJHypnosisView.m
//  GJHypnosister
//
//  Created by 郭健 on 16/5/4.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJHypnosisView.h"
@interface GJHypnosisView ()

@property (nonatomic, strong) UIColor *circleColor;

@end

@implementation GJHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void) setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;

    float maxRadius = hypot(bounds.size.width, bounds.size.height);
//
//    UIBezierPath *path = [[UIBezierPath alloc] init];
//    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
//        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
//        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
//    }
//    
//    path.lineWidth = 10;
//    [self.circleColor setStroke];
//    [path stroke];
    
//    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    CGContextSetRGBStrokeColor(currentContext, 1, 0, 0, 1);
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, center.x + maxRadius, center.y);
//    CGPathAddLineToPoint(path, NULL, center.x + maxRadius, center.y);
//    CGContextAddPath(currentContext, path);
//    
//    CGContextStrokePath(currentContext);
//    CGPathRelease(path);
    
//    CGContextSetStrokeColorWithColor(currentContext, );
    
    
    UIImage *logoImage = [UIImage imageNamed:@"logo"];
    [logoImage drawInRect:bounds];
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"%@ was touched", self);
    
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
}
@end
