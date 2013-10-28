//
//  UserProfileViewController.m
//  dattingGame
//
//  Created by huyheo on 10/25/13.
//  Copyright (c) 2013 huyheo. All rights reserved.
//

#import "UserProfileViewController.h"
#import "tableCell.h"


@interface UserProfileViewController ()

@end

@implementation UserProfileViewController







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


    switch (indexPath.row) {
        case 0:{
            NSLog(@"sdfdf");
            UIImageView *avatarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"me.JPG"]];
            [ImageHandler setRoundedView:avatarView toDiameter:300 atCell:cell];
            [cell addSubview: avatarView];
            
        };
            break;
        case 1:
            {
            NSLog(@"2");

                NSString *string = @"Be sure you put your feet in the right place, then stand firm";
              //  CGSize stringSize = [string sizeWithFont:[UIFont boldSystemFontOfSize:15] constrainedToSize:CGSizeMake(320, 9999) lineBreakMode:UILineBreakModeWordWrap];
                
            //    UITextView *textV=[[UITextView alloc] initWithFrame:CGRectMake(5, 5, 290, stringSize.height+10)];
                UITextView *textV = [[UITextView alloc] initWithFrame:CGRectMake(5, 5, 290, 50)];
                textV.font = [UIFont systemFontOfSize:15.0];
                textV.text=string;
                textV.textColor=[UIColor blackColor];
                textV.editable=NO;
                [cell.contentView addSubview:textV];
                
                cell.question.hidden = YES;
                cell.answer.hidden = YES;


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
        return 300;
    }
    return 80;
}
-(UIImage *)makeRoundedImage:(UIImage *) image
                      radius: (float) radius;
{
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    imageLayer.contents = (id) image.CGImage;
    
    imageLayer.masksToBounds = YES;
    imageLayer.cornerRadius = radius;
    
    UIGraphicsBeginImageContext(image.size);
    [imageLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return roundedImage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"yellow.png" ] forBarMetrics:UIBarMetricsDefault];
    
   // [self setRoundedView:avatarView toDiameter:10.0];


	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void) editButtonSelected: (id) sender
{
        UITableView *tableView = [self.view.subviews firstObject];
    if (tableView.editing) {
        self.navigationBar.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonSelected:)] ;
        [tableView setEditing:NO animated:YES];
    } else {
        self.navigationBar.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editButtonSelected:)] ;
        [tableView setEditing:YES animated:YES];
        
    }
    
}*/
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"display subview = %@", self.view.subviews);
    UITableView *tableView = [self.view.subviews firstObject];
    [tableView setEditing: YES animated: YES];
 //   self.navigationBar.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonSelected:)] ;
}

@end
