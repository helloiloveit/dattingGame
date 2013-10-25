//
//  UserProfileViewController.m
//  dattingGame
//
//  Created by huyheo on 10/25/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import "UserProfileViewController.h"
#import "tableCell.h"
#import <QuartzCore/QuartzCore.h>

@interface UserProfileViewController ()

@end

@implementation UserProfileViewController

-(void)setRoundedView:(UIImageView *)roundedView toDiameter:(float)newSize;
{
    CGPoint saveCenter = roundedView.center;
    CGRect newFrame = CGRectMake(roundedView.frame.origin.x, roundedView.frame.origin.y, newSize, newSize);
    roundedView.frame = newFrame;
    roundedView.layer.cornerRadius = newSize / 2.0;
    roundedView.center = saveCenter;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (tableCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cellforrowatindexPath");
    static NSString *CellIdentifier = @"Cell";
    
    tableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[tableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
//    UIImageView *avatarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_0855.JPG"]];
  //  [cell addSubview: avatarView];

    switch (indexPath.row) {
        case 0:{
            NSLog(@"sdfdf");
            UIImageView *avatarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_0855.JPG"]];

            [self setRoundedView:avatarView toDiameter:10.0];
            [cell addSubview: avatarView];
            
        };
            break;
        case 1:
            {
            NSLog(@"2");
                cell.question.text  = @"Ban dang lam gi voi cuoc song cua ban";
                cell.answer.text  = @"Co gang tro thanh designer";
            };
            break;
        case 2:
        {
            NSLog(@"2");
            cell.question.text  = @"Ban dang lam gi voi cuoc song cua ban";
            cell.answer.text  = @"Co gang tro thanh designer";
        };
            break;
        case 3:
        {
            NSLog(@"2");
            cell.question.text  = @"Ban dang lam gi voi cuoc song cua ban";
            cell.answer.text  = @"Co gang tro thanh designer";
        };
            break;
        case 4:
        {
            NSLog(@"2");
            cell.question.text  = @"Ban dang lam gi voi cuoc song cua ban";
            cell.answer.text  = @"Co gang tro thanh designer";
        };
            break;
        case 5:
        {
            cell.question.text  = @"Ban dang lam gi voi cuoc song cua ban";
            cell.answer.text  = @"Co gang tro thanh designer";
        };
            break;
        default:
        {
            cell.question.text  = @"Ban dang lam gi voi cuoc song cua ban";
            cell.answer.text  = @"Co gang tro thanh designer";
        }
            break;
    }
    
    return cell;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 200;
    }
    return 80;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
