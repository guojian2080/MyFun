//
//  GJAssetTypeViewController.h
//  Homepwner
//
//  Created by 郭健 on 16/8/21.
//  Copyright © 2016年 gj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GJItem;

@protocol PassingValueDelegate <NSObject>

@optional
- (void) passingValue:(NSString *) value;
@end

@interface GJAssetTypeViewController : UITableViewController
@property (nonatomic, strong) GJItem *item;
@property (nonatomic, retain) id<PassingValueDelegate> delegate;
@end
