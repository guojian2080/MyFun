//
//  GJData.h
//  GJEx04
//
//  Created by 郭健 on 16/4/20.
//  Copyright © 2016年 gj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GJData : NSObject

@property (nonatomic, copy) NSString *titileName;
@property (nonatomic, copy) NSString *imageName;

- (instancetype) initWithDict:(NSDictionary *)dict;
+ (instancetype) dataWithDict:(NSDictionary *)dict;

+ (NSArray *) dataList;

@end
