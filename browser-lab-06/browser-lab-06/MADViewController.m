//
//  MADViewController.m
//  browser-lab-06
//
//  Created by Katie Porter on 9/24/13.
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
    _webView.delegate=self;
    //sets the controlle as the delegate of the UIWebView instance
    [self loadWebPageWithString:@"http://redwood.colorado.edu/apierce/mad/fall13"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//load a new web page in the web view
-(void)loadWebPageWithString:(NSString *)urlString;
//the NSString passed should be a properly formed url
//minus sign means you are calling an instance method on an object
{
    NSURL *url = [NSURL URLWithString:urlString];
    //NSURL object is initialized using a NSString that is passed to the method
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //constructs a NSURLRequest object from the NSURL object
    [_webView loadRequest:request];
    //loads a NSURLRequest object
}

//UIWebViewDelegate method called when the web page doesn't load successfully
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Loading Web Page"
                                                message:[error localizedDescription]
                                                //NSError translates error messages in the user's language
                                                delegate:self
                                                cancelButtonTitle:nil
                                                otherButtonTitles:@"OK", nil];
    [alertView show];
    //send the show message to display the alertView
}

- (IBAction)bookmarkItemTapped:(UIBarButtonItem *)sender {
    //create the action sheet
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil
                                                        delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                        destructiveButtonTitle:nil
                                                        otherButtonTitles:@"ATLAS", @"TAM", @"CU", nil];
    [actionSheet showFromToolbar:_toolbar];
    //displays the action sheet from the toolbar
}

//UIActionSHeetDelegate method
//called when a selection is made on an action sheet
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex==0) {
        [self loadWebPageWithString:@"http://atlas.colorado.edu"];
    }
    else if (buttonIndex==1) {
        [self loadWebPageWithString:@"http://tam.colorado.edu"];
    }
    else if (buttonIndex==2) {
        [self loadWebPageWithString:@"http://www.colorado.edu"];
    }
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [_spinner startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [_spinner stopAnimating];
}

@end
