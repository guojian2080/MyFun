//
//  GJData.m
//  GJEx04
//
//  Created by 郭健 on 16/4/20.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJData.h"

@implementation GJData

- (instancetype) initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype) dataWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *) dataList
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    
//    NSLog(@"dataList:%ld",dictArray.count);
    
    //字典转模型
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dict in dictArray) {
        GJData *data = [GJData dataWithDict:dict];
        [tmpArray addObject:data];
    }
    
    return tmpArray;
}

@end
