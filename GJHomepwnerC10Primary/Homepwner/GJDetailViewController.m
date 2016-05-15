//
//  GJDetailViewController.m
//  Homepwner
//
//  Created by 郭健 on 16/5/14.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJDetailViewController.h"
#import "GJItem.h"
@interface GJDetailViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation GJDetailViewController

- (void) setItem:(GJItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    GJItem *item = self.item;
    
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d",item.valueInDollars];
    self.valueField.tag = 3;
    
    static NSDateFormatter *dateFormatter = nil;
    if(!dateFormatter){
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    GJItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
}

#pragma mark - textField 代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag == 3) {
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    
}

@end
