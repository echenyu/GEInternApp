//
//  newUserViewController.h
//  GEMobileApp
//
//  Created by Eric Yu on 7/7/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newUserViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

//These properties are just the TextFields
@property (nonatomic, weak) IBOutlet UITextField *firstName;
@property (nonatomic, weak) IBOutlet UITextField *lastName; 
@property (nonatomic, weak) IBOutlet UITextField *email;
@property (nonatomic, weak) IBOutlet UITextField *password;
@property (nonatomic, weak) IBOutlet UITextField *passwordConfirm;
@property (nonatomic, weak) IBOutlet UITextField *collegeField;
@property (nonatomic, weak) IBOutlet UITextField *majorField; 

//Property for the image
@property (nonatomic, weak) IBOutlet UIImageView *geLogo;

//Properties for the labels
@property (nonatomic, weak) IBOutlet UILabel *firstNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *lastNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *emailLabel;
@property (nonatomic, weak) IBOutlet UILabel *passwordLabel;
@property (nonatomic, weak) IBOutlet UILabel *passwordConfirmLabel;
@property (nonatomic, weak) IBOutlet UILabel *collegeLabel;
@property (nonatomic, weak) IBOutlet UILabel *majorLabel;

//Property for the sign up button
@property (nonatomic, weak) IBOutlet UIButton *signUpButton;

@end
