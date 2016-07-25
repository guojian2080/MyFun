//
//  GJItemStore.m
//  Homepwner
//
//  Created by 郭健 on 16/5/11.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJItemStore.h"
#import "GJItem.h"
#import "GJImageStore.h"
@interface GJItemStore()
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation GJItemStore

+ (instancetype) sharedStore {
    static GJItemStore *sharedStore = nil;
    
//    if (!sharedStore) {
//        sharedStore = [[self alloc] initPrivate];
//    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    
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

- (void)removeItem:(GJItem *)item
{
    NSString *key = item.itemKey;
    [[GJImageStore sharedStore] deleteImageForKey:key];
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    GJItem *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    [self.privateItems insertObject:item atIndex:toIndex];
}

@end
