//
//  CommentViewController.h
//  UMadInstagram
//
//  Created by Mickey Barboi on 10/2/13.
//  Copyright (c) 2013 Mickey Barboi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentViewController : UIViewController {
    
    __weak IBOutlet UIImageView *imageMain;
    __weak IBOutlet UITextView *textViewComment;
}

@property (strong, nonatomic) NSDictionary *data;
@end
