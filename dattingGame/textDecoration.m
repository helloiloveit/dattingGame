//
//  textDecoration.m
//  dattingGame
//
//  Created by huyheo on 11/6/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import "textDecoration.h"

@implementation textDecoration


+ (void) setInfoTextAtPlayingView: (UITextView *)infoText withInfo:(NSString *)info
{
    
    infoText.text = info;
    infoText.textColor = [UIColor whiteColor];
    infoText.textAlignment = NSTextAlignmentCenter;
    infoText.font = [UIFont fontWithName:@"Heiti TC" size:18];
    
    
}

@end
