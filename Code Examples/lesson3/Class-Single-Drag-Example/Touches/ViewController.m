//
//  ViewController.m
//  Touches
//
//  Created by Freshman on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) BOOL isDragging;
@property (nonatomic) CGPoint dragPointDiff;
@end

@implementation ViewController
@synthesize coordLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setCoordLabel:nil];
    [self setBoxView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.view];
    
    NSLog(@"Get a touch began at (%.2f, %.2f)", point.x, point.y);
    
    coordLabel.text = [NSString stringWithFormat:@"(%.2f, %.2f)", point.x, point.y];
    
    if (CGRectContainsPoint(self.boxView.frame, point)) {
        NSLog(@"Yes, let's drag the box");
        self.isDragging = YES;
        self.dragPointDiff = CGPointMake(point.x-self.boxView.center.x, point.y-self.boxView.center.y);

    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.view];
    
    NSLog(@"Get a touch began at (%.2f, %.2f)", point.x, point.y);
    
    coordLabel.text = [NSString stringWithFormat:@"(%.2f, %.2f)", point.x, point.y];
    
    if (self.isDragging) {
        self.boxView.center = CGPointMake(point.x - self.dragPointDiff.x, point.y - self.dragPointDiff.y);
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    coordLabel.text = @"Not Touching";
    self.isDragging = NO;
}



@end
