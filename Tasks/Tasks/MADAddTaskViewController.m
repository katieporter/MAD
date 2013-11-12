//
//  MADAddTaskViewController.m
//  Tasks
//
//  Created by Katie Porter on 11/10/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADAddTaskViewController.h"
#import "MADTask.h"
#import "MADAppDelegate.h"

@interface MADAddTaskViewController ()

@property (strong, nonatomic) MADTask *task;

@end

@implementation MADAddTaskViewController

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
    
    // Add a target and an action to the cancel button
    UIBarButtonItem *leftBarButtonItem = self.navigationItem.leftBarButtonItem;
    leftBarButtonItem.target = self;
    leftBarButtonItem.action = @selector(cancelButtonTapped);
    
    // Add a target and an action to the done button
    UIBarButtonItem *rightBarButtonItem = self.navigationItem.rightBarButtonItem;
    rightBarButtonItem.target = self;
    rightBarButtonItem.action = @selector(doneButtonTapped);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Create a new task
    // Lots of help from here: https://developer.apple.com/library/mac/documentation/cocoa/conceptual/coredata/Articles/cdBasics.html#//apple_ref/doc/uid/TP40001650-TP1
    MADAppDelegate *applicationDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *managedObjectContext = [applicationDelegate managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:managedObjectContext];
    self.task = [[MADTask alloc] initWithEntity:entity insertIntoManagedObjectContext:managedObjectContext];
}

- (void)cancelButtonTapped
{
    MADAppDelegate *applicationDelegate = [UIApplication sharedApplication].delegate;
    [applicationDelegate.managedObjectContext deleteObject:self.task];
    NSError *error = nil;
    if ([applicationDelegate.managedObjectContext save:&error]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)doneButtonTapped
{
    // Set the task name to the value of the text field
    UITableViewCell *nameCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    UITextField *nameTextField = (UITextField *)[nameCell viewWithTag:1];
    self.task.name = nameTextField.text;
    
    // Perform validatons
    if ([self.task.name isEqualToString:@""] || !self.task.name) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please give your task a name!"
                                                       delegate:nil
                                              cancelButtonTitle:@"Continue"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    MADAppDelegate *applicationDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *managedObjectContext = [applicationDelegate managedObjectContext];
    
    // Display error if task name is not saved correctly, otherwise, return to main storyboard
    NSError *error = nil;
    [managedObjectContext save:&error];
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
        [alert show];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
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
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TaskNameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
