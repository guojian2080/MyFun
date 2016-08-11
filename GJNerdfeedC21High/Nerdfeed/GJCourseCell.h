//
//  GJCoursesTableViewCell.h
//  Nerdfeed
//
//  Created by 郭健 on 16/8/11.
//  Copyright © 2016年 gj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GJCourseCell : UITableViewCell

@property (nonatomic, strong) NSDictionary *course;

+ (instancetype)courseCellWithTableView:(UITableView *)tableView;

@end
