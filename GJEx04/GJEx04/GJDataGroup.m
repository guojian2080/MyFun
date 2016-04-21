//
//  GJDataGroup.m
//  GJEx04
//
//  Created by 郭健 on 16/4/21.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJDataGroup.h"

@implementation GJDataGroup

- (instancetype) initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype) dataGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *) dataGroupList
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    
    //字典转模型
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dict in dictArray) {
        GJDataGroup *data = [GJDataGroup dataGroupWithDict:dict];
        [tmpArray addObject:data];
    }
    
    return tmpArray;
}

@end
