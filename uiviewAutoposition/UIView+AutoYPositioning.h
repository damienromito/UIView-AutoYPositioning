//
//  UIView+AutoPosition.h
//  uiviewAutoposition
//
//  Created by Damien Romito on 05/03/2014.
//  Copyright (c) 2014 Damien Romito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AutoYPositioning)


@property (nonatomic) NSUInteger yIndex;

+ (void)autoPositioningInContainer:(UIView*)containerView resized:(BOOL)resized withTopMargin:(float)margin;
+ (void)autoPositioningInContainer:(UIView*)containerView resized:(BOOL)resized;
+ (void)autoPositioningInContainer:(UIView*)containerView withTopMargin:(float)margin;
+ (void)autoPositioningInContainer:(UIView*)containerView;
- (void)setYIndex:(NSUInteger)yIndex;

@end
