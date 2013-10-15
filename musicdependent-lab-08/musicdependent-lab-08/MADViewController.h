//
//  MADViewController.h
//  musicdependent-lab-08
//
//  Created by Katie Porter on 10/8/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import <UIKit/UIKit.h>
#define artistComponent 0
#define albumComponent 1

@interface MADViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *musicPicker;
@property (weak, nonatomic) IBOutlet UILabel *choiceLabel;
// These are owned by the .xib (view), so there actually is a strong connection to it there
// Think of MADViewController as a class of the superclass UIViewController

@property (strong, nonatomic) NSDictionary *artistAlbums;
@property (strong, nonatomic) NSArray *artists;
@property (strong, nonatomic) NSArray *albums;
@end
