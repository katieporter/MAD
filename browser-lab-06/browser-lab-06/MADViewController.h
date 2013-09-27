//
//  MADViewController.h
//  browser-lab-06
//
//  Created by Katie Porter on 9/24/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController<UIWebViewDelegate, UIActionSheetDelegate>
//adopting the protocol is STEP ONE!
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

- (IBAction)bookmarkItemTapped:(UIBarButtonItem *)sender;
@end
