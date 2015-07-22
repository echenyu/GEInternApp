//
//  ViewController.h
//  GEMobileApp
//
//  Created by Eric Yu on 6/30/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"


@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

//User Label
@property (nonatomic, weak) IBOutlet UILabel *profileName;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *programLabel;
@property (nonatomic, weak) IBOutlet UILabel *schoolLabel;
@property (nonatomic, weak) IBOutlet UILabel *majorLabel;
@property (nonatomic, weak) IBOutlet UITextView *descriptionView;


//User Picture
@property (nonatomic, weak) IBOutlet UIImageView *profilePic;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIView *backgroundColorView;
@property (nonatomic, strong) PFUser *userPF;
@property BOOL noEditButtonNeeded;

@end

