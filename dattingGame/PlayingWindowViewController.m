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
            int r = arc4random() % 5;
            self.infoWindow.hidden = NO;
            if (r/2) {
                self.infoWindow.text = @"doi tuong thay to mo ve ban";
                [textAnimation showInfoText: self.infoWindow];

            } else {
               // self.view.hidden = YES;
                self.infoWindow.text = @"doi tuong bo di";
                [textAnimation showInfoText: self.infoWindow];
            }
        });
        
    });
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

@end
