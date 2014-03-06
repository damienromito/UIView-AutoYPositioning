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
    @property (nonatomic, strong) UIView *container;
    @property (nonatomic, strong) UIView *v1;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /******************************************** RULES **************************************************/
   
    // - NOT FORGET INTEGER BETWEEN TWO YINDEX
    // i.e : v1.YIndex = 0, v2.YIndex = 1, v3.YIndex = 2 (And not 10 or 99 or more) */

    // - START THE YINDEX TO "0" */

    // - 100 SUBVIEWS MAXIMUM

    // - NOT TAG A VIEW YOU WANT POSITIONED
    
    /*****************************************************************************************************/
    
    self.container = [[UIView alloc] initWithFrame:CGRectMake(20, 50, 280, 0)];
    self.container.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.container];
    
    self.v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 190, 30)];
    self.v1.backgroundColor = [UIColor redColor];
    [self.v1 setYIndex:1];
    [self.container addSubview:self.v1];
    
    UILabel *v2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    v2.text = @"View at YIndex 1";
    [v2 setYIndex:0];
    [self.container addSubview:v2];
    
    UIView *v3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whyd-logo"]];
    [v3 setYIndex:2];
    [self.container addSubview:v3];
    
    UILabel *v4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    v4.text = @"View at YIndex 4";
    [v4 setYIndex:3];
    [self.container addSubview:v4];
    
    //VIEW NOT AUTO POSITIONED
    UIView *otherSubview = [[UIView alloc] initWithFrame:CGRectMake(20, 350, 100, 30)];
    otherSubview.backgroundColor = [UIColor blueColor];
    otherSubview.tag = 100;
    [self.container addSubview:otherSubview];
    
    UIButton* changeButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 400, 150, 40)];
    changeButton.backgroundColor = [UIColor blueColor];
    [changeButton setTitle:@"CHANGE HEIGHT" forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(actionChange) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeButton];
    
    UIButton* reloadButton = [[UIButton alloc] initWithFrame:CGRectMake(190, 400, 100, 40)];
    reloadButton.backgroundColor = [UIColor blueColor];
    [reloadButton setTitle:@"RELOAD" forState:UIControlStateNormal];
    [reloadButton addTarget:self action:@selector(actionReload) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reloadButton];

    [self actionReload];
}

- (void)actionChange
{
    int randomHeight = arc4random() % 74;
    CGRect frame = self.v1.frame;
    frame.size.height = (float) randomHeight;
    self.v1.frame = frame;
}


- (void)actionReload
{
    [UIView autoPositioningInContainer:self.container resized:YES withTopMargin:5];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
