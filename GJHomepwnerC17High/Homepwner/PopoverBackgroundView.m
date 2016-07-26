//
//  PopoverBackgroundView.m
//  Homepwner
//
//  Created by 郭健 on 16/7/26.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "PopoverBackgroundView.h"

#define kArrowBase 30.0f
#define kArrowHeight 20.f
#define kBorderInset 0.0f
@interface PopoverBackgroundView ()
@property (nonatomic, strong) UIImageView *arrowImageView;
- (UIImage *)drawArrowImage:(CGSize) size;
@end

@implementation PopoverBackgroundView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@synthesize arrowDirection = _arrowDirection;
@synthesize arrowOffset = _arrowOffset;

+ (CGFloat) arrowBase
{
    return kArrowBase;
}

+ (CGFloat) arrowHeight
{
    return kArrowHeight;
}

+ (UIEdgeInsets) contentViewInsets
{
    return UIEdgeInsetsMake(kBorderInset, kBorderInset, kBorderInset, kBorderInset);
}

- (id) initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
        UIImageView *arrowImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.arrowImageView = arrowImageView;
        [self addSubview:self.arrowImageView];
    }
    return self;
}

+ (BOOL) wantsDefaultContentAppearance
{
    return NO;
}

- (UIImage *)drawArrowImage:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor clearColor] setFill];
    CGContextFillRect(ctx, CGRectMake(0.0f, 0.0f, size.width, size.height));
    CGMutablePathRef arrowPath = CGPathCreateMutable();
    CGPathMoveToPoint(arrowPath, NULL, (size.width/2.0f), 0.0f);
    CGPathAddLineToPoint(arrowPath, NULL, size.width, size.height);
    CGPathAddLineToPoint(arrowPath, NULL, 0.0f, size.height);
    CGPathCloseSubpath(arrowPath);
    CGContextAddPath(ctx, arrowPath);
    CGPathRelease(arrowPath);
    UIColor *fillColor = [UIColor yellowColor];
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);
    CGContextDrawPath(ctx, kCGPathFill);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGSize arrowSize = CGSizeMake([[self class] arrowBase], [[self class] arrowHeight]);
    self.arrowImageView.image = [self drawArrowImage:arrowSize];
    self.arrowImageView.frame = CGRectMake(((self.bounds.size.width - arrowSize.width) - kBorderInset), 0.0f, arrowSize.width, arrowSize.height);
}

@end
