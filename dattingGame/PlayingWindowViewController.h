//
//  PlayingWindowViewController.h
//  dattingGame
//
//  Created by huyheo on 10/31/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import "UserProfileViewController.h"

@interface PlayingWindowViewController : UserProfileViewController

@property (weak, nonatomic) IBOutlet UITextView *infoWindow;
- (IBAction)homeButton:(id)sender;


@property (weak, nonatomic) IBOutlet UIView *verdicView;

@end
