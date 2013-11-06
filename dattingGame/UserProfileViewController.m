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
    
    
    NSArray *q1 = @[@"question1", @"Có một công việc trong mơ cùng với bạn bè tốt"];
    NSArray *q2 = @[@"Tính cách gì ở bạn khiến bạn hài lòng nhất", @"Không bao giờ từ bỏ thứ mình muốn"];
    NSArray *q3 = @[@"Bạn không thể sống thiếu :", @"Gia đình, Bạn bè và công việc"];
    NSArray *q4 = @[@"Thứ gì khiến bạn cảm thấy hạnh phúc", @"Gặp gỡ chat chit với bạn bè sau một ngày làm việc vất vả"];
    NSArray *q5 = @[@"Tính cách gì bạn không thể chịu nổi ", @"Phân biệt giới tính, vùng miền "];
    NSArray *q6 = @[@"Bạn thường làm gì cuối tuần", @"Đi du lịch với bạn bè, cắm trại hoặc đơn giản là cafe cả ngày"];
  //  NSMutableArray *infoArray = @[q1,q2,q3,q4,q5, q6];
    NSMutableArray *infoArray = [NSMutableArray arrayWithObjects:q1,q2,q3,q4,q5,q6,nil];
    
    NSMutableDictionary *data = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithInteger:position], @"position",
                                 infoArray, @"contentArray",
                                 nil];
    return data;
}
-(void)turnOffKeyBoard
{
    [self.firstTextView resignFirstResponder];
    [self.secondTextView resignFirstResponder];
    [self.firstHeaderTextView resignFirstResponder];
    [self.secondHeaderTextView  resignFirstResponder];
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
                [self turnOffKeyBoard];
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"swpie left");
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"swipe right");
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
    
    UISwipeGestureRecognizer *swipeRecognizerRemove =
    [[UISwipeGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(swipeDetected:)];
    swipeRecognizerRemove.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeRecognizerRemove];
}

- (void) initUserAvatar
{
    UIImageView *avatarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_0855.JPG"]];
    [ImageHandler setBackGroundImageWithUserAvatar:avatarView toDiameter:300 atCell:self.view];
   // self.view.contentMode = UIViewContentModeScaleAspectFit;

  //  avatarView.layer.cornerRadius = 400/2;
  //  avatarView.clipsToBounds = YES;
    // cant get cell.frame.size.height here . because it is not the correct return number  exp: 300

  //  self.view.contentMode = UIViewContentModeScaleAspectFit;
    self.avatarPointer = avatarView;
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    DebugLog(@"begin edit");
    return TRUE;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    DebugLog(@"end edit");
    DebugLog(@"user value = %@", self.profileInfo);
    NSLog(@"position of firstView x = %f", self.firstHeaderTextView.frame.origin.x);
    NSLog(@"position of firstView y = %f", self.firstHeaderTextView.frame.origin.y);
    NSLog(@"position of firstView x = %f", self.secondHeaderTextView.frame.origin.x);
    NSLog(@"position of second y = %f", self.secondHeaderTextView.frame.origin.y);
    if (self.firstHeaderTextView.frame.origin.y == HEADER_TEXT_POSITION) {
        [textAnimation updateEditedText:self.profileInfo textContentPointer:self.firstTextView textHeaderPointer:self.firstHeaderTextView];
    } else if (self.secondHeaderTextView.frame.origin.y == HEADER_TEXT_POSITION) {
        [textAnimation updateEditedText:self.profileInfo textContentPointer:self.secondTextView  textHeaderPointer:self.secondHeaderTextView];
    }
    return TRUE;
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad
{
    DebugLog(@"");
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
