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
#import "SWRevealViewController.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
    [self setup];
}

-(PFUser *)userPF {
    if(!_userPF) {
        NSLog(@"did this run");
        _userPF = [PFUser currentUser];
    }
    return _userPF;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//This setup function just sets up the content on the first screen
//1. Sets up the profileName by picking the attribute "name"
//2. Sets up the picture (this function needs to be read a few times.
-(void) setup {

    //Get the data from parse here!
    NSString *firstName = [self.userPF objectForKey:@"firstName"];
    NSString *lastName = [self.userPF objectForKey:@"lastName"];
    NSString *fullName = [firstName stringByAppendingString:[NSString stringWithFormat:@" %@", lastName]];
    self.profileName.text = fullName;
    UIImage *image = [UIImage imageNamed:@"nopic.gif"];
    if(![[PFUser currentUser]objectForKey:@"profilePicture"]) {
        self.profilePic.image = image;
    } else {
        [self.userPF[@"profilePicture"]getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if(!error) {
                self.profilePic.image = [UIImage imageWithData:data];
            }
        }];
    }
    self.locationLabel.text = [self.userPF objectForKey:@"location"];
    self.programLabel.text = [self.userPF objectForKey:@"program"];
    
    if(!self.noEditButtonNeeded) {
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
    }
    
    //These two calls will make the profile picture a round circle instead of a square.
    self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width / 2;
    self.profilePic.clipsToBounds = YES;
    
   
    //Set up style of things
    //Setup the navigation bar
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:58.0f/255.0f
                                                                           green:93.0f/255.0f
                                                                            blue:174.0f/255.0f
                                                                           alpha:1.0f];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor blackColor];
    self.profileName.textColor = [UIColor whiteColor];
    self.locationLabel.textColor = [UIColor whiteColor];
    self.programLabel.textColor = [UIColor whiteColor];

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
