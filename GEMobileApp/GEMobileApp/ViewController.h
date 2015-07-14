//
//  ViewController.h
//  GEMobileApp
//
//  Created by Eric Yu on 6/30/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *profileName;
@property (nonatomic, weak) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end

