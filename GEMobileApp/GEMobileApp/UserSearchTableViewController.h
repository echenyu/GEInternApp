//
//  UserSearchTableViewController.h
//  GEMobileApp
//
//  Created by Eric Yu on 7/17/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserSearchTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (nonatomic, strong) NSArray *allUsers; 

@end
