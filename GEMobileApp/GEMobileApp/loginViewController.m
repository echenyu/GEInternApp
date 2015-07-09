//
//  loginViewController.m
//  GEMobileApp
//
//  Created by Eric Yu on 7/7/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import "loginViewController.h"
#import <Parse/Parse.h>

//Member variable for a user that was logged in.
@interface loginViewController () {
    PFUser *successfulUser;
}

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Action for the login button. It checks the database to see
//if the user can log in or not. When login works, then the
//next screen will be presented. The segue transition is a
//horizontal flip
-(IBAction)login:(id)sender {
    
    
    [PFUser logInWithUsernameInBackground:self.username.text password:self.password.text block:^(PFUser *user, NSError *error) {
        if(user) {
            successfulUser = user;
            UINavigationController *navigationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"homepage"];
            navigationVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            
            [self presentViewController:navigationVC animated:YES completion:nil];
            self.password.text = @"";
        }
        else {
            [self userCredentialsWrong];
        }
    }];

}


//If the User + Pass doesn't work, an alert needs to be shown
-(void) userCredentialsWrong {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ERROR" message:@"Username or password combination wrong" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    NSLog(@"WRONG");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
