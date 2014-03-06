//
//  ViewController.m
//  uiviewAutoposition
//
//  Created by Damien Romito on 05/03/2014.
//  Copyright (c) 2014 Damien Romito. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AutoYPositioning.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*****************************************************************************************************/
   
    // /!\ NOT FORGET INTEGER BETWEEN TWO YINDEX
    // i.e : v1.YIndex = 0, v2.YIndex = 1, v3.YIndex = 2 (And not 10 or 99 or more) */

    // /!\ START THE YINDEX TO "0" */

    // /!\ 100 SUBVIEWS MAXIMUM

    /*****************************************************************************************************/
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(20, 50, 280, 0)];
    container.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:container];
    
    UIView* v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 190, 30)];
    v1.backgroundColor = [UIColor redColor];
    [v1 setYIndex:1];
    [container addSubview:v1];
    
    UILabel *v2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    v2.text = @"View at YIndex 1";
    [v2 setYIndex:0];
    [container addSubview:v2];
    
    UIImageView *v3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whyd-logo"]];
    [v3 setYIndex:2];
    [container addSubview:v3];
    
    UILabel *v4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    v4.text = @"View at YIndex 4";
    [v4 setYIndex:3];
    [container addSubview:v4];
    
    //VIEW NOT AUTO POSITIONED
    UIView *otherSubview = [[UIView alloc] initWithFrame:CGRectMake(20, 350, 100, 30)];
    otherSubview.backgroundColor = [UIColor blueColor];
    otherSubview.tag = 100;
    [container addSubview:otherSubview];

    
    [UIView autoPositioningInContainer:container resized:YES withTopMargin:5];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
