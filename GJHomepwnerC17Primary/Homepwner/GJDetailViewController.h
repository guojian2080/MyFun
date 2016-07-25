//
//  GJDetailViewController.h
//  Homepwner
//
//  Created by 郭健 on 16/5/14.
//  Copyright © 2016年 gj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GJItem;
@interface GJDetailViewController : UIViewController
- (instancetype) initForNewItem:(BOOL) isNew;
@property (nonatomic, copy) void (^dismissBlock)(void);
@property (nonatomic, strong) GJItem *item;
@end
