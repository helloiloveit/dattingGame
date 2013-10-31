//
//  UserProfileViewController.h
//  dattingGame
//
//  Created by huyheo on 10/25/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageHandler.h"

@interface UserProfileViewController : UIViewController <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UITextView *firstTextView;
@property (weak, nonatomic) IBOutlet UITextView *secondTextView;
@property (weak, nonatomic) IBOutlet UITextView *secondHeaderTextView;
@property (weak, nonatomic) IBOutlet UITextView *firstHeaderTextView;
- (IBAction)playSettingButton:(id)sender;
- (IBAction)editButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *playButton;


@property (strong, nonatomic) UIImageView *avatarPointer;
@property (strong, nonatomic) NSMutableDictionary *profileInfo;
@end
