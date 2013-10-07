//
//  CommentViewController.m
//  UMadInstagram
//
//  Created by Mickey Barboi on 10/2/13.
//  Copyright (c) 2013 Mickey Barboi. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated {
    NSURL *url = [NSURL URLWithString:[[[self.data objectForKey:@"images"] objectForKey:@"standard_resolution"] objectForKey:@"url"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    [imageMain setImage:[UIImage imageWithData:data]];
    
    [textViewComment setText:[[self.data objectForKey:@"caption"] objectForKey:@"text"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
