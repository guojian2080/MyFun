//
//  GJItem.m
//  GJItem
//
//  Created by 郭健 on 16/1/10.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJItem.h"

@implementation GJItem

+ (instancetype) randomItem {
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
//    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
//                                                [randomAdjectiveList objectAtIndex:adjectiveIndex],
//                            [randomNounList objectAtIndex:nounIndex]];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex], randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                                            '0' + arc4random() % 10,
                                                            'A' + arc4random() % 26,
                                                            '0' + arc4random() % 10,
                                                            'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    GJItem *newItem = [[self alloc] initWithItemName:randomName serialNumber:randomSerialNumber valueInDollars:randomValue];
    
    return newItem;
}

- (instancetype) initWithItemName:(NSString *)name serialNumber:(NSString *) sNumber valueInDollars:(int) value {
    self = [super init];
    if (self) {
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        _dateCreated = [[NSDate alloc] init];
        
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = [uuid UUIDString];
        _itemKey = key;
    }
    
    return self;
}

- (instancetype) initWithItemName:(NSString *)name {
    return [self initWithItemName:name serialNumber:@"" valueInDollars:0];
}

- (instancetype) init {
    return [self initWithItemName:@"Item"];
}

- (void) setItemName:(NSString *) str {
    _itemName = str;
}

- (NSString *) itemName {
    return _itemName;
}

- (void) setSerialNumber:(NSString *) str {
    _serialNumber = str;
}

- (NSString *) serialNumber {
    return _serialNumber;
}

- (void) setValueInDollars:(int) v {
    _valueInDollars = v;
}

- (int) valueInDollars {
    return _valueInDollars;
}

- (NSDate *) dateCreated {
    return _dateCreated;
}

- (NSString *) description {
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                                    self.itemName,
                                                    self.serialNumber,
                                                    self.valueInDollars,
                                   self.dateCreated];
    return descriptionString;
}

- (void)setThumbnailFromImage:(UIImage *)image{
    CGSize origImageSize = image.size;
    CGRect newRect = CGRectMake(0, 0, 40, 40);
    float ratio = MAX(newRect.size.width / origImageSize.width, newRect.size.height / origImageSize.height);
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, 0.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:newRect cornerRadius:5.0];
    [path addClip];
    CGRect projectRect;
    projectRect.size.width = ratio * origImageSize.width;
    projectRect.size.height = ratio * origImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height) / 2.0;
    [image drawInRect:projectRect];
    
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    self.thumbnail = smallImage;
    UIGraphicsEndImageContext();
}

#pragma mark - NSCoding protocol method
- (void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.itemName forKey:@"itemName"];
    [aCoder encodeObject:self.serialNumber forKey:@"serialNumber"];
    [aCoder encodeObject:self.dateCreated forKey:@"dateCreated"];
    [aCoder encodeObject:self.itemKey forKey:@"itemKey"];
    [aCoder encodeInt:self.valueInDollars forKey:@"valueInDollars"];
    [aCoder encodeObject:self.thumbnail forKey:@"thumbnail"];
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _itemName = [aDecoder decodeObjectForKey:@"itemName"];
        _serialNumber = [aDecoder decodeObjectForKey:@"serialNumber"];
        _dateCreated = [aDecoder decodeObjectForKey:@"dateCreated"];
        _itemKey = [aDecoder decodeObjectForKey:@"itemKey"];
        _valueInDollars = [aDecoder decodeIntForKey:@"valueInDollars"];
        _thumbnail = [aDecoder decodeObjectForKey:@"thumbnail"];
    }
    return self;
}

@end
