//
//  editProfileViewController.h
//  GEMobileApp
//
//  Created by Eric Yu on 7/22/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface editProfileViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UITextField *college;
@property (nonatomic, weak) IBOutlet UITextField *major;
@property (nonatomic, weak) IBOutlet UITextField *year;
@property (nonatomic, weak) IBOutlet UITextField *phoneNumber;
@property (nonatomic, weak) IBOutlet UITextField *location;
@property (nonatomic, weak) IBOutlet UITextField *internProgram;
@property (nonatomic, weak) IBOutlet UITextView *about;
@property (nonatomic, weak) IBOutlet UITextField *summerAddress;
@end
