//
//  MapTableViewController.h
//
//
//  Created by Eric Yu on 7/7/15.
//

//

#import <UIKit/UIKit.h>

@interface MapTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *items;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (nonatomic) NSIndexPath *selectedIndex;


@end
