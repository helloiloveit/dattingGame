//
//  textAnimation.h
//  dattingGame
//
//  Created by huyheo on 10/31/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface textAnimation : NSObject


+ (void) updateFlyingTextInfo: (NSMutableDictionary *)dataDic
textContentPointer            :  (UITextView *)textInfo
textHeaderPointer              : (UITextView *)textHeaderInfo;

+(void)animateTwoText: (UITextView *)firstText
     andHeaderText: (UITextView *)firstHeaderText
     withOtherText: (UITextView *)secondText
    withHeaderText: (UITextView *)secondHeaderText
     withAvatarImg: (UIImageView *)avatarPointer
             withData:(NSMutableDictionary *)data;


+ (void)clearInfoText: (UITextView *)text;
+ (void)showInfoText: (UITextView *)text;
@end
