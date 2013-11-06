//
//  PlayingWindowViewController.m
//  dattingGame
//
//  Created by huyheo on 10/31/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import "PlayingWindowViewController.h"
#import "ConstantDefinition.h"
#import "textAnimation.h"
#import  <stdlib.h>
@interface PlayingWindowViewController ()

@end

@implementation PlayingWindowViewController



- (void) handleSingleTap: (UITapGestureRecognizer *)gesture
{
    NSLog(@"user tabp");
    [textAnimation animateTwoText:self.firstTextView andHeaderText:self.firstHeaderTextView withOtherText:self.secondTextView withHeaderText:self.secondHeaderTextView withAvatarImg:self.avatarPointer withData:self.profileInfo ];
}


- (void)targetPlayerResponse
{
    InfoLog(@"");
   [self.infoWindow setFrame:CGRectMake(0, -200   , TEXT_WIDTH, TEXT_HEIGHT)];
    dispatch_queue_t fetchQ = dispatch_queue_create("Flickr Fetch", NULL);
    dispatch_async(fetchQ, ^{

        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
            DebugLog(@"user response");
            int r = rand() % 4;
            self.infoWindow.hidden = NO;
            if (r%2 == 0) {
                self.infoWindow.text = @"doi tuong thay to mo ve ban";
                self.infoWindow.textColor = [UIColor whiteColor];
                self.infoWindow.textAlignment = NSTextAlignmentCenter;
                self.infoWindow.font = [UIFont fontWithName:@"Heiti TC" size:18];
                [textAnimation showInfoText: self.infoWindow atViewController:self withFlag:TRUE];

            } else {
               // self.view.hidden = YES;
                self.infoWindow.text = @"doi tuong bo di";
                self.infoWindow.textColor = [UIColor whiteColor];
                self.infoWindow.textAlignment = NSTextAlignmentCenter;
                self.infoWindow.font = [UIFont fontWithName:@"Heiti TC" size:18];
               // UITextView *textView;
                UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, 10, 10);
                [self.infoWindow setContentInset:insets];
                
                [textAnimation showInfoText:self.infoWindow atViewController:self withFlag:FALSE];
                
            }
        });
        
    });
}

- (void) initUserAvatar
{
    //int r = arc4random() % 4;
    int r = rand() % 6;

    NSString *imageName;
    switch (r+1) {
        case 1:
            imageName = @"user1.JPG";
            break;
        case 2:
            imageName = @"user2.jpg";
            break;
        case 3:
            imageName = @"user3.JPG";
            break;
        case 4:
            imageName = @"user4.JPG";
            break;
        case 5:
            imageName = @"user5.JPG";
            break;
        case 6:
            imageName = @"user7.JPG";
            break;
        default:
            imageName = @"user5.JPG";
            break;
    }
    UIImageView *avatarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    
    [ImageHandler setBackGroundImageWithUserAvatar:avatarView toDiameter:300 atCell:self.view];
    
    self.avatarPointer = avatarView;
}

- (void)viewDidLoad
{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleTap];
    [self targetPlayerResponse];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)homeButton:(id)sender {
             [self performSegueWithIdentifier:     @"go_home" sender: NULL];
}
@end
