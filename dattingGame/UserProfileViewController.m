//
//  UserProfileViewController.m
//  dattingGame
//
//  Created by huyheo on 10/25/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import "UserProfileViewController.h"
#import "tableCell.h"
#import "ConstantDefinition.h"
#import "textAnimation.h"


@interface UserProfileViewController ()


@end

@implementation UserProfileViewController

-(NSMutableDictionary *)returnTestValue
{
    NSInteger position = 0;
    
    
    NSArray *q1 = @[@"question1", @"I started to wonder, where are you among more than seven billion people in this world?. It seems really really difficult! I have asked myself same questions thousand times"];
    NSArray *q2 = @[@"THe first things people usually notice about me", @"Young Bookish  Cute Silent"];
    NSArray *q3 = @[@"Favorite books, movies show, music", @"seafood"];
    NSArray *q4 = @[@"The six things i could never do without", @"Family, Friends, A Job"];
    NSArray *q5 = @[@"Im looking for ", @"Straight guy only"];
    NSArray *q6 = @[@"You should message me if", @"I'm a kind of person who has EQ level higher than normal, so quite sensitive. If you like my profile and wanna start a conversation, just send me a msg. In case you don't receive my reply, it's totally from me! You are cool as always ;)"];
    NSArray *infoArray = @[q1,q2,q3,q4,q5, q6];
    
    
    NSMutableDictionary *data = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithInteger:position], @"position",
                                 infoArray, @"contentArray",
                                 nil];
    return data;
}

- (void)swipeDetected:(UISwipeGestureRecognizer *)gesture
{
    
    NSLog(@"swipe");
  //  [self moveOldView];

    switch (gesture.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            // you can include this case too
           //  [self moveUp];

            [textAnimation animateTwoText:self.firstTextView andHeaderText:self.firstHeaderTextView withOtherText:self.secondTextView withHeaderText:self.secondHeaderTextView withAvatarImg:self.avatarPointer withData:self.profileInfo ];
            break;
        case UISwipeGestureRecognizerDirectionDown:
            // you can include this case too
            NSLog(@"down");
                [self.firstTextView resignFirstResponder];
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


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    DebugLog(@"begin edit");
    return TRUE;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    DebugLog(@"end edit");
    return TRUE;
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUserAvatar];
    [self initSwipe];
    
    [self setEditable:NO];
    self.firstTextView.delegate = self;
    self.secondTextView.delegate = self;
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"yellow.png" ] forBarMetrics:UIBarMetricsDefault];
    
    self.profileInfo  = [self returnTestValue];
    
    [textAnimation updateFlyingTextInfo:self.profileInfo textContentPointer:self.firstTextView textHeaderPointer:self.firstHeaderTextView ];
    [textAnimation updateFlyingTextInfo:self.profileInfo textContentPointer:self.secondTextView textHeaderPointer:self.secondHeaderTextView];
   // [self setRoundedView:avatarView toDiameter:10.0];


	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)playSettingButton:(id)sender {
    NSLog(@"editPlayButton");
    NSString *buttonName = [sender titleForState:UIControlStateNormal];
    if ([buttonName isEqualToString: @"Play"]) {
         [self performSegueWithIdentifier:     @"go_to_play" sender: NULL];
        // do something
        // lets play
    } else if ([buttonName isEqualToString: @"Setting"]) {
        // lets do setting
    }
}

-(void) setEditable: (BOOL) option{
    self.firstTextView.editable = option;
    self.secondTextView.editable = option;
    self.firstHeaderTextView.editable = option;
    self.secondHeaderTextView.editable = option;
}

- (IBAction)editButton:(id)sender {

    NSString *buttonName = [sender titleForState:UIControlStateNormal];
    if ([buttonName isEqualToString: @"Edit"]) {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditable:YES];
    //    self.playButton.title = @"Setting";

    } else if ([buttonName isEqualToString: @"Done"]) {
     [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditable:NO];
        self.playButton.title = @"Play";
    }
}
@end
