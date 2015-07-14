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
    [super viewDidLoad];
    [self setup];
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
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:39.2451592
                                                            longitude:-84.44284820000001
                                                                 zoom:15];
    _googleMap = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    _googleMap.myLocationEnabled = YES;
    self.view = _googleMap;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(39.2451592, -84.44284820000001);
    marker.title = @"GE Aviation";
    marker.snippet = @"1 Neumann Way";
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
