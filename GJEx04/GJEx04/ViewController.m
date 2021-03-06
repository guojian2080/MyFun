//
//  ViewController.m
//  GJEx04
//
//  Created by 郭健 on 16/4/20.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "ViewController.h"
#import "GJData.h"
#import "GJDataCell.h"
#import "GJDataGroup.h"
#import "GJDataGroupHeaderView.h"
@interface ViewController () <GJDataGroupHeaderViewDelegate>

@property (nonatomic, strong) NSArray *dataGroupList;
@end

@implementation ViewController

//1、懒加载
- (NSArray *)dataGroupList
{
    if (!_dataGroupList) {
        _dataGroupList = [GJDataGroup dataGroupList];
    }
    return _dataGroupList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //2、测试数据
//    NSLog(@"datatest:%ld", self.datasList.count);
    
    //3、设置组头高度
    self.tableView.sectionHeaderHeight = 60;
    
    //4、设置行高
//    self.tableView.rowHeight = 60;
}

#pragma mark - 数据源方法
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataGroupList.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    GJDataGroup *dataGroup = self.dataGroupList[section];
    return dataGroup.isExpand ? 1 : 0;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1、创建cell
    GJDataCell *cell = [GJDataCell dataCellWithTableView:tableView];
    
    //2、给cell赋值
    cell.data = self.dataGroupList[indexPath.row];
    
    //3、返回cell
    return cell;
}

#pragma mark - tableView代理方法
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    GJDataGroupHeaderView *headerView = [GJDataGroupHeaderView headerViewWithTableView:tableView];
    
    GJDataGroup *dataGroup = self.dataGroupList[section];

    headerView.delegate = self;
    
    headerView.dataGroup = dataGroup;

    headerView.tag = section;
    
    return headerView;
    
}

#pragma mark - headerView代理方法
- (void)headerViewDidClickedNameBtn:(GJDataGroupHeaderView *)headerView
{
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headerView.tag];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
