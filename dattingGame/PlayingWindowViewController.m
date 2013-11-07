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
#import "textDecoration.h"
#import  <stdlib.h>
@interface PlayingWindowViewController ()

@end

@implementation PlayingWindowViewController



- (void) handleSingleTap: (UITapGestureRecognizer *)gesture
{
    NSLog(@"user tabp");
    if (![textAnimation animateTwoText:self.firstTextView andHeaderText:self.firstHeaderTextView withOtherText:self.secondTextView withHeaderText:self.secondHeaderTextView withAvatarImg:self.avatarPointer withData:self.profileInfo ])
    {
        self.verdicView.hidden = NO;
    }
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

                NSString *temp =@"doi tuong thay to mo ve ban";
                [textDecoration setInfoTextAtPlayingView:self.infoWindow withInfo:temp];
                [textAnimation showInfoText: self.infoWindow atViewController:self withFlag:TRUE];

            } else {
               // self.view.hidden = YES;
               NSString *temp = @"doi tuong bo di";
                [textDecoration setInfoTextAtPlayingView:self.infoWindow withInfo:temp];
               // UITextView *textView;
                UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, 10, 10);
                [self.infoWindow setContentInset:insets];
                
                [textAnimation showInfoText:self.infoWindow atViewController:self withFlag:FALSE];
                
            }
        });
        
    });

}
- (void)targetPlayerResponseRandom
{
    InfoLog(@"");
    [self.infoWindow setFrame:CGRectMake(0, -200   , TEXT_WIDTH, TEXT_HEIGHT)];
    dispatch_queue_t fetchQ = dispatch_queue_create("Flickr Fetch", NULL);
    dispatch_async(fetchQ, ^{
        
        sleep(4);
        dispatch_async(dispatch_get_main_queue(), ^{
            DebugLog(@"user response");
            int r = rand() % 4;
            self.infoWindow.hidden = NO;
            if (r%2 == 0) {
 
                
            } else {
                // self.view.hidden = YES;
                NSString *temp = @"doi tuong bo di";
                [textDecoration setInfoTextAtPlayingView:self.infoWindow withInfo:temp];
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
    NSLog(@"check r = %d", r);
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

-(void)initGesture
{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleTap];
}

-(void)initComponentForView
{
    self.verdicView.hidden = YES;
    self.verdicView.backgroundColor = [UIColor whiteColor];
    [self initGesture];
}

- (void)viewDidLoad
{
    [self initComponentForView];
    [self targetPlayerResponse];
    [self targetPlayerResponseRandom];
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
