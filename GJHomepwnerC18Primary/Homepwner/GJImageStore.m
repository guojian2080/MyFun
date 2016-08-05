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
-(NSString *) imagePathForKey:(NSString *) key;
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
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(clearCache:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

- (void) clearCache:(NSNotification *)note
{
    NSLog(@"flushing %lu images out of the cache", (unsigned long)[self.dictionary count]);
    [self.dictionary removeAllObjects];
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
//    [self.dictionary setObject:image forKey:key];
    self.dictionary[key] = image;
    
    NSString *imagePath = [self imagePathForKey:key];
    
//    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    NSData *data = UIImagePNGRepresentation(image);
    
    [data writeToFile:imagePath atomically:YES];
}

- (UIImage *)imageForKey:(NSString *)key
{
//    return [self.dictionary objectForKey:key];
//    return self.dictionary[key];
    UIImage *result = self.dictionary[key];
    if (!result) {
        NSString *imagePath = [self imagePathForKey:key];
        
        result = [UIImage imageWithContentsOfFile:imagePath];
        
        if (result) {
            self.dictionary[key] = result;
        } else {
            NSLog(@"Error: Unable to find %@", [self imagePathForKey:key]);
        }
    }
    return result;
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
    
    NSString *imagePath = [self imagePathForKey:key];
    [[NSFileManager defaultManager] removeItemAtPath:imagePath error:nil];
}

-(NSString *) imagePathForKey:(NSString *) key
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:key];
}

@end
