//
//  MADViewController.m
//  musicdependent-lab-08
//
//  Created by Katie Porter on 10/8/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Returns a bundle object of our app
	NSBundle *bundle = [NSBundle mainBundle];
    
    // Retrieve the path of artistalbums.plist
    NSString *plistPath = [bundle pathForResource:@"artistalbums" ofType:@"plist"];
    
    // Loads the contents of the plist files into the artistAlbums dictionary
    // The dictionary uses the artists as the keys and a NSArray with the albums for each artist
    _artistAlbums = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    // Retrieve all the keys with the artist names and populate the left component
    _artists = [_artistAlbums allKeys];
    
    // Get the artist at index 0
    NSString *selectedArtist = [_artists objectAtIndex:0];
    
    // Get the albums for the selected artist and populate the right component
    _albums = [_artistAlbums objectForKey:selectedArtist];
    

}

// Number of components
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// Required for the UIPickerViewDelegate
// Checks which component was picked and returns that component's row count
- (NSInteger)pickerView:(UIPickerView *)pickerView
 numberOfRowsInComponent:(NSInteger)component
{
    if (component==artistComponent)
        return [_artists count];
        else return [_albums count];
}

// Picker Delegate methods
// Returns title for a given row
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (component==artistComponent)
        return [_artists objectAtIndex:row];
    else return [_albums objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    //Checks which artist was picked
    if (component==artistComponent)
    {
        NSString *selectedArtist = [_artists objectAtIndex:row]; // Gets the selected artist
        _albums = [_artistAlbums objectForKey:selectedArtist]; // Gets the albums for the selected artist and assigns the array of albums to the right component
        [_musicPicker selectRow:0
                    inComponent:albumComponent
                       animated:YES]; // Sets the right component back to 0
        [_musicPicker reloadComponent:albumComponent]; // Reload the right content
    }
    NSInteger artistRow = [_musicPicker selectedRowInComponent:artistComponent]; // Gets the chosen row for the artist
    NSInteger albumRow = [_musicPicker selectedRowInComponent:albumComponent]; // Gets the chosen row for the album
    _choiceLabel.text = [NSString stringWithFormat:@"You like %@ by %@.", [_albums objectAtIndex:albumRow], [_artists objectAtIndex:artistRow]]; // Writes the string with the selected row's content to the label
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
