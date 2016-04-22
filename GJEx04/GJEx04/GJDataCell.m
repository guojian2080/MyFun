//
//  GJDataCell.m
//  GJEx04
//
//  Created by 郭健 on 16/4/20.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJDataCell.h"
#import "GJData.h"
#import "UIImage+Extension.h"
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
    UIImage *image = [UIImage resizeImage:@"泡妞宝典" toSize:CGSizeMake(100, 100)];
//    self.imageView.image = [UIImage imageNamed:@"泡妞宝典"];
    [self.imageView setImage:image];
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    CGRect rect = CGRectMake(0, 0, imageW,imageH);
    self.imageView.frame = rect;
    self.imageView.contentMode = UIViewContentModeScaleToFill;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
