//
//  GJCoursesTableViewCell.m
//  Nerdfeed
//
//  Created by 郭健 on 16/8/11.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJCourseCell.h"

@implementation GJCourseCell

- (void)setCourse:(NSDictionary *)course{
    _course = course;
    self.textLabel.text = course[@"title"];
    NSArray *upcomings = [NSArray arrayWithArray:course[@"upcoming"]];
    NSDictionary *upcoming = [upcomings firstObject];
    self.detailTextLabel.text = [NSString stringWithFormat:@"%@,%@,%@",upcoming[@"start_date"],upcoming[@"instructors"],upcoming[@"location"]];
}

+ (instancetype)courseCellWithTableView:(UITableView *)tableView{
    static NSString *reuseId = @"course";
    GJCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
