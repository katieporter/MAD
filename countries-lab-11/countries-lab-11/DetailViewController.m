//
//  DetailViewController.m
//  countries-lab-11
//
//  Created by Katie Porter on 10/24/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "DetailViewController.h"
#import "CountryViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
 
    // Comment out edit button so it doesn't override add button
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

 -(void)viewWillAppear:(BOOL)animated
{
    // Reload the data in the tableView
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// This is a way to have "Sections" for longer code
// It's a fancy comment--it shows up in the jump bar!
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_countryList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [_countryList objectAtIndex:indexPath.row];
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView
canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Gets the row being edited
    NSInteger row = [indexPath row];
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_countryList removeObjectAtIndex:row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
      toIndexPath:(NSIndexPath *)toIndexPath
{
    // Row moving from
    // NSUInteger has to be a positive number
    NSUInteger fromRow = [fromIndexPath row];
    // Row moving to
    NSUInteger toRow = [toIndexPath row];
    // The country we are moving
    NSString *moveCountry = [_countryList objectAtIndex:fromRow];
    // Remove the country from the row
    [_countryList removeObjectAtIndex:fromRow];
    // Insert the country in the row
    [_countryList insertObject:moveCountry atIndex:toRow];
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)unwindCountry:(UIStoryboardSegue *)segue
{
    if ([segue.identifier isEqualToString:@"doneSegue"])
    {
        CountryViewController *source = [segue sourceViewController];
        if (source.addedCountry != nil)
        {
            [_countryList addObject:source.addedCountry];
            [self.tableView reloadData];
        }
    }
}

@end
