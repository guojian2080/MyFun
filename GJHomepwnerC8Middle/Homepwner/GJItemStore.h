//
//  GJItemStore.h
//  Homepwner
//
//  Created by 郭健 on 16/5/11.
//  Copyright © 2016年 gj. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GJItem;
@interface GJItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype) sharedStore;
- (GJItem *) createItem;

@end
