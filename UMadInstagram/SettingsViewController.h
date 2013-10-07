//
//  SettingsViewController.h
//  UMadInstagram
//
//  Created by Mickey Barboi on 10/2/13.
//  Copyright (c) 2013 Mickey Barboi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface SettingsViewController : UIViewController {
    
    __weak IBOutlet UITextField *textNumberOfImages;
}

@property (weak, nonatomic) HomeViewController *delegate;

@end
