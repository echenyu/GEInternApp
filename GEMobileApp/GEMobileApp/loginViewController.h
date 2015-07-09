//
//  loginViewController.h
//  GEMobileApp
//
//  Created by Eric Yu on 7/7/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController

//Outlets connected to the UITextFields for the username and
//password
@property (nonatomic, weak) IBOutlet UITextField *username;
@property (nonatomic, weak) IBOutlet UITextField *password;
@end
