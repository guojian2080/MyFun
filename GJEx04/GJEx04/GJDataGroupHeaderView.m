//
//  GJDataGroupHeaderView.m
//  GJEx04
//
//  Created by 郭健 on 16/4/21.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJDataGroupHeaderView.h"
#import "GJDataGroup.h"

@interface GJDataGroupHeaderView ()

@property (nonatomic, weak) UIButton *nameView;

@property (nonatomic, strong) NSArray *dataGroupList;

@end

@implementation GJDataGroupHeaderView

//1 创建自定义可重用headerView
+ (instancetype) headerViewWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"group";
    GJDataGroupHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseId];
    if (!headerView) {
        headerView = [[self alloc] initWithReuseIdentifier:reuseId];
    }
    return headerView;
}

//2 创建自定义控件 没有初始化frame
- (instancetype) initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *nameView = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        
        NSLog(@"%@", self.dataGroup.imageName);
        [nameView setImage:[UIImage imageNamed:self.dataGroup.imageName] forState:UIControlStateNormal];
    }
    return self;
}

- (void) setDataGroup:(GJDataGroup *)dataGroup
{
    _dataGroup = dataGroup;
    [self.nameView setTitle:dataGroup.titileName forState:UIControlStateNormal];
}

@end
