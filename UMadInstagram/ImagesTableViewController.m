//
//  ImagesTableViewController.m
//  UMadInstagram
//
//  Created by Mickey Barboi on 10/2/13.
//  Copyright (c) 2013 Mickey Barboi. All rights reserved.
//

#import "ImagesTableViewController.h"

#import "CommentViewController.h"

@interface ImagesTableViewController () {
    int lastSelected;
}

@end

@implementation ImagesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int max = [self.data count];

    if(self.numImages > max)
        return max;
    return self.numImages;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell.textLabel setText:[[[self.data objectAtIndex:indexPath.row] objectForKey:@"user"] objectForKey:@"username"]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%i",indexPath.row + 1]];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    lastSelected = indexPath.row;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CommentViewController *controller = (CommentViewController *)segue.destinationViewController;
    [controller setData:[self.data objectAtIndex:lastSelected]];
}

@end
