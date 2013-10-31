//
//  textAnimation.m
//  dattingGame
//
//  Created by huyheo on 10/31/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import "textAnimation.h"
#import "ConstantDefinition.h"

@implementation textAnimation

+ (void) updatePositionCount: (NSMutableDictionary *)dataDic {
    
    NSNumber *numberPointer = dataDic[@"position"] ;
    
    int value = [dataDic[@"position"] intValue];
    
    numberPointer = [NSNumber numberWithInt:value + 1];
    [dataDic setObject:numberPointer  forKey:@"position"];
    
    NSLog(@"positionee = %d", [numberPointer intValue]);
    NSLog(@"position = %d", [dataDic[@"position"] intValue]);
}

+ (void) updateFlyingTextInfo: (NSMutableDictionary *)dataDic
         textPointer            :  (UITextView *)textInfo
{
    if ([self checkIfLastInfoIsReached: dataDic]){
        [self updatePositionCount:dataDic ];
        return;
    }
    NSArray *temp = dataDic[@"contentArray"];
    NSInteger myInteger = [dataDic[@"position"] integerValue];
    textInfo.text = [temp objectAtIndex:myInteger] ;
    [self updatePositionCount:dataDic  ];
}

+ (BOOL) checkIfLastInfoIsReached: (NSMutableDictionary *)dataDic {
    NSInteger myInteger = [dataDic[@"position"] integerValue];
    NSArray *temp = dataDic[@"contentArray"];
    NSLog(@" info last check postion = %d count array %d", myInteger, [temp count]);
    if (myInteger >= [temp count]  ) {
        return TRUE;
    }
    
    return FALSE;
}
+ (BOOL) checkifFlyingTextLastTime: (NSMutableDictionary *)dataDic {
    NSInteger myInteger = [dataDic[@"position"] integerValue];
    NSArray *temp = dataDic[@"contentArray"];
    NSLog(@" info last check postion = %d count array %d", myInteger, [temp count]);
    if (myInteger == [temp count] + 1 ) {
        return TRUE;
    }
    
    return FALSE;
}


+ (BOOL)checkIfTextWillBeAnimated:(NSMutableDictionary *) dataDic
{
    NSInteger myInteger = [dataDic[@"position"] integerValue];
    NSArray *temp = dataDic[@"contentArray"];
    NSLog(@" info last check postion = %d count array %d", myInteger, [temp count]);
    if (myInteger < [temp count] + 1 ) {
        return TRUE;
    }
    return TRUE;
}

+(void)animateTwoText: (UITextView *)firstText
     andHeaderText: (UITextView *)firstHeaderText
     withOtherText: (UITextView *)secondText
    withHeaderText: (UITextView *)secondHeaderText
     withAvatarImg: (UIImageView *)avatarPointer
             withData:(NSMutableDictionary *)data
        
{

    //NSLog(@"list subview of view = %@", self.view.subviews);
    NSLog(@"position of firstView x = %f", firstText.frame.origin.x);
    NSLog(@"position of firstView y = %f", firstText.frame.origin.y);
    NSLog(@"position of secondV x = %f", secondText.frame.origin.x);
    NSLog(@"position of secondV y = %f", secondText.frame.origin.y);

    
    if ([self checkifFlyingTextLastTime:data]) {
        return;
    }
    
    
    [UIView animateWithDuration:1
                          delay:0
                        options: UIViewAnimationCurveEaseInOut
                     animations:^{
                         if (firstText.frame.origin.y == ABOUT_ME_TEXT_POSITION)  {
                             avatarPointer.alpha = 0;
                             firstText.alpha = 0;
                             [firstText setFrame:CGRectMake(0,  -100   , TEXT_WIDTH, TEXT_HEIGHT)];
                             [avatarPointer setFrame:CGRectMake(0,  -600   , avatarPointer.frame.size.width, avatarPointer.frame.size.height)];
                         }
                         else if (firstText.frame.origin.y == CONTENT_TEXT_POSITION) {
                             NSLog(@"move first view");
                             [firstHeaderText setFrame:CGRectMake(0,  -100   , TEXT_WIDTH, TEXT_HEIGHT)];
                             [firstText setFrame:CGRectMake(0,  -100   , TEXT_WIDTH, TEXT_HEIGHT)];
                             
                         } else {
                             NSLog(@" move second view");
                             [secondText setFrame:CGRectMake(0,  -100   , TEXT_WIDTH, TEXT_HEIGHT)];
                             [secondHeaderText setFrame:CGRectMake(0,  -100   , TEXT_WIDTH, TEXT_HEIGHT)];
                         }
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         [UIView animateWithDuration:1
                                               delay:0
                                             options: UIViewAnimationCurveEaseOut
                                          animations:^{
                                              if ((firstText.frame.origin.y == -100)) {
                                                  NSLog(@"second view comming");
                                                  
                                                  [secondText setFrame:CGRectMake(0,  CONTENT_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  [secondHeaderText setFrame:CGRectMake(0,  HEADER_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                              } else if (secondText.frame.origin.y == -100) {
                                                  NSLog(@"first view comming");
                                                  firstHeaderText.hidden = NO;
                                                  [firstText setFrame:CGRectMake(0,  CONTENT_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  [firstHeaderText setFrame:CGRectMake(0,  HEADER_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  
                                              }
                                          }
                                          completion:^(BOOL finished){
                                              NSLog(@"Done!");
                                              
                                              if ((firstText.frame.origin.y == -100)) {
                                                  NSLog(@"first");
                                                  //firstText.hidden = YES;
                                                  firstText.alpha = 1;
                                                  [firstText setFrame:CGRectMake(0,  800   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  [firstHeaderText setFrame:CGRectMake(0,  800   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  [secondText setFrame:CGRectMake(0,  CONTENT_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  [secondHeaderText setFrame:CGRectMake(0,  HEADER_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  
                                                  // firstText.hidden = NO;
                                                  
                                                  //update Text
                                                  [self updateFlyingTextInfo:data textPointer:firstText ];
                                                  
                                              } else {
                                                  NSLog(@"second");
                                                  
                                                  //   secondText.hidden = YES;
                                                  
                                                  
                                                  [firstText setFrame:CGRectMake(0,  CONTENT_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  [firstHeaderText setFrame:CGRectMake(0,  HEADER_TEXT_POSITION   , TEXT_WIDTH, TEXT_HEIGHT)];
                                                  
                                                  [secondText setFrame:CGRectMake(0,  800   , TEXT_WIDTH,TEXT_HEIGHT)];
                                                  [secondHeaderText setFrame:CGRectMake(0,  800   , TEXT_WIDTH,TEXT_HEIGHT)];
                                                  //   secondText.hidden = NO;
                                                  //update Text
                                                  [self updateFlyingTextInfo:data textPointer:secondText ];

                                              }
                                              
                                          }];
                     }];
    
    
}

@end
