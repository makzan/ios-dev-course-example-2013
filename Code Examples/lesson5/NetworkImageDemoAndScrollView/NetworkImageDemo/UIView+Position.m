//
//  UIView+Position.m
//  NetworkImageDemo
//
//  Created by Seng Hin Mak on 5/10/13.
//  Copyright (c) 2013 Thomas. All rights reserved.
//

#import "UIView+Position.h"

@implementation UIView (Position)

- (void)setX:(float)x y:(float)y
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    frame.origin.y = y;
    self.frame = frame;
}

@end




















