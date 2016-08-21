//
//  GJDetailViewController.m
//  Homepwner
//
//  Created by 郭健 on 16/5/14.
//  Copyright © 2016年 gj. All rights reserved.
//

#import "GJDetailViewController.h"
#import "GJItem.h"
//#import "GJItem+CoreDataProperties.h"
#import "GJImageStore.h"
#import "GJItemStore.h"
#import "GJAssetTypeViewController.h"
@interface GJDetailViewController () <UINavigationControllerDelegate, UIPickerViewDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UIPopoverControllerDelegate, PassingValueDelegate>
@property (strong, nonatomic) UIPopoverController *imagePickerPopover;
@property (strong, nonatomic) UIPopoverController *assetPickerPopover;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
- (IBAction)backgroundTapped:(id)sender;
- (IBAction)takePicture:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cameraButton;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *assetTypeButton;
- (IBAction)showAssetTypePicker:(UIBarButtonItem *)sender;

@end

@implementation GJDetailViewController

-(instancetype) initForNewItem:(BOOL)isNew
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        if (isNew) {
            UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(save:)];
            self.navigationItem.rightBarButtonItem = doneItem;
            
            UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
            self.navigationItem.leftBarButtonItem = cancelItem;
        }
        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
        [defaultCenter addObserver:self selector:@selector(updateFonts) name:UIContentSizeCategoryDidChangeNotification object:nil];
    }
    return self;
}

- (void) dealloc{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter removeObserver:self];
}

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    @throw [NSException exceptionWithName:@"Wrong initalizer" reason:@"Use initForNewItem" userInfo:nil];
    return nil;
}

- (void) save:(id)sender
{
//    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dismissBlock];
}

- (void) cancel:(id) sender
{
    [[GJItemStore sharedStore] removeItem:self.item];
//    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dismissBlock];
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)takePicture:(id)sender {
    if ([self.imagePickerPopover isPopoverVisible]) {
        [self.imagePickerPopover dismissPopoverAnimated:YES];
        self.imagePickerPopover = nil;
        return;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
//    [self presentViewController:imagePicker animated:YES completion:nil];
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        self.imagePickerPopover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
//        self.imagePickerPopover.popoverBackgroundViewClass = UIPopoverB
        self.imagePickerPopover.delegate = self;
        
        [self.imagePickerPopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }else{
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    
//    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
//    NSArray *availableTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
//    ipc.mediaTypes = availableTypes;
//    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
//    ipc.delegate = self;
}

- (void) setItem:(GJItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}

- (void)updateFonts{
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.nameLabel.font = font;
    self.serialNumberLabel.font = font;
    self.valueLabel.font = font;
    self.dateLabel.font = font;
    
    self.nameField.font = font;
    self.serialNumberField.font = font;
    self.valueField.font = font;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *iv = [[UIImageView alloc] initWithImage:nil];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    iv.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:iv];
    self.imageView = iv;
    
    NSDictionary *nameMap =@{@"imageView": self.imageView,
                             @"dateLabel": self.dateLabel,
                             @"toolbar": self.toolbar};
    
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]-0-|" options:0 metrics:nil views:nameMap];
    
    NSArray *vertiacalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[dateLabel]-[imageView]-[toolbar]" options:0 metrics:nil views:nameMap];
    
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:vertiacalConstraints];
    
    [self.imageView setContentHuggingPriority:200 forAxis:700];
    [self.imageView setContentCompressionResistancePriority:700 forAxis:UILayoutConstraintAxisVertical];
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
    if (itemKey) {
        UIImage *imageToDisplay = [[GJImageStore sharedStore] imageForKey:itemKey];
        self.imageView.image = imageToDisplay;
    }else{
        self.imageView.image = nil;
    }
    
    NSString *typeLabel = [self.item.assetType valueForKey:@"label"];
    if (!typeLabel) {
        typeLabel = @"None";
    }
    self.assetTypeButton.title = [NSString stringWithFormat:@"Type: %@", typeLabel];
    
    [self updateFonts];
}

- (void) prepareViewsForOrientation:(UIInterfaceOrientation)orientation
{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        return;
    }
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        self.imageView.hidden = YES;
        self.cameraButton.enabled = NO;
    }else{
        self.imageView.hidden = NO;
        self.cameraButton.enabled = YES;
    }
}

- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self prepareViewsForOrientation:toInterfaceOrientation];
}

-(void) popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    NSLog(@"User dismissed popover");
    self.imagePickerPopover = nil;
    self.assetPickerPopover = nil;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    UIInterfaceOrientation io = [[UIApplication sharedApplication] statusBarOrientation];
    [self prepareViewsForOrientation:io];
    
    [self.view endEditing:YES];
    
    GJItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
}

- (IBAction)showAssetTypePicker:(UIBarButtonItem *)sender {
    [self.view endEditing:YES];
    
    GJAssetTypeViewController *avc = [[GJAssetTypeViewController alloc] init];
    avc.item = self.item;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        self.assetPickerPopover = [[UIPopoverController alloc] initWithContentViewController:avc];
        self.assetPickerPopover.delegate = self;
        avc.delegate = self;
        [self.assetPickerPopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
        //        [self presentViewController:avc animated:YES completion:nil];
        [self.navigationController pushViewController:avc animated:YES];
    }
    //    [self.navigationController pushViewController:avc animated:YES];
}

#pragma mark - textField delegate方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - imagePicker delegate方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSString *oldKey = self.item.itemKey;
    
    if (oldKey) {
        [[GJImageStore sharedStore] deleteImageForKey:oldKey];
    }
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    [self.item setThumbnailFromImage:image];
    
    [[GJImageStore sharedStore] setImage:image forKey:self.item.itemKey];
    
    self.imageView.image = image;
//    NSURL *mediaURL = info[UIImagePickerControllerMediaURL];
//    if (mediaURL) {
//        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum([mediaURL path])) {
//            UISaveVideoAtPathToSavedPhotosAlbum([mediaURL path], nil, nil, nil);
//            
//            [[NSFileManager defaultManager] removeItemAtPath:[mediaURL path] error:nil];
//        }
//    }
    
//    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.imagePickerPopover) {
        [self.imagePickerPopover dismissPopoverAnimated:YES];
        self.imagePickerPopover = nil;
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - PassingValue delegate method
- (void) passingValue:(NSString *)value{
    self.assetTypeButton.title = [NSString stringWithFormat:@"Type: %@", value];
    [self.assetPickerPopover dismissPopoverAnimated:YES];
    self.assetPickerPopover = nil;
}

@end
