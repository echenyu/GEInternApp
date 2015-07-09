//
//  ViewController.m
//  GEMobileApp
//
//  Created by Eric Yu on 6/30/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import "ViewController.h"
#import "Parse/Parse.h"
#import "loginViewController.h"

@interface ViewController ()
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//This is a PFUser. PFUser is the variable that stores
//user information from the database. When the page is first
//loaded, it will show a default "no pic" picture.
-(void) setup {
    PFUser *user = [PFUser currentUser];
    self.profileName.text = [user objectForKey:@"name"];
    UIImage *image = [UIImage imageNamed:@"nopic.gif"];
    if(![[PFUser currentUser]objectForKey:@"profilePicture"]) {
        self.profilePic.image = image;
    } else {
        [user[@"profilePicture"]getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if(!error) {
                self.profilePic.image = [UIImage imageWithData:data];
            }
        }];
    }
    NSLog(@"%@", self.profilePic.image);
    
}

//If a user clicks log out, then the application
//will sign out the PFUser and segue back to the login page
-(IBAction)logout:(id)sender {
    [PFUser logOut];
    UINavigationController *navigationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
    navigationVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:navigationVC animated:YES completion:nil];
    
    
}

//This is an IBAction connected to the Upload New Picture
//When picture is chosen, the UIImageView Picture will change
//to the image selected.
-(IBAction)uploadPic:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    // Get the image from the result
    UIImage* image = [info valueForKey:@"UIImagePickerControllerOriginalImage"];
    NSData *profPicData = UIImagePNGRepresentation(image);
    PFFile *profPicFile = [PFFile fileWithData:profPicData];
    
    [profPicFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        PFUser *user = [PFUser currentUser];
        [user setObject:profPicFile forKey:@"profilePicture"];
        [user saveInBackground];
        
    }];
    
    self.profilePic.image = image;
}
@end
