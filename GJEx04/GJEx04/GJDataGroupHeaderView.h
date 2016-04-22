//
//  GJDataGroupHeaderView.h
//  GJEx04
//
//  Created by 郭健 on 16/4/21.
//  Copyright © 2016年 gj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GJDataGroup,GJDataGroupHeaderView;
@protocol GJDataGroupHeaderViewDelegate <NSObject>

@optional
//1、定义代理协议
- (void) headerViewDidClickedNameBtn:(GJDataGroupHeaderView *)headerView;

@end

@interface GJDataGroupHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) GJDataGroup *dataGroup;
//2、定义代理属性
@property (nonatomic, weak) id <GJDataGroupHeaderViewDelegate> delegate;

+ (instancetype) headerViewWithTableView:(UITableView *)tableView;

@end
