//
//  PlayingFirstViewController.m
//  dattingGame
//
//  Created by huyheo on 10/28/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import "PlayingFirstViewController.h"
#import "ImageHandler.h"

@interface PlayingFirstViewController ()

@end

@implementation PlayingFirstViewController

- (void)swipeDetected:(UISwipeGestureRecognizer *)gesture
{

    NSLog(@"swipe");
    [self moveOldView];
    switch (gesture.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            // you can include this case too
            break;
        case UISwipeGestureRecognizerDirectionDown:
            // you can include this case too
            break;
        case UISwipeGestureRecognizerDirectionLeft:
        case UISwipeGestureRecognizerDirectionRight:
            // disable timer for both left and right swipes.
            break;
        default:
            break;
    }
}

-(void)moveOldView
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5];
    
    NSLog(@"position of firstView = %f", self.firstView.frame.origin.x);
    NSLog(@"position of secondView = %f", self.secondView.frame.origin.x);
    [UIView animateWithDuration:0.5
                          delay:0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         self.firstView.hidden = NO;
                         self.secondView.hidden = NO;
                         if (self.firstView.frame.origin.x == 500) {
                             
                             [self.firstView setFrame:CGRectMake(0,  self.view.frame.origin.y   , self.view.frame.size.width, self.view.frame.size.height)];
                             [self.secondView setFrame:CGRectMake(-500,  self.view.frame.origin.y   , self.view.frame.size.width, self.view.frame.size.height)];
                         } else {
                             [self.firstView setFrame:CGRectMake(-500,  self.view.frame.origin.y   , self.view.frame.size.width, self.view.frame.size.height)];
                             [self.secondView setFrame:CGRectMake(0,  self.view.frame.origin.y   , self.view.frame.size.width, self.view.frame.size.height)];
                         }
                     } 
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         
                         if (self.firstView.frame.origin.x == -500) {
                             self.firstView.hidden = YES;
                             [self.firstView setFrame:CGRectMake(500,  self.view.frame.origin.y   , self.view.frame.size.width, self.view.frame.size.height)];
                             [self.secondView setFrame:CGRectMake(0,  self.view.frame.origin.y   , self.view.frame.size.width, self.view.frame.size.height)];
                         } else if (self.firstView.frame.origin.x == 0){
                             self.secondView.hidden = YES;
                             [self.firstView setFrame:CGRectMake(0,  self.view.frame.origin.y   , self.view.frame.size.width, self.view.frame.size.height)];
                             [self.secondView setFrame:CGRectMake(500,  self.view.frame.origin.y   , self.view.frame.size.width, self.view.frame.size.height)];
                         }
                     }];


    NSLog(@"position of firstView = %f", self.firstView.frame.origin.x);
}

-(void)initSwipe
{
    /*
     UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeScreen:)];
     swipe.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
     [self.view addGestureRecognizer:swipe];
     */
    UISwipeGestureRecognizer *swipeRecognizer =
    [[UISwipeGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(swipeDetected:)];
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeRecognizer];
    
    
}


- (void) initUserAvatar
{
    UIImageView *avatarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_0855.JPG"]];
    [ImageHandler setRoundedAvatarInPlayingWindow:avatarView toDiameter:300 atCell:self.view];
    [self.firstView addSubview: avatarView];
}

- (void) initUserAvatar2
{
    UIImageView *avatarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alex_mac.jpg"]];
    [ImageHandler setRoundedAvatarInPlayingWindow:avatarView toDiameter:300 atCell:self.view];
    [self.secondView addSubview: avatarView];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUserAvatar];
    [self initUserAvatar2];
    [self initSwipe];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
