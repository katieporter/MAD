//
//  WebViewController.m
//  boulder-lab-10
//
//  Created by Katie Porter on 10/17/13.
//  Copyright (c) 2013 Katie Porter. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

// Load a web page in the web view
- (void)loadWebPageWithString: (NSString *)urlString
{
    // The NSString passed should be a properly formed URL
    // A NSURL object is initialized using a NSString that is passed to the method
    NSURL *url = [NSURL URLWithString:urlString];
    // Contstructs a NSURLRequest object from a NSURL object
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // Loads a NSURLRequest object
    [_boulderWebView loadRequest:request];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	_boulderWebView.delegate = self;
    [self loadWebPageWithString:@"http://www.bouldercolorado.gov/"];
}

// UIWebViewDelegate method that is called when a web page begins to load
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [_boulderSpinner startAnimating];
}

// UIWebViewDelegate method that is called when a web page is done loading
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_boulderSpinner stopAnimating];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
