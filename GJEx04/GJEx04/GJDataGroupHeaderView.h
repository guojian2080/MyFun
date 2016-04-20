//
//  GJDataGroupHeaderView.h
//  GJEx04
//
//  Created by 郭健 on 16/4/21.
//  Copyright © 2016年 gj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GJDataGroup;
@interface GJDataGroupHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) GJDataGroup *dataGroup;

+ (instancetype) headerViewWithTableView:(UITableView *)tableView;

@end
