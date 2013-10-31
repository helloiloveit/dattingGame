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
@property (strong, nonatomic) UIImageView *avatarPointer;
@property (strong, nonatomic) NSMutableDictionary *profileInfo;

@end

@implementation UserProfileViewController

-(NSMutableDictionary *)returnTestValue
{
    NSInteger position = 0;
    
    
    NSArray *q1 = @[@"question1", @"asnwer1"];
    NSArray *q2 = @[@"question2", @"asnwer2"];
    NSArray *q3 = @[@"question3", @"asnwer3"];
    NSArray *q4 = @[@"question4", @"asnwer4"];
    NSArray *q5 = @[@"question5", @"asnwer5"];
    NSArray *q6 = @[@"question6", @"asnwer6"];
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
