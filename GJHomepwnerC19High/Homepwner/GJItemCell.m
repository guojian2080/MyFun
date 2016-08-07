//
//  GJItemCell.m
//  Homepwner
//
//  Created by 郭健 on 16/8/7.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJItemCell.h"

@implementation GJItemCell
- (IBAction)showImage:(UIButton *)sender {
    if (self.actionBlock) {
        self.actionBlock();
    }
}

@end
