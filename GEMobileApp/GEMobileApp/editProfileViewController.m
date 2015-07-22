//
//  editProfileViewController.m
//  GEMobileApp
//
//  Created by Eric Yu on 7/22/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import "editProfileViewController.h"
#import "SWRevealViewController.h"
#import "Parse/Parse.h"

@interface editProfileViewController ()

@end

@implementation editProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:58.0f/255.0f
                                                                           green:93.0f/255.0f
                                                                            blue:174.0f/255.0f
                                                                           alpha:1.0f];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self setup];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setup {
    PFUser *user = [PFUser currentUser];

    NSString *location = [user objectForKey:@"location"];
    NSString *college = [user objectForKey:@"college"];
    NSString *major = [user objectForKey:@"major"];
    NSString *year = [user objectForKey:@"year"];
    NSString *address = [user objectForKey:@"address"];
    NSString *program = [user objectForKey:@"program"];
    NSString *about = [user objectForKey:@"about"];
    NSString *phone = [user objectForKey:@"phoneNumber"];
    
    self.college.text = college;
    self.major.text = major;
    self.year.text = year;
    self.summerAddress.text = address;
    self.location.text = location;
    self.internProgram.text = program;
    self.about.text = about;
    self.phoneNumber.text = phone;
}

-(IBAction)saveProfile:(id)sender {
    PFUser *user = [PFUser currentUser];
    [user setObject:self.college.text forKey:@"college"];
    [user setObject:self.major.text forKey:@"major"];
    [user setObject:self.year.text forKey:@"year"];
    [user setObject:self.summerAddress.text forKey:@"address"];
    [user setObject:self.location.text forKey:@"location"];
    [user setObject:self.internProgram.text forKey:@"program"];
    [user setObject:self.about.text forKey:@"about"];
    [user setObject:self.phoneNumber.text forKey:@"phoneNumber"];
    [user saveInBackground];
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
