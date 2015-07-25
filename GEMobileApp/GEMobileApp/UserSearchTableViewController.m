//
//  UserSearchTableViewController.m
//  GEMobileApp
//
//  Created by Eric Yu on 7/17/15.
//  Copyright (c) 2015 EricYu. All rights reserved.
//

#import "UserSearchTableViewController.h"
#import "SWRevealViewController.h"
#import <Parse/Parse.h>
#import "ViewController.h"
#import "userTableViewCell.h"

@interface UserSearchTableViewController ()

@end

@implementation UserSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"userTableViewCell"
                                bundle:nil];
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"userTableViewCell"];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:@"userTableViewCell"];
    
    self.mySearchBar.delegate = self;
    self.mySearchBar.returnKeyType = UIReturnKeyDone;
    self.mySearchBar.enablesReturnKeyAutomatically = NO;
    
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

    self.filteredResults = [NSMutableArray arrayWithCapacity:[self.allUsers count]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(void)viewDidAppear:(BOOL)animated {
    PFQuery *userQuery = [PFUser query];
    [userQuery setLimit:1000];
    [userQuery orderByAscending:@"firstName"];
    [userQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error) {
            self.allUsers = objects;
            [self.tableView reloadData];
        }
    }];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.mySearchBar resignFirstResponder];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.filteredResults removeAllObjects];
    
    NSPredicate *p1 = [NSPredicate predicateWithFormat:@"SELF.firstName CONTAINS[c] %@", searchBar.text];
    NSPredicate *p2 = [NSPredicate predicateWithFormat:@"SELF.lastName CONTAINS[c] %@", searchBar.text];
    self.filteredResults = [NSMutableArray arrayWithArray:[self.allUsers filteredArrayUsingPredicate:p1]];
    [self.filteredResults addObjectsFromArray:[self.allUsers filteredArrayUsingPredicate:p2]];
    [self.filteredResults setArray:[[NSSet setWithArray:self.filteredResults] allObjects]];
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(self.mySearchBar.text.length > 0) {
        return self.filteredResults.count;
    } else {
        return self.allUsers.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    userTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userTableViewCell"];
    PFUser *indexUser;
    
    if(self.mySearchBar.text.length > 0) {
        indexUser = self.filteredResults[indexPath.row];
    } else {
        indexUser = self.allUsers[indexPath.row];
    }
    
    NSString *firstName = [indexUser objectForKey:@"firstName"];
    NSString *lastName = [indexUser objectForKey:@"lastName"];
    NSString *fullName = [firstName stringByAppendingString:[NSString stringWithFormat:@" %@", lastName]];
    
    cell.fullNameLabel.text = fullName;
    cell.universityLabel.text = [indexUser objectForKey:@"college"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.profilePictureView.image = [UIImage imageNamed:@"nopic.gif"];
    PFFile *imageFile = [indexUser objectForKey:@"profilePicture"];
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (data) {
            cell.profilePictureView.image = [UIImage imageWithData:data];
        }
    }];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"profileSegue"sender:self];
}

#pragma mark - UISearchDisplayController Delegate Methods
/*-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}*/


#pragma mark - Navigation



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *pathToUser = [self.tableView indexPathForSelectedRow];
    
    PFUser *user;
    if(self.mySearchBar.text.length > 0) {
        user = [self.filteredResults objectAtIndex:pathToUser.row];
    } else {
        user = [self.allUsers objectAtIndex:pathToUser.row];
    }
    
    [[segue
      destinationViewController]setUserPF:user];
    [[segue destinationViewController]setNoEditButtonNeeded:YES];
    
}


@end
