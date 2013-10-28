//
//  ImageHandler.m
//  dattingGame
//
//  Created by huyheo on 10/28/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import "ImageHandler.h"

@implementation ImageHandler


+ (void)setRoundedView:(UIImageView *)avatarView toDiameter:(float)newSize atCell:(UIView *)cell;
{
    avatarView.layer.cornerRadius = newSize/2;
    avatarView.clipsToBounds = YES;
    // cant get cell.frame.size.height here . because it is not the correct return number  exp: 300
    avatarView.frame = CGRectMake(0, 0, newSize, newSize);
    CGPoint centerValue = CGPointMake(cell.frame.size.width/2, newSize/2);
    avatarView.center = centerValue;
}

+ (void)setRoundedAvatarInPlayingWindow:(UIImageView *)avatarView toDiameter:(float)newSize atCell:(UIView *)cell;
{
    avatarView.layer.cornerRadius = newSize/2;
    avatarView.clipsToBounds = YES;
    // cant get cell.frame.size.height here . because it is not the correct return number  exp: 300
    avatarView.frame = CGRectMake(0, 0, newSize, newSize);
    CGPoint centerValue = CGPointMake(cell.frame.size.width/2, newSize/2);
    avatarView.center = centerValue;
}
@end
