//
//  MapViewController.m
//  GEMobileApp
//
//  Created by Eric Yu on 6/30/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import "MapViewController.h"

@import GoogleMaps;

@interface MapViewController ()

@property (nonatomic, strong)  GMSMapView *googleMap;

@end

@implementation MapViewController

//This is just to allocate memory for the googlemap property that we have from above.
-(GMSMapView *)googleMap{
    if(!_googleMap) {
        _googleMap = [[GMSMapView alloc]init];
    }
    return _googleMap;
}

- (void)viewDidLoad {
    
    //currCoordinate = CLLocationCoordinate2DMake(39.2451592, -84.44284820000001);
    [super viewDidLoad];
    //[self setup:@"Evendale"];
    
    self.mapIndex = 0;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//This is our setup function that is called right as the view loads.
//We set the CameraPostion, marker, and map to the specified
//values. (These values are subject to change depending on the
//row clicked in the mapTableViewController!
-(void)setup {
    //Creating the location array:
    self.locationInfo = [[NSMutableArray alloc] init];
    NSMutableArray *evendale = [[NSMutableArray alloc] initWithObjects:@"Evendale",
                                @"1 Neumann Way, Cincinnati, OH 45215",
                                [NSNumber numberWithFloat:39.2451592],
                                [NSNumber numberWithFloat:-84.44284820000001],
                                nil];
    NSMutableArray *bbc = [[NSMutableArray alloc] initWithObjects:@"BBC",
                           @"2630 Glendale Milford Rd, Cincinnati, OH 45241",
                           [NSNumber numberWithFloat:39.257434],
                           [NSNumber numberWithFloat:-84.43340189999998],
                           nil];
    NSMutableArray *blueAsh = [[NSMutableArray alloc] initWithObjects:@"Blue Ash",
                               @"4445 Lake Forest Dr, Cincinnati, OH 45242",
                               [NSNumber numberWithFloat:39.2532845],
                               [NSNumber numberWithFloat:-84.38121319999999],
                               nil];
    NSMutableArray *northPointe = [[NSMutableArray alloc] initWithObjects:@"North Pointe",
                                   @"6440 Aviation Way, West Chester Township, OH 45069",
                                   [NSNumber numberWithFloat:39.3219662],
                                   [NSNumber numberWithFloat:-84.41328980000003],
                                   nil];
    NSMutableArray *peebles = [[NSMutableArray alloc] initWithObjects:@"Peebles",
                               @"1200 Jaybird Rd, Peebles, OH - 45660",
                               [NSNumber numberWithFloat:38.9328894],
                               [NSNumber numberWithFloat:-83.30304039999999],
                               nil];
    //Still need to fix the following:
    NSMutableArray *crownPoint = [[NSMutableArray alloc] initWithObjects:@"Crown Point",
                                  @"1 Crowne Point Ct, Cincinnati, OH 45241",
                                  [NSNumber numberWithFloat:39.265992],
                                  [NSNumber numberWithFloat:-84.438662],
                                  nil];
    NSMutableArray *iwu = [[NSMutableArray alloc] initWithObjects:@"IWU",
                           @"4201 S Washington St, Marion, IN 46953",
                           [NSNumber numberWithFloat:40.520925],
                           [NSNumber numberWithFloat:-85.666313],
                           nil];
    NSMutableArray *princetonHill = [[NSMutableArray alloc] initWithObjects:@"Princeton Hill",
                                     @"30 Merchant Street W28, Cincinnati, OH 45246",
                                     [NSNumber numberWithFloat:39.281184],
                                     [NSNumber numberWithFloat:-84.470135],
                                     nil];
    NSMutableArray *qtc = [[NSMutableArray alloc] initWithObjects:@"QTC",
                           @"10270 Saint Rita Lane. Evendale, Ohio 45215",
                           [NSNumber numberWithFloat:39.252741],
                           [NSNumber numberWithFloat:-84.447630],
                           nil];
    
    
    
    [self.locationInfo addObject: blueAsh];
    [self.locationInfo addObject:bbc];
    [self.locationInfo addObject: crownPoint];
    [self.locationInfo addObject: evendale];
    [self.locationInfo addObject: iwu];
    [self.locationInfo addObject:northPointe];
    [self.locationInfo addObject:peebles];
    [self.locationInfo addObject: princetonHill];
    [self.locationInfo addObject: qtc];
    
    
    //Getting the current map location data
    NSMutableArray *selectedMap = [self.locationInfo objectAtIndex:[self.mapIndex intValue]];
    NSString *title = [selectedMap objectAtIndex:0];
    NSString *snippet = [selectedMap objectAtIndex:1];
    CLLocationDegrees latitude = [[selectedMap objectAtIndex:2] floatValue];
    CLLocationDegrees longitude = [[selectedMap objectAtIndex:3] floatValue];
    
    //Setting up the camera
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latitude
                                                            longitude:longitude
                                                                 zoom:15];
    
    _googleMap = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    _googleMap.myLocationEnabled = YES;
    self.view = _googleMap;
    
    //Creating the marker based on the current map data
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(latitude, longitude);
    marker.title = title;
    marker.snippet = snippet;
    marker.map = _googleMap;
    
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
