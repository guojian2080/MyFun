//
//  GJImageTransformer.m
//  Homepwner
//
//  Created by 郭健 on 16/8/16.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJImageTransformer.h"

@implementation GJImageTransformer

+ (Class) transformedValueClass{
    return [NSData class];
}

- (id) transformedValue:(id)value{
    if (!value) {
        return nil;
    }
    if ([value isKindOfClass:[NSData class]]) {
        return value;
    }
    return UIImagePNGRepresentation(value);
}

- (id) reverseTransformedValue:(id)value{
    return [UIImage imageWithData:value];
}

@end
