//
//  ImageHandler.h
//  dattingGame
//
//  Created by huyheo on 10/28/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface ImageHandler : NSObject


+ (void)setRoundedView:(UIImageView *)avatarView toDiameter:(float)newSize atCell:(UITableViewCell *)cell;


+ (void)setRoundedAvatarInPlayingWindow:(UIImageView *)avatarView toDiameter:(float)newSize atCell:(UIView *)cell;

+ (void)setRoundedAvatarInPlayingWindowAtFirstView:(UIImageView *)avatarView toDiameter:(float)newSize atCell:(UIView *)cell;

+ (void)setBackGroundImageWithUserAvatar:(UIImageView *)avatarView toDiameter:(float)newSize atCell:(UIView *)cell;
@end
