//
//  newUserViewController.h
//  GEMobileApp
//
//  Created by Eric Yu on 7/7/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newUserViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *firstName;
@property (nonatomic, weak) IBOutlet UITextField *lastName; 
@property (nonatomic, weak) IBOutlet UITextField *email;
@property (nonatomic, weak) IBOutlet UITextField *password;
@property (nonatomic, weak) IBOutlet UITextField *passwordConfirm;

@end
