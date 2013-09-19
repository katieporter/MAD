//
//  MADViewController.m
//  beatles-lab-04
//
//  Created by Katie Porter on 9/17/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    _imageControl.selectedSegmentIndex = -1;
    //value -1 will ensure that neither segement is selected initially
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateCaps {
    if (_capitalizeSwitch.on) {
        _titleLabel.text=[_titleLabel.text uppercaseString];
    }
    else {
        _titleLabel.text=[_titleLabel.text lowercaseString];
    }
}

-(void)updateImage {
    if (_imageControl.selectedSegmentIndex==0) {
        _titleLabel.text=@"Young Beatles";
        _beatlesImage.image=[UIImage imageNamed:@"beatles1.png"];
        //Everytime you see a bracket, it's a method call
        //whatever it returns is sent to the left hand side of the equal sign
    }
    else if (_imageControl.selectedSegmentIndex==1) {
        _titleLabel.text=@"Old Beatles";
        _beatlesImage.image=[UIImage imageNamed:@"beatles2.png"];
    }
}

- (IBAction)changeImage:(UISegmentedControl *)sender {
    [self updateImage];
    [self updateCaps];
}
- (IBAction)updateFont:(UISwitch *)sender {
    [self updateCaps];
}

- (IBAction)changeFontSize:(UISlider *)sender {
    int fontSize = sender.value;
    //get the font size
    _fontSizeNumberLabel.text=[NSString stringWithFormat:@"%d", fontSize];
    //change the font size label
    //access @property via underscore in the .m
    UIFont *newFont=[UIFont systemFontOfSize:sender.value];
    //create a new font object
    _titleLabel.font=newFont;
    //apply the new font to the label
}

@end
