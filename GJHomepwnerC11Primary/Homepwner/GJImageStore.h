//
//  GJImageStore.h
//  Homepwner
//
//  Created by 郭健 on 16/5/15.
//  Copyright © 2016年 gj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GJImageStore : NSObject

+ (instancetype) sharedStore;

- (void)setImage:(UIImage *)image forKey:(NSString *) key;
- (UIImage *)imageForKey:(NSString *) key;
- (void)deleteImageForKey:(NSString *) key;

@end
