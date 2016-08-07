//
//  GJItem.h
//  GJItem
//
//  Created by 郭健 on 16/1/10.
//  Copyright © 2016年 gj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GJItem : NSObject <NSCoding>{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}
@property (nonatomic, copy) NSString *itemKey;
@property (nonatomic, strong) UIImage *thumbnail;

+ (instancetype) randomItem;

//指定初始化方法
- (instancetype) initWithItemName:(NSString *)name serialNumber:(NSString *) sNumber valueInDollars:(int) value;
- (instancetype) initWithItemName:(NSString *)name;
- (instancetype) init;

- (void) setItemName:(NSString *) str;
- (NSString *) itemName;
- (void) setSerialNumber:(NSString *) str;
- (NSString *) serialNumber;
- (void) setValueInDollars:(int) v;
- (int) valueInDollars;
- (NSDate *) dateCreated;

- (void) setThumbnailFromImage:(UIImage *)image;

@end
