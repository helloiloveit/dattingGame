//
//  UserProfileViewController.h
//  dattingGame
//
//  Created by huyheo on 10/25/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageHandler.h"

@interface UserProfileViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

@end
