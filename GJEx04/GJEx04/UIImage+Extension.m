//
//  UIImage+Extension.m
//  GJEx04
//
//  Created by 郭健 on 16/4/22.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (instancetype) resizeImage:(NSString *)imgName toSize:(CGSize)reSize
{
    UIImage *bgImage = [UIImage imageNamed:imgName];
    
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [bgImage drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}
@end
