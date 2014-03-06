//
//  UIView+AutoPosition.m
//  uiviewAutoposition
//
//  Created by Damien Romito on 05/03/2014.
//  Copyright (c) 2014 Damien Romito. All rights reserved.
//

#import "UIView+AutoYPositioning.h"


/******************************************** RULES **************************************************/

// - NOT FORGET INTEGER BETWEEN TWO YINDEX
// i.e : v1.YIndex = 0, v2.YIndex = 1, v3.YIndex = 2 (And not 10 or 99 or more) */

// - START THE YINDEX TO "0" */

// - 100 SUBVIEWS MAXIMUM

// - NOT TAG A VIEW YOU WANT POSITIONED

/*****************************************************************************************************/

static const NSUInteger START_INTERVAL_Y = 94783;
static const NSUInteger END_INTERVAL_Y = 94883;

@implementation UIView (AutoYPositioning)

- (void)setYIndex:(NSUInteger)yIndex
{

    if (yIndex < 100)
    {
        self.tag = yIndex + START_INTERVAL_Y;
    }else
    {
        NSLog(@"(UIView+AutoPosition.h) : YIndex must be < 100");
    }
}

- (NSUInteger)yIndex
{
    if(self.tag > START_INTERVAL_Y && self.tag < END_INTERVAL_Y)
    {
        return self.tag - START_INTERVAL_Y;
    }else
    {
        NSLog(@"(UIView+AutoPosition.h) : Any View at this Y Index");
        return NAN;
    }
}

+ (void)autoPositioningInContainer:(UIView*)containerView resized:(BOOL)resized withTopMargin:(float)margin
{
    float currentHeight = margin;
    NSLog(@"SUBVIEW COUNT %i",[containerView subviews].count);
    
    for (int i = 0 ; i< [containerView subviews].count; i++) {
        
        UIView* v = [containerView viewWithTag:START_INTERVAL_Y + i];
        if (v) {
            CGRect frame = v.frame;
            frame.origin.y = currentHeight;
            currentHeight += margin + frame.size.height;
            v.frame = frame;
        }else
        {
            if (i == 0) {
                NSLog(@"(UIView+AutoPosition.h) : Your first View must be have YIndex = 0 and you must increment of 1 (not more)");
            }
            break;
        }
    }
    
    if (resized && currentHeight > margin) {
        CGRect frame = containerView.frame;
        frame.size.height = currentHeight;
        containerView.frame = frame;
    }
    
}

+ (void)autoPositioningInContainer:(UIView*)containerView withTopMargin:(float)margin
{
    [self autoPositioningInContainer:containerView resized:NO withTopMargin:margin];
}


+ (void)autoPositioningInContainer:(UIView*)containerView resized:(BOOL)resized
{
    [self autoPositioningInContainer:containerView resized:resized withTopMargin:0];
}


+ (void)autoPositioningInContainer:(UIView*)containerView;
{
    [self autoPositioningInContainer:containerView resized:NO withTopMargin:0];
}

@end
