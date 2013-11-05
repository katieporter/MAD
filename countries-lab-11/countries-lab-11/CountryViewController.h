//
//  CountryViewController.h
//  countries-lab-11
//
//  Created by Katie Porter on 10/29/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface CountryViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *countryTextField;

// Use copy when you have a class that HAS a mutable version (NSString has a mutable version like NSArray and NSDictionary)
// Makes a COPY of the string so you aren't pointing to the old, wrong version
@property (copy, nonatomic) NSString *addedCountry;

@end
