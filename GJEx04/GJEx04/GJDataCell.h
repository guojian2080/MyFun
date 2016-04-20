//
//  GJDataCell.h
//  GJEx04
//
//  Created by 郭健 on 16/4/20.
//  Copyright © 2016年 gj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GJData;
@interface GJDataCell : UITableViewCell

@property (nonatomic, strong) GJData *data;

+ (instancetype) dataCellWithTableView:(UITableView *) tableView;

@end
