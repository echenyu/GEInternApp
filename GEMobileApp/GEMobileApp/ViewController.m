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

//This setup function just sets up the content on the first screen
//1. Sets up the profileName by picking the attribute "name"
//2. Sets up the picture (this function needs to be read a few times.
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
    
    
}

//If a user clicks log out, then the application
//will sign out the PFUser and open a viewController named "login"
-(IBAction)logout:(id)sender {
    [PFUser logOut];
    UINavigationController *navigationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
    navigationVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:navigationVC animated:YES completion:nil];
    
    
}

//This is an IBAction connected to the Upload New Picture
//When picture is chosen, the UIImageView Picture will change
//to the image selected.
//UIImagePickerController is the object type that allows you to select an image
//Need to set this viewcontroller as the delegate (errors right now...)
-(IBAction)uploadPic:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

//One of the delegate functions of the UIImagePickerController!
//If one of the photos is clicked on in the controller, then this function will be automatically
//called! From here, we have to dismiss the UIImagePickerController.
//In addition, we upload the image to Parse here. We get the image and save it as NSData to
//use for later. 
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
