//
//  MapViewController.h
//  GEMobileApp
//
//  Created by Eric Yu on 6/30/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMaps;

@interface MapViewController : UIViewController

-(void)setup;



@property (nonatomic, strong) NSMutableArray *locationInfo;
@property (nonatomic, retain) NSNumber *mapIndex;

@end
