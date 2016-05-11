//
//  GJItemStore.m
//  Homepwner
//
//  Created by 郭健 on 16/5/11.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJItemStore.h"
#import "GJItem.h"
@interface GJItemStore()
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation GJItemStore

+ (instancetype) sharedStore {
    static GJItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype) init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [GJItemStore sharedStore]" userInfo:nil];
}

- (instancetype) initPrivate {
    if(self = [super init]){
        _privateItems = [[NSMutableArray alloc]init];
    }
    return self;
}

- (NSArray *)allItems {
    return self.privateItems;
}

- (GJItem *) createItem {
    GJItem *item = [GJItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

@end
