//
//  GJDetailViewController.m
//  Homepwner
//
//  Created by 郭健 on 16/5/14.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJDetailViewController.h"
#import "GJItem.h"
#import "GJImageStore.h"
@interface GJDetailViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
- (IBAction)backgroundTapped:(id)sender;
- (IBAction)takePicture:(id)sender;
@end

@implementation GJDetailViewController
- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)takePicture:(id)sender {
//    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
//    
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
//    } else {
//        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    }
//    
//    imagePicker.delegate = self;
//    
//    [self presentViewController:imagePicker animated:YES completion:nil];
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    NSArray *availableTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    ipc.mediaTypes = availableTypes;
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate = self;
}

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
    
    static NSDateFormatter *dateFormatter = nil;
    if(!dateFormatter){
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
    
    NSString *itemKey = self.item.itemKey;
    UIImage *imageToDisplay = [[GJImageStore sharedStore] imageForKey:itemKey];
    self.imageView.image = imageToDisplay;
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

#pragma make - textField delegate方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - imagePicker delegate方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
//    UIImage *image = info[UIImagePickerControllerOriginalImage];
//    
//    [[GJImageStore sharedStore] setImage:image forKey:self.item.itemKey];
//    
//    self.imageView.image = image;
    NSURL *mediaURL = info[UIImagePickerControllerMediaURL];
    if (mediaURL) {
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum([mediaURL path])) {
            UISaveVideoAtPathToSavedPhotosAlbum([mediaURL path], nil, nil, nil);
            
            [[NSFileManager defaultManager] removeItemAtPath:[mediaURL path] error:nil];
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
