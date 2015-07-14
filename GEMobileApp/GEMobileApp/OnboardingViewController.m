//
//  OnboardingViewController.m
//  GEMobileApp
//
//  Created by Eric Yu on 6/30/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import "OnboardingViewController.h"
#import "SWRevealViewController.h"


@interface OnboardingViewController ()

@end

@implementation OnboardingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*UIScrollView *scroll = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 64, 375, 500)];
    scroll.backgroundColor = [UIColor greenColor];
    scroll.scrollEnabled = YES;
    scroll.contentSize = CGSizeMake(300,1200);
    [self.view addSubview:scroll];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 300, 1000)];
    label.text = @"Testing for scroll stuff";
    
    [scroll addSubview:label];*/
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

    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 64 + 10, 375-10, 40)];
    title.text = @"Onboarding";
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:title];
    
    //Generating the text for the content
    NSArray *contentArray = @[@"\nOn this page, you will find basic information about the onboarding process. A few commom frequently asked questions can be found in the FAQ section of this app.",
                              @"                                    1. Onboarding process:",
                              @"   (i) Report to Building 800",
                              @"   (ii) Get photo taken for badges",
                              @"   (iii) Orientation Presentation",
                              @"   (iv) Go for lunch with your mentors",
                              @"\n",
                              @"                                      2. First day checklist:",
                              @"   (i) Form of ID \n       Bring in two pieces of identification purposes. Valid forms of \n       identification were sent out in the mail. ",
                              @"   (ii) GE Paperwork  \n       Be sure to bring along any other paperwork you got from GE.",
                              @"   (iii) Badge  \n       You should receive a badge on yout first day, if not, \n       notify someone.",
                              @"\n",
                              @"                                       3. Onboarding tasks:",
                              @"   (i) Request for pin",
                              @"   (ii) Setup direct deposit",
                              @"   (iii) Update picture in Support Central",
                              @"   (iv) Verify personal info in Support Central",
                              @"   (v) Update phone number in Outlook",
                              @"\n",
                              @"                                4. Important URLs for first day:",
                              @"   (i) Requesting pin - ",
                              @"   (ii) Kronos - ",
                              @"   (iii) My GE - ",
                              @"   (iv) Colab - ",
                              @"   (v) Support Central - ",
                              @"   (vi) Webex - ",
                              @"   (vii) Performance Appraisal - ",
                              @"   (viii) Help Desk - ",
                              @"   (ix) Compliance Training - ",
                              @"   (x) Benefits - ",
                              @"\n"
                              ];
    NSString *contentString = @"";
    for (int i=0; i<[contentArray count]; i++) {
        contentString = [contentString stringByAppendingString:[contentArray objectAtIndex:i]];
        contentString = [contentString stringByAppendingString:@"\n\n"];
    }
    
    
    UITextView *text = [[UITextView alloc] initWithFrame:CGRectMake(5, 64 + 50, 375-5, 520)];
    text.text = contentString;
    //text.text = @"Table of contents/Icons: \nI.            Onboarding Process – Different Steps in Communication Process from GE (Timeline)\nII.            1st Day Checklist (All Aviation)\nIII.            List of Onboarding Tasks:\na.       Request for Pin\nb.      Setup Direct Deposit\nc.       Update Picture in Support Central";
        
        /*d.      Verify Personal Information in Support Central
        
        e.      Update Phone Number in Outlook
        
        IV.            Important URL’s for 1st Day:
            
            a.       Requesting Pin
            
            b.      Kronos
            
            c.       My ge
            
            d.      Colab
            
            e.      Support Central
            
            f.        Webex
            
            g.       Performance Appraisal
            
            h.      Help Desk
            
            i.         Compliance Training
            
            j.        Benefits";*/
    text.scrollEnabled = YES;
    text.userInteractionEnabled = YES;
    text.editable = NO;
    [self.view addSubview:text];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
