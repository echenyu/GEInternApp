//
//  sideBarTableViewController.m
//  GEMobileApp
//
//  Created by Eric Yu on 7/14/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import "sideBarTableViewController.h"
#import "SWRevealViewController.h"
#import "Parse/Parse.h"

@interface sideBarTableViewController ()

@end

@implementation sideBarTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.items = [[NSMutableArray alloc]init];
    [self.items addObject:@"Home"];
    [self.items addObject:@"User Search"];
    [self.items addObject:@"Onboarding"];
    [self.items addObject:@"Maps"];
    [self.items addObject:@"FAQ"];
    [self.items addObject:@"Log Out"];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.items count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSString *rowName = [self.items objectAtIndex:indexPath.row];
    [[cell textLabel]setText:rowName];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        NSLog(@"perform");
        [self performSegueWithIdentifier:@"homePage" sender:self];
    } else if(indexPath.row == 1) {
        [self performSegueWithIdentifier:@"userSearch" sender:self];
    } else if(indexPath.row == 2) {
        [self performSegueWithIdentifier:@"onboarding" sender:self];
    } else if(indexPath.row == 3) {
        [self performSegueWithIdentifier:@"maps" sender:self];
    } else if (indexPath.row == 4){
        [self performSegueWithIdentifier:@"faq" sender:self];
    } else {
        [self.revealViewController revealToggleAnimated:YES];
        UIAlertView *logoutAction = [[UIAlertView alloc]initWithTitle:@"Logout Confirmation" message:@"Are you sure you want to logout?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", nil];
        logoutAction.tag = 100;
        [logoutAction show];
        
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(alertView.tag == 100) {
        if(buttonIndex == 1) {
            [self logout];
        }
    }
}


//If a user clicks log out, then the application
//will sign out the PFUser and open a viewController named "login"
-(void)logout {
    [PFUser logOut];
    UINavigationController *navigationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
    navigationVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:navigationVC animated:YES completion:nil];
    
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
