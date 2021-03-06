//
//  GJItem.h
//  GJItem
//
//  Created by 郭健 on 16/1/10.
//  Copyright © 2016年 gj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GJItem : NSObject {
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

+ (instancetype) randomItem;

//指定初始化方法
- (instancetype) initWithItemName:(NSString *)name serialNumber:(NSString *) sNumber valueInDollars:(int) value;
- (instancetype) initWIthItemName:(NSString *)name;
- (instancetype) init;

- (void) setItemName:(NSString *) str;
- (NSString *) itemName;
- (void) setSerialNumber:(NSString *) str;
- (NSString *) serialNumber;
- (void) setValueInDollars:(int) v;
- (int) valueInDollars;
- (NSDate *) dateCreated;

@end
