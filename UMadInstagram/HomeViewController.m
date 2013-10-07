//
//  HomeViewController.m
//  UMadInstagram
//
//  Created by Mickey Barboi on 10/2/13.
//  Copyright (c) 2013 Mickey Barboi. All rights reserved.
//

#import "HomeViewController.h"
#import "ImagesTableViewController.h"
#import "SettingsViewController.h"

@interface HomeViewController (){
    NSMutableData *jsonResponse;
}


@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.numbeOfPosts = 100;
}

- (void) viewDidAppear:(BOOL)animated {
    NSLog(@"HOME: firing API call");
    
    jsonResponse = [[NSMutableData alloc] init];
    [self getCommentsAndImages];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) getCommentsAndImages {
    NSURL *url = [[NSURL alloc] initWithString:@"http://pages.cs.wisc.edu/~griepent/instagram.json"];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    
    [connection start];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"images"]) {
        ImagesTableViewController *controller = (ImagesTableViewController *)segue.destinationViewController;
        [controller setData:self.data];
        [controller setNumImages:self.numbeOfPosts];
    }
    else {
        SettingsViewController *settings = (SettingsViewController *)segue.destinationViewController;
        
        settings.delegate = self;
    }
}


#pragma mark NSURLConnection Methods
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [jsonResponse setLength:0];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [jsonResponse appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSError *error = nil;
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:jsonResponse options:NSJSONReadingAllowFragments error:&error];

    self.data = [data objectForKey:@"data"];
    
    [connection cancel];
    //stop spinner
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Error During Connection: %@", [error description]);
}

@end
