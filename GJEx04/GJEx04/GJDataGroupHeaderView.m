//
//  GJDataGroupHeaderView.m
//  GJEx04
//
//  Created by 郭健 on 16/4/21.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJDataGroupHeaderView.h"
#import "GJDataGroup.h"
#import "UIImage+Extension.h"
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
        
        [nameView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [nameView setBackgroundColor:[UIColor whiteColor]];
        
        nameView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        nameView.image.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        nameView.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        nameView.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        
        //设置按钮缩放
        nameView.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        //给按钮注册事件
        [nameView addTarget:self action:@selector(nameClick) forControlEvents:UIControlEventTouchUpInside];
        
//        NSLog(@"%@", self.dataGroup.imageName);
//        [nameView setImage:[UIImage imageNamed:self.dataGroup.imageName] forState:UIControlStateNormal];
    }
    return self;
}
- (void) nameClick
{
    self.dataGroup.expand = !self.dataGroup.isExpand;
    
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickedNameBtn:)]) {
        [self.delegate headerViewDidClickedNameBtn:self];
    }
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.nameView.frame = self.bounds;
    
//    NSLog(@"%f",self.nameView.imageView.frame.size.width);
    
//    CGFloat countX = self.bounds.size.width - 10 - 150;
//    self.nameView.imageView.frame = CGRectMake(20, 0, 60, 60);
    
}

- (void) setDataGroup:(GJDataGroup *)dataGroup
{
    _dataGroup = dataGroup;

//    UIImage *image = [UIImage imageNamed:dataGroup.imageName];
//    CGRect *rect = CGRectMake(0, 0, 60, 60);
    [self.nameView setImage:[UIImage resizeImage:dataGroup.imageName toSize:CGSizeMake(60, 60)] forState:UIControlStateNormal];
//    self.nameView.imageView.transform = CGAffineTransformMakeScale(0.1, 0.1);
//    [self.nameView imageRectForContentRect:CGRectMake(0, 0, 60, 60)];
    [self.nameView setTitle:dataGroup.titileName forState:UIControlStateNormal];
}

@end
