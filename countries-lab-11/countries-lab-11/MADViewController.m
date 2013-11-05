//
//  MADViewController.m
//  countries-lab-11
//
//  Created by Katie Porter on 10/24/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADViewController.h"
#import "DetailViewController.h"
#import "ContinentInfoViewController.h"

@interface MADViewController ()
{
    // Defining this in the interface makes it a class extension, so it is available to all methods of the class (don't need underscore since it wasn't defined in the .h
    // Also note that this is not allocated and initialzed yet
    NSMutableDictionary *continentData;
}

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"continents" ofType:@"plist"];
    // Load the contents of the plist file into a dictionary
    // The dictionary uses the continents as the keys and a NSArray with the countries for each continent
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    continentData = dictionary;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [continentData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    
    // Create an array with all keys from our dictionary
    NSArray *rowData = [continentData allKeys];
    // Set the text of the cell with the row being requested
    cell.textLabel.text = [rowData objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"countrySegue"])
    {
        DetailViewController *countryViewController = segue.destinationViewController;
        // Change for detail disclosure accessory button
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        // Create an array with all keys from out dictionary
        NSArray *rowData = [continentData allKeys];
        countryViewController.title = [rowData objectAtIndex:indexPath.row];
        countryViewController.countryList = [continentData objectForKey:countryViewController.title];
        
    }
   
    if ([segue.identifier isEqualToString:@"continentSegue"])
    {
        ContinentInfoViewController *infoViewController=segue.destinationViewController;
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        NSArray *rowData=[continentData allKeys];
        infoViewController.name=[rowData objectAtIndex:indexPath.row];
        infoViewController.number=[NSString stringWithFormat:@"%d", [[continentData objectForKey:infoViewController.name] count]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
