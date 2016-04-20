//
//  GJDataCell.m
//  GJEx04
//
//  Created by 郭健 on 16/4/20.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJDataCell.h"
#import "GJData.h"
@implementation GJDataCell

+ (instancetype) dataCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"data";
    GJDataCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    return cell;
}

- (void) setData:(GJData *)data
{
    _data = data;
    self.textLabel.text = @"itcast";
    self.imageView.image = [UIImage imageNamed:@"泡妞宝典"];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
