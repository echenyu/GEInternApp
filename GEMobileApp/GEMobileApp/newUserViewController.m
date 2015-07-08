//
//  newUserViewController.m
//  GEMobileApp
//
//  Created by Eric Yu on 7/7/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import "newUserViewController.h"
#import <Parse/Parse.h>

@interface newUserViewController ()

@end

@implementation newUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)createUser:(id)sender {
    PFUser *user = [PFUser user];
    if(!self.email.text) {
        NSLog(@"User didn't have a username");
    }
    
    if(self.password.text.length < 6) {
        NSLog(@"WHY IS THIS BROKEN");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Password too short" message:@"Make sure your password is 6 or more characters"delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    [user setObject:self.name.text forKey:@"name"];

    //This makes the username case insensitive
    NSString *lowerCaseUser = [self.email.text lowercaseString];
    
    user.username = lowerCaseUser;
    user.password = self.password.text;
    user.email = self.email.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"homepage"];
            navigationController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            [self presentViewController:navigationController animated:YES completion:nil];
            
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ERROR" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
    }];
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
