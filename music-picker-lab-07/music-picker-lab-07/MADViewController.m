//
//  MADViewController.m
//  music-picker-lab-07
//
//  Created by Katie Porter on 10/3/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"Country", @"Pop", @"Rock", @"Alternative", @"Hip Hop", @"Jazz", @"Classical", nil];
    _genre = array;
    
    NSArray *array2 = [[NSArray alloc] initWithObjects:@"1950s", @"1960s", @"1970s", @"1980s", @"1990s", @"2000s", @"2010s", nil];
    _decade = array2;
}

// Methods to implement the picker
// Required for the UIPickerViewDataSource protocol
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    // Number of components
    return 2;
}

// Required for the UIPickerViewDataSource protocol
-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    // Checks which component was picked and returns that compontent's row count
    if (component==0)
    return [_genre count];
    else return [_decade count];
}

// Picker delegate methods
// Returns the title for a given row
-(NSString *)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row
           forComponent:(NSInteger)component
{
    // Returns the content of the row
    // Checks which component was picked and returns the value for the requested component
    if (component==0)
        return [_genre objectAtIndex:row];
    else return [_decade objectAtIndex:row];
}

// Called when a row is selected
-(void)pickerView:(UIPickerView *)pickerView
     didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    // Gets chosen row for genre
    NSInteger genreRow = [_musicPicker selectedRowInComponent:0];
    // Gets chosen row for decade
    NSInteger decadeRow = [_musicPicker selectedRowInComponent:1];
    
    // Writes the string with the row's content to the label
    _choiceLabel.text = [NSString stringWithFormat:@"You like %@ from the %@.", [_genre objectAtIndex:genreRow], [_decade objectAtIndex:decadeRow]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
