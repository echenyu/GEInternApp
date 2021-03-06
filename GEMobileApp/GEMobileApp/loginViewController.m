//
//  loginViewController.m
//  GEMobileApp
//
//  Created by Eric Yu on 7/7/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import "loginViewController.h"
#import <Parse/Parse.h>
#import "SWRevealViewController.h"

//Member variable for a user that was logged in.
@interface loginViewController () {
    PFUser *successfulUser;
}

@end

@implementation loginViewController

//Set navigation bar color
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
        // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setup {
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:58.0f/255.0f
                                                                                    green:93.0f/255.0f
                                                                                     blue:174.0f/255.0f
                                                                                    alpha:1.0f];    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    [self.createNew setTintColor:[UIColor whiteColor]];
    [self.login setTintColor: [UIColor whiteColor]];
    self.emailLabel.textColor = [UIColor whiteColor];
    self.password.secureTextEntry = true;
    self.passwordLabel.textColor = [UIColor whiteColor];
    self.catchPhrase.textColor = [UIColor whiteColor];
    self.geLogo.image = [UIImage imageNamed:@"gelogo.png"];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
}
//Action for the login button. It checks the database to see
//if the user can log in or not. When login works, then the
//next screen will be presented. The segue transition is a
//horizontal flip.
-(IBAction)login:(id)sender {
    
    
    [PFUser logInWithUsernameInBackground: [self.username.text lowercaseString] password:self.password.text block:^(PFUser *user, NSError *error) {
        if(user) {
            successfulUser = user;
            SWRevealViewController *revealVC = [self.storyboard instantiateViewControllerWithIdentifier:@"homepage"];
            revealVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            
            [self presentViewController:revealVC animated:YES completion:nil];
            self.password.text = @"";
        }
        else {
            [self userCredentialsWrong: error];
        }
    }];

}


//If the User + Pass doesn't work, an alert needs to be shown.
//This function is called from the IBAction from above
-(void) userCredentialsWrong: (NSError*) error {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Login Failed" message: error.localizedDescription delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
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
