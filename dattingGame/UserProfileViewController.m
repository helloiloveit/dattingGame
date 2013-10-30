//
//  UserProfileViewController.m
//  dattingGame
//
//  Created by huyheo on 10/25/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import "UserProfileViewController.h"
#import "tableCell.h"


@interface UserProfileViewController ()
@property (strong, nonatomic) UIImageView *avatarPointer;
@end

@implementation UserProfileViewController


#define TEXT_HEIGHT 150
#define TEXT_WIDTH  self.view.frame.size.width

#define HEADER_TEXT_POSITION  100
#define CONTENT_TEXT_POSITION  150
#define ABOUT_ME_TEXT_POSITION 400
-(void)moveUp
{

    
    //NSLog(@"list subview of view = %@", self.view.subviews);
    NSLog(@"position of firstView x = %f", self.firstTextView.frame.origin.x);
    NSLog(@"position of firstView y = %f", self.firstTextView.frame.origin.y);
    NSLog(@"position of secondV x = %f", self.secondTextView.frame.origin.x);
    NSLog(@"position of secondV y = %f", self.secondTextView.frame.origin.y);

    [UIView animateWithDuration:1.5
                          delay:0
                        options: UIViewAnimationCurveEaseInOut
                     animations:^{
                         if (self.firstTextView.frame.origin.y == ABOUT_ME_TEXT_POSITION) {
                             self.avatarPointer.alpha = 0;
                             self.firstTextView.alpha = 0;
                         }
                         else if (self.firstTextView.frame.origin.y == CONTENT_TEXT_POSITION) {
                            // [self.firstHeaderTextView setFrame:CGRectMake(0,  -100   , 300, 300)];
                         //   [self.avatarPointer setFrame:CGRectMake(0,  -600   , self.avatarPointer.frame.size.width, self.avatarPointer.frame.size.height)];
                            NSLog(@"move first view");
                             [self.firstHeaderTextView setFrame:CGRectMake(0,  -100   , TEXT_WIDTH, TEXT_HEIGHT)];
                             [self.firstTextView setFrame:CGRectMake(0,  -100   , TEXT_WIDTH, TEXT_HEIGHT)];
                            
                         } else {
                             NSLog(@" move second view");
                             [self.secondTextView setFrame:CGRectMake(0,  -100   , TEXT_WIDTH, TEXT_HEIGHT)];
                             [self.secondHeaderTextView setFrame:CGRectMake(0,  -100   , TEXT_WIDTH, TEXT_HEIGHT)];
                         }
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         [UIView animateWithDuration:0.5
                                               delay:0
                                             options: UIViewAnimationCurveEaseOut
                                          animations:^{
                                              if ((self.firstTextView.frame.origin.y == -100) || (self.firstTextView.frame.origin.y == ABOUT_ME_TEXT_POSITION)) {
                                                  NSLog(@"second view comming");
                                                  
                                                  [self.secondTextView setFrame:CGRectMake(0,  CONTENT_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  [self.secondHeaderTextView setFrame:CGRectMake(0,  HEADER_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                              } else if (self.secondTextView.frame.origin.y == -100) {
                                                  NSLog(@"first view comming");
                                                  self.firstHeaderTextView.hidden = NO;
                                                  [self.firstTextView setFrame:CGRectMake(0,  CONTENT_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  [self.firstHeaderTextView setFrame:CGRectMake(0,  HEADER_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];

                                              }
                                          }
                                          completion:^(BOOL finished){
                                              NSLog(@"Done!");

                                              if ((self.firstTextView.frame.origin.y == -100)|| (self.firstTextView.frame.origin.y == ABOUT_ME_TEXT_POSITION)) {
                                                  NSLog(@"first");
                                                  //self.firstTextView.hidden = YES;
                                                  self.firstTextView.alpha = 1;
                                                  [self.firstTextView setFrame:CGRectMake(0,  800   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  [self.firstHeaderTextView setFrame:CGRectMake(0,  800   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  [self.secondTextView setFrame:CGRectMake(0,  CONTENT_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  [self.secondHeaderTextView setFrame:CGRectMake(0,  HEADER_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  
                                                 // self.firstTextView.hidden = NO;
                                                  
                                              } else {
                                                  NSLog(@"second");
                                                  
                                               //   self.secondTextView.hidden = YES;
                                      
                                
                                                  [self.firstTextView setFrame:CGRectMake(0,  CONTENT_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  [self.firstHeaderTextView setFrame:CGRectMake(0,  HEADER_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                   
                                                  [self.secondTextView setFrame:CGRectMake(0,  800   , TEXT_WIDTH,TEXT_HEIGHT)];
                                                  [self.secondHeaderTextView setFrame:CGRectMake(0,  800   , TEXT_WIDTH,TEXT_HEIGHT)];
                                                 //   self.secondTextView.hidden = NO;
                                              }
  
                                          }];
                         /*
                         if (self.firstTextView.frame.origin.y == -100) {
                             NSLog(@"first");
                             self.firstTextView.hidden = YES;
                             self.firstHeaderTextView.hidden = YES;
                             self.avatarPointer.hidden = YES;
                             //[self.firstHeaderTextView setFrame:CGRectMake(0,  800   , 300, 300)];
                             [self.firstTextView setFrame:CGRectMake(0,  800   , self.view.frame.size.width, self.view.frame.size.height)];
                              //[self.secondHeaderTextView setFrame:CGRectMake(0,  100   , 300, 300)];
                             [self.secondTextView setFrame:CGRectMake(0,  300   , self.view.frame.size.width, self.view.frame.size.height)];

                         } else {
                             NSLog(@"second");

                             self.secondTextView.hidden = YES;
                             self.secondHeaderTextView.hidden = YES;
                             //[self.firstHeaderTextView setFrame:CGRectMake(0,  100   , 300, 300)];
                             [self.firstTextView setFrame:CGRectMake(0,  300   , self.view.frame.size.width, self.view.frame.size.height)];
                              //[self.secondHeaderTextView setFrame:CGRectMake(0,  800   , 300, 300)];
                             [self.secondTextView setFrame:CGRectMake(0,  800   , self.view.frame.size.width, self.view.frame.size.height)];
                         }*/
                     }];
    

}



- (void)swipeDetected:(UISwipeGestureRecognizer *)gesture
{
    
    NSLog(@"swipe");
  //  [self moveOldView];
    switch (gesture.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            // you can include this case too
             [self moveUp];
            break;
        case UISwipeGestureRecognizerDirectionDown:
            // you can include this case too
            NSLog(@"down");

            break;
        case UISwipeGestureRecognizerDirectionLeft:
        case UISwipeGestureRecognizerDirectionRight:
            // disable timer for both left and right swipes.
            break;
        default:
            break;
    }
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
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeRecognizer];
    
    UISwipeGestureRecognizer *swipeRecognizerDown =
    [[UISwipeGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(swipeDetected:)];
    swipeRecognizerDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeRecognizerDown];
}

- (void) initUserAvatar
{
    UIImageView *avatarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_0855.JPG"]];
    [ImageHandler setRoundedAvatarInPlayingWindowAtFirstView:avatarView toDiameter:300 atCell:self.view];
    [self.view addSubview: avatarView];
    self.avatarPointer = avatarView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUserAvatar];
    [self initSwipe];
    

    
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"yellow.png" ] forBarMetrics:UIBarMetricsDefault];
    
   // [self setRoundedView:avatarView toDiameter:10.0];


	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void) editButtonSelected: (id) sender
{
        UITableView *tableView = [self.view.subviews firstObject];
    if (tableView.editing) {
        self.navigationBar.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonSelected:)] ;
        [tableView setEditing:NO animated:YES];
    } else {
        self.navigationBar.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editButtonSelected:)] ;
        [tableView setEditing:YES animated:YES];
        
    }
    
}*/
-(void)viewDidAppear:(BOOL)animated
{
 //   NSLog(@"display subview = %@", self.view.subviews);
 //   UITableView *tableView = [self.view.subviews firstObject];
//    [tableView setEditing: YES animated: YES];
 //   self.navigationBar.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonSelected:)] ;
}

@end
