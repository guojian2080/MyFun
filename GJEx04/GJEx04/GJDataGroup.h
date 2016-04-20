//
//  GJDataGroup.h
//  GJEx04
//
//  Created by 郭健 on 16/4/21.
//  Copyright © 2016年 gj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GJDataGroup : NSObject

@property (nonatomic, copy) NSString *titileName;
@property (nonatomic, copy) NSString *imageName;

- (instancetype) initWithDict:(NSDictionary *)dict;
+ (instancetype) dataGroupWithDict:(NSDictionary *)dict;

+ (NSArray *) dataGroupList;

@end
