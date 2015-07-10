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
@property (nonatomic, weak) IBOutlet UIButton *login;
@property (nonatomic, weak) IBOutlet UIButton *createNew;
@property (nonatomic, weak) IBOutlet UILabel *emailLabel;
@property (nonatomic, weak) IBOutlet UILabel *passwordLabel;
@property (nonatomic, weak) IBOutlet UILabel *catchPhrase;
@property (nonatomic, weak) IBOutlet UIImageView *geLogo;
@end
