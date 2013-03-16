//
//  ViewController.m
//  Touches
//
//  Created by Freshman on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) CGPoint dragPointDiff1;
@property (nonatomic) CGPoint dragPointDiff2;
@property (nonatomic) UITouch *touchForBox1;
@property (nonatomic) UITouch *touchForBox2;
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
    [self setBoxView2:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in [touches allObjects]) {
        
        CGPoint point = [touch locationInView:self.view];
        
        coordLabel.text = [NSString stringWithFormat:@"(%.2f, %.2f)", point.x, point.y];
        
        if (CGRectContainsPoint(self.boxView.frame, point)) {
            self.touchForBox1 = touch;
            self.dragPointDiff1 = CGPointMake(point.x-self.boxView.center.x, point.y-self.boxView.center.y);
        }
        else if (CGRectContainsPoint(self.boxView2.frame, point)) {
            self.touchForBox2 = touch;
            self.dragPointDiff2 = CGPointMake(point.x-self.boxView2.center.x, point.y-self.boxView2.center.y);
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in [touches allObjects]) {    
        CGPoint point = [touch locationInView:self.view];
        
//        coordLabel.text = [NSString stringWithFormat:@"(%.2f, %.2f)", point.x, point.y];
        
        if (touch == self.touchForBox1) {
            self.boxView.center = CGPointMake(point.x - self.dragPointDiff1.x, point.y - self.dragPointDiff1.y);
        } else if (touch == self.touchForBox2) {
            self.boxView2.center = CGPointMake(point.x - self.dragPointDiff2.x, point.y - self.dragPointDiff2.y);
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    coordLabel.text = @"Not Touching";
    for (UITouch *touch in [touches allObjects]) {
        if (touch == self.touchForBox1) {
            self.touchForBox1 = nil;
        }
        else {
            self.touchForBox2 = nil;
        }
    }
}



@end







