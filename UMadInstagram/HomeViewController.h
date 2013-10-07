//
//  HomeViewController.h
//  UMadInstagram
//
//  Created by Mickey Barboi on 10/2/13.
//  Copyright (c) 2013 Mickey Barboi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController {
    __weak IBOutlet UIActivityIndicatorView *spinner;
}

@property (strong, nonatomic) NSArray *data;
@property (nonatomic) int numbeOfPosts;
@end
