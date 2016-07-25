//
//  GJImageStore.m
//  Homepwner
//
//  Created by 郭健 on 16/5/15.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJImageStore.h"

@interface GJImageStore ()
@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation GJImageStore
+ (instancetype) sharedStore
{
    static GJImageStore *sharedStore = nil;
    
//    if (!sharedStore) {
//        sharedStore = [[self alloc] initPrivate];
//    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    
    return sharedStore;
}

- (instancetype) init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [GJImageStore sharedStore]" userInfo:nil];
    return nil;
}

- (instancetype) initPrivate
{
    self = [super init];
    if (self) {
        _dictionary = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
//    [self.dictionary setObject:image forKey:key];
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key
{
//    return [self.dictionary objectForKey:key];
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
