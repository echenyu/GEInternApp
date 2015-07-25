//
//  userTableViewCell.h
//  GEMobileApp
//
//  Created by David Mattia on 7/25/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profilePictureView;
@property (weak, nonatomic) IBOutlet UILabel *universityLabel;

@end
