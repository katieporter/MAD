//
//  MADViewController.m
//  scrabble-lab-10
//
//  Created by Katie Porter on 10/22/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
{
    // In the .m because it doesn't need to be public
    // Doesn't have an @property because we don't need the getter and setter
    // We can now use "words" throughout the .m file
    // Don't need to refer to it at "_words"
    // This is not in viewDidLoad because we want to use it throughout the entire class
    NSArray *words;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Return a bundle object of the app
    NSBundle *bundle = [NSBundle mainBundle];
    // Retreive the path of words.plist
    NSString *plistPath = [bundle pathForResource:@"qwordswithoutu1" ofType:@"plist"];
    // Load the words of the plist file into the array
    words = [[NSArray alloc] initWithContentsOfFile:plistPath];
    // Set the title of THIS view controller
    self.title = @"Words";
}

// Required methods for UITableViewDataSource
// Customize the number of rows in the section
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the words plist
    return [words count];
}

// Display table view cells
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Static variables are alloated for the lifetime of the program, not just the method
    // We do this so it doesn't have to create the object everytime this method is run (for each row created)
    // Scope is just the class--can't be inherited by a subclass
    static NSString *cellIdentifier = @"cellIdentifier";
    
    // Deque... is basically an alloc init
    // Return type is id because it will either return a cell object or nil
    // ALL this does is create the cell--no content yet
    // This method gets called when the app needs to DRAW a cell--so when you open the app and when you scroll
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        // The next time this is run, this cell object will be found through the deque method
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    // Configure the cell
    // Set the test of the cell with the row being requested
    cell.textLabel.text = [words objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"Q no U";
    
    return cell;
}

// UITableViewDelegate method that is called when a row is selected
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Set the title of the selected row
    NSString *rowValue = [words objectAtIndex:indexPath.row];
    NSString *message = [[NSString alloc] initWithFormat:@"You selected %@", rowValue];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row Selected"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"Yes, I did"
                                           otherButtonTitles:nil];
                          
    [alert show];
    // Deselect the row that has been chosen
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
